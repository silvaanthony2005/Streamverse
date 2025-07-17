from sqlalchemy.orm import Session
from app.models import Usuario
from app.schemas import UsuarioCreate

def crear_usuario_db(db: Session, usuario: UsuarioCreate):
    db_usuario = Usuario(**usuario.model_dump())
    db.add(db_usuario)
    db.commit()
    db.refresh(db_usuario)
    return db_usuario

def leer_usuario_db(db: Session, usuario_id: int):
    return db.query(Usuario).filter(Usuario.id == usuario_id).first()

def actualizar_usuario_db(db: Session, usuario_id: int, usuario: UsuarioCreate):
    db_usuario = db.query(Usuario).filter(Usuario.id == usuario_id).first()
    if db_usuario is None:
        return None
    for key, value in usuario.model_dump().items():
        setattr(db_usuario, key, value)
    db.commit()
    db.refresh(db_usuario)
    return db_usuario

def eliminar_usuario_db(db: Session, usuario_id: int):
    usuario = db.query(Usuario).filter(Usuario.id == usuario_id).first()
    if usuario is None:
        return False
    db.delete(usuario)
    db.commit()
    return True

def listar_usuarios_db(db: Session):
    return db.query(Usuario).all()
