from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from App.Modulo_Cursos.config.database import get_db
from App.Modulo_Cursos.schemas.curso_schema import ProgramacionBase, InscripcionBase
from App.Modulo_Cursos.controllers import curso_controller

router = APIRouter(prefix="/api/cursos", tags=["Cursos"])

@router.post("/")
def crear_programacion(data: ProgramacionBase, db: Session = Depends(get_db)):
    return curso_controller.programar_nuevo_curso(db, data)

@router.post("/{id_programacion}/inscribir")
def inscribir(id_programacion: int, data: InscripcionBase, db: Session = Depends(get_db)):
    return curso_controller.inscribir_participante(db, id_programacion, data.id_usuario)

@router.get("/calendario")
def ver_calendario(db: Session = Depends(get_db)):
    from App.Modulo_Cursos.models.curso_model import ProgramacionCurso
    return db.query(ProgramacionCurso).all()