# StreamVerse

## Descripción del Proyecto
StreamVerse es una plataforma de streaming digital que ofrece películas, series y documentales a sus usuarios. El sistema permite gestionar un catálogo de contenido multimedia, suscripciones, puntuaciones y comentarios de los usuarios. La base de datos está diseñada para organizar el catálogo, controlar las suscripciones, almacenar valoraciones y comentarios, y asegurar una experiencia personalizada y eficiente para cada usuario.

## Lógica de Negocio
La base de datos de StreamVerse permite:
- Gestionar usuarios y sus perfiles.
- Administrar el catálogo de contenidos y sus categorías.
- Controlar las suscripciones activas y su historial.
- Registrar comentarios y puntuaciones de los usuarios sobre los contenidos.
- Relacionar desarrolladores con los contenidos que producen.

Gracias a esta arquitectura, StreamVerse puede ofrecer recomendaciones, mantener la integridad de la información y escalar su servicio a miles de usuarios simultáneos.

## Estructura del Proyecto
- `app/models.py`: Modelos SQLAlchemy (tablas de la base de datos)
- `app/schemas.py`: Esquemas Pydantic (validación y serialización)
- `app/database.py`: Configuración de la base de datos
- `app/main.py`: Endpoints de la API con FastAPI
- `app/crud.py`: Funciones CRUD reutilizables
- `sql/streamverse_schema.sql`: Script SQL de creación de tablas (manual)
- `sql/output.sql`: Dump generado automáticamente desde PostgreSQL (estructura y datos)

## Cómo ejecutar el proyecto
1. Instala las dependencias:

   ```bash
   pip install -r requirements.txt
   ```
2. Crea la base de datos y ejecuta el script `sql/streamverse_schema.sql` en PostgreSQL para crear la estructura.
3. Si necesitas restaurar toda la base de datos (estructura y datos), usa el dump `sql/output.sql` con pg_restore o psql.
4. Configura la cadena de conexión en `app/database.py` con tu usuario y contraseña de PostgreSQL.
5. Ejecuta el servidor:

   ```bash
   uvicorn app.main:app --reload
   ```
6. Abre tu navegador en [http://localhost:8000/docs](http://localhost:8000/docs) para probar la API.

## Endpoints principales
- `POST /usuarios/` : Crear usuario
- `GET /usuarios/` : Listar todos los usuarios
- `GET /usuarios/{usuario_id}` : Consultar usuario por ID
- `PUT /usuarios/{usuario_id}` : Actualizar usuario
- `DELETE /usuarios/{usuario_id}` : Eliminar usuario

## Notas sobre los archivos SQL
- `sql/streamverse_schema.sql`: Script manual, útil para crear la estructura desde cero.
- `sql/output.sql`: Dump generado por PostgreSQL, incluye estructura y datos actuales.

## Autor
Anthony Silva C.I.30.886.525