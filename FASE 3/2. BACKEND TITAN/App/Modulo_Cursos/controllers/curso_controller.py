from sqlalchemy.orm import Session
from sqlalchemy import and_
from App.Modulo_Cursos.models.curso_model import ProgramacionCurso, Inscripcion, Certificado, Curso, Usuario, Salud
from fastapi import HTTPException, status
from datetime import date
from typing import Dict, Any

def programar_nuevo_curso(db: Session, data) -> Dict[str, Any]:
    # HU-E01 CA-02: Validar que el instructor no tenga otro curso a la misma fecha y hora
    conflicto = db.query(ProgramacionCurso).filter(
        and_(
            ProgramacionCurso.id_usuario == data.id_usuario,
            ProgramacionCurso.fecha == data.fecha,
            ProgramacionCurso.hora == data.hora
        )
    ).first()
    
    if conflicto:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, 
            detail="El instructor ya tiene un curso programado en este horario."
        )

    nueva_prog = ProgramacionCurso(**data.model_dump())
    db.add(nueva_prog)
    db.commit()
    db.refresh(nueva_prog)
    return {
        "id_programacion": nueva_prog.id_programacion,
        "id_curso": nueva_prog.id_curso,
        "fecha": nueva_prog.fecha
    }

def _validar_inscripcion_duplicada(db: Session, id_prog: int, id_user: int):
    """HU-E02 CA-03: No se permite inscripción duplicada."""
    if db.query(Inscripcion).filter(
        Inscripcion.id_programacion == id_prog, 
        Inscripcion.id_usuario == id_user
    ).first():
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="El usuario ya está inscrito en este curso.")

def _validar_aptitud_medica(db: Session, id_user: int):
    """HU-E03 CA-02: Validar Aptitud Médica vigente."""
    salud = db.query(Salud).filter(
        Salud.id_trabajador == id_user,
        Salud.apto == 'SI',
        Salud.fecha_vencimiento >= date.today()
    ).first()
    if not salud:
        raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Inscripción bloqueada: El trabajador no cuenta con examen médico de aptitud 'SI' o está vencido.")

def _validar_requisito_reentrenamiento(db: Session, id_user: int, prog: ProgramacionCurso):
    """HU-E03 CA-01: Requisito de certificado previo para Reentrenamiento."""
    if "reentrenamiento" in prog.curso.nombre_curso.lower():
        requisito = db.query(Certificado).filter(
            Certificado.id_usuario == id_user,
            Certificado.id_curso == prog.id_curso,
            Certificado.fecha_vencimiento >= date.today()
        ).first()
        if not requisito:
            raise HTTPException(status_code=status.HTTP_403_FORBIDDEN, detail="Inscripción bloqueada: Los cursos de reentrenamiento exigen un certificado previo vigente.")

def _validar_cupos(prog: ProgramacionCurso):
    """HU-E02 CA-01: Validar cupos disponibles."""
    if prog.cupos <= 0:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="El curso no tiene cupos disponibles.")

def inscribir_participante(db: Session, id_prog: int, id_user: int) -> Dict[str, Any]:
    # Inicia una transacción con bloqueo para manejar la concurrencia de cupos
    with db.begin_nested():
        # HU-E02 CA-03: Bloqueo de fila para manejo de concurrencia en cupos
        prog = db.query(ProgramacionCurso).filter(
            ProgramacionCurso.id_programacion == id_prog
        ).with_for_update().first()

        if not prog:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Programación no encontrada")

        # Ejecutar todas las validaciones
        _validar_cupos(prog)
        _validar_inscripcion_duplicada(db, id_prog, id_user)
        _validar_aptitud_medica(db, id_user)
        _validar_requisito_reentrenamiento(db, id_user, prog)

        # Si todas las validaciones pasan, proceder con la inscripción
        nueva_inscripcion = Inscripcion(id_programacion=id_prog, id_usuario=id_user)
        prog.cupos -= 1 
        
        db.add(nueva_inscripcion)
        db.flush() # Usamos flush para obtener el ID de la nueva inscripción

        return {
            "id_inscripcion": nueva_inscripcion.id_inscripcion,
            "cupos_restantes": prog.cupos
        }

    # HU-E02 CA-02: Registrar inscripción y descontar cupo
    nueva_inscripcion = Inscripcion(id_programacion=id_prog, id_usuario=id_user)
    prog.cupos -= 1 
    
    db.add(nueva_inscripcion)
    db.commit()
    return {"id_inscripcion": nueva_inscripcion.id_inscripcion, "cupos_restantes": prog.cupos}