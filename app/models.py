from sqlalchemy import Column, Integer, String, Date
from .database import Base

class Usuario(Base):
    __tablename__ = "usuario"
    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String(100), nullable=False)
    email = Column(String(100), unique=True, nullable=False)
    contrasena = Column(String(100), nullable=False)
    fecha_registro = Column(Date, nullable=False)
    tipo_suscripcion = Column(String(50), nullable=False)
