from sqlalchemy.orm import Session, select
from app.models import Usuario
from app.schemas import UsuarioCreate

# Esta muy bien haber separado las funciones en crud.py. En el modulo avanzado vamos a mejorar esto y explicare como enrutar todo un proyecto.

# La unica recomendacion es que se esta usando la api de sqlalchemy en su version 1.4. Y es preferible usar la version 2.0. En donde se dejo de
# usar db.add y db.query.

# Ahora se usan las funciones select, insert, update y delete.


def crear_usuario_db(db: Session, usuario: UsuarioCreate):
    db_usuario = Usuario(**usuario.model_dump())
    db.add(db_usuario)
    db.commit()
    db.refresh(db_usuario)
    return db_usuario


def leer_usuario_db(db: Session, usuario_id: int):

    stmt = (
        select(Usuario).  # <-- Api 2.x
        select_from(Usuario).
        where(Usuario.id == usuario_id)
    )

    result = (db.execute(stmt)).first()
    return result


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
