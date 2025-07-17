CREATE TABLE Categoria (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    fecha_registro DATE NOT NULL,
    tipo_suscripcion VARCHAR(50) NOT NULL
);

CREATE TABLE Perfil (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    foto_url VARCHAR(255),
    preferencias TEXT,
    fecha_nacimiento DATE,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);

CREATE TABLE Suscripcion (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    estado VARCHAR(20) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);

CREATE TABLE Contenido (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descripcion TEXT,
    anio INTEGER,
    tipo VARCHAR(50) NOT NULL,
    duracion INTEGER,
    categoria_id INTEGER NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

CREATE TABLE Comentario (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    contenido_id INTEGER NOT NULL,
    texto TEXT NOT NULL,
    fecha TIMESTAMP NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (contenido_id) REFERENCES Contenido(id)
);

CREATE TABLE Puntuacion (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    contenido_id INTEGER NOT NULL,
    valor INTEGER CHECK (valor >= 1 AND valor <= 5),
    fecha TIMESTAMP NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (contenido_id) REFERENCES Contenido(id)
);

CREATE TABLE HistorialVisualizacion (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    contenido_id INTEGER NOT NULL,
    fecha_visualizacion TIMESTAMP NOT NULL,
    progreso INTEGER,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (contenido_id) REFERENCES Contenido(id)
);

CREATE TABLE Desarrollador (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(50),
    anio_fundacion INTEGER
);

CREATE TABLE ContenidoDesarrollador (
    id SERIAL PRIMARY KEY,
    contenido_id INTEGER NOT NULL,
    desarrollador_id INTEGER NOT NULL,
    FOREIGN KEY (contenido_id) REFERENCES Contenido(id),
    FOREIGN KEY (desarrollador_id) REFERENCES Desarrollador(id)
);
