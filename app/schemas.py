# Esquemas Pydantic para Usuario
from pydantic import BaseModel
from datetime import date

class UsuarioCreate(BaseModel):
    nombre: str
    email: str
    contrasena: str
    fecha_registro: date   # formato 'YYYY-MM-DD'
    tipo_suscripcion: str

class UsuarioRead(BaseModel):
    id: int
    nombre: str
    email: str
    fecha_registro: date
    tipo_suscripcion: str
    class Config:
        model_config = {"from_attributes": True}
