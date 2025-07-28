-- Hiciste bastantes tablas. Bastante bien. 
-- En un diseño real, ya te puedes imaginar habria que refactorizar mucho mas, un sistema de streaming es muy grande.
-- Pero la base esta muy bien.

CREATE TABLE Categoria (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

CREATE TABLE Usuario (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(100) NOT NULL,  --- Aqui con solo 100 carácteres no podrías colocar una contraseña encriptada con sha128/256 xd
    fecha_registro DATE NOT NULL, 
    tipo_suscripcion VARCHAR(50) NOT NULL
);

-- Las preferencias si no irian en texto. 
-- Las preferecias son algo muy complejo, porque saber que peliculas recomendarle a alguien es dificil.
-- La implementacion mas sencilla seria colocar una tabla preferencias_usuarios, y en esta asociar el id de un usuario con el id de algunas catergorias que
-- este haya escogido. 
-- Pero en sistemas avanzados, existen procesos de procesamiento de informacion complejos. Uno podria ser tomar el id de un usuario y por cada pelicula o serie,
-- calcular un porcentaje del 0 al 10 indicando si esta pelicula o serie seria recomendable para el usuario. 
-- Ya para esto se usan modelos de machine learning, los cuales usan matematicas por debajo.

-- Si te llama conocer un poco mas: https://www.aprendemachinelearning.com/sistemas-de-recomendacion/

CREATE TABLE Perfil (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    foto_url VARCHAR(255),
    preferencias TEXT,
    fecha_nacimiento DATE,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);


-- Esto en sistema reales es una implemtacion muy compleja, porque no solo es la suscripcion. Sino protocolos de cancelacion. 
-- Tarjetas de creditos de los usuarios. 
-- Metodos de pagos de preferencia.
-- Sistema de encritpacion de los datos de la tarjeta. 
-- Facturas.
-- Y muchas movidas mas.

-- Lo unico que diria que se pudo agregar ahorita, seria la tabla con los tipos de suscripcion, y luego tipo_suscripcion_id. 
-- Y tener solo tres registors por ejemplo, premium, basic, y pro. Y el numero de pantalla/perfiles de cada suscription

CREATE TABLE Suscripcion (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    estado VARCHAR(20) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);

-- Esta tabla contenido es un poco ambigua. Es de peliculas o series? Seria mejor una tabla peliculas y otras series. Porque las peliculas
-- son un solo registro. Mientras que la series no, estas se organizan por temporadas y capitulos. Minimo, estructurar series te daria para tres tablas.

-- Y faltaria una columna con el link del recurso o del contenido: video_url. Una como la que usaste en foto_url.

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


-- Dato interesantp: En esa columna texto, podrias guardar texto normal, pero muchas veces este tipo de campos de comentarios, almacena directamente
-- HTML o MARKDOWN, porque estos formatos de texto permite agregar texto en negrita, italica, etc. Permitiendo darle mas formato al texto por parte
-- de los usuarios. 

-- Puedes investigar lo que son editores WYSIWYG. Estos son los utilizados en este tipo de campos en un front. 

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
    valor INTEGER CHECK (valor >= 1 AND valor <= 5), -- No vale, y el 1.5 xd, Te falto la estrellita y media. Y el 0. Si no me gusto nada, no puedo puntuarlo.
    fecha TIMESTAMP NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (contenido_id) REFERENCES Contenido(id)
);

-- Esta tabla esta muy interesante, mantener esto sincrozinado con las acciones del usuario debe ser una tarea muy compleja.
-- Diria yo que lo que solemos usar de HTTP REST no funcionaria. Si quieres indigar mas, puedes investigar sobre websockets. 
-- Es muy probable que a cada cierta cantidad de segundos, el front se comunique con el backend para actualizar el progreso de los usuarios.
-- Todo en tiempo Real.

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
