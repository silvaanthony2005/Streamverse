from fastapi import FastAPI, HTTPException
from app.schemas import UsuarioCreate, UsuarioRead
from app.database import SessionLocal
from app.crud import (
    crear_usuario_db,
    leer_usuario_db,
    actualizar_usuario_db,
    eliminar_usuario_db,
    listar_usuarios_db
)

app = FastAPI()

# Endpoints CRUD para Usuario
@app.post("/usuarios/", response_model=UsuarioRead)
def crear_usuario(usuario: UsuarioCreate):
    db = SessionLocal()
    try:
        db_usuario = crear_usuario_db(db, usuario)
        return db_usuario
    finally:
        db.close()

@app.get("/usuarios/{usuario_id}", response_model=UsuarioRead)
def leer_usuario(usuario_id: int):
    db = SessionLocal()
    try:
        usuario = leer_usuario_db(db, usuario_id)
        if usuario is None:
            raise HTTPException(status_code=404, detail="Usuario no encontrado")
        return usuario
    finally:
        db.close()

@app.put("/usuarios/{usuario_id}", response_model=UsuarioRead)
def actualizar_usuario(usuario_id: int, usuario: UsuarioCreate):
    db = SessionLocal()
    try:
        db_usuario = actualizar_usuario_db(db, usuario_id, usuario)
        if db_usuario is None:
            raise HTTPException(status_code=404, detail="Usuario no encontrado")
        return db_usuario
    finally:
        db.close()

@app.delete("/usuarios/{usuario_id}")
def eliminar_usuario(usuario_id: int):
    db = SessionLocal()
    try:
        ok = eliminar_usuario_db(db, usuario_id)
        if not ok:
            raise HTTPException(status_code=404, detail="Usuario no encontrado")
        return {"ok": True}
    finally:
        db.close()

@app.get("/usuarios/", response_model=list[UsuarioRead])
def listar_usuarios():
    db = SessionLocal()
    try:
        usuarios = listar_usuarios_db(db)
        return usuarios
    finally:
        db.close()


