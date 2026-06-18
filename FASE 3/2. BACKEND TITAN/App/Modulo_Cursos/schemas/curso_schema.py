from pydantic import BaseModel
from datetime import date, time
from typing import Optional

class ProgramacionBase(BaseModel):
    id_curso: int
    fecha: date
    hora: time
    cupos: int
    id_usuario: int # ID del Instructor

class InscripcionBase(BaseModel):
    id_usuario: int # ID del Participante