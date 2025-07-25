--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categoria_id_seq OWNER TO postgres;

--
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentario (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    contenido_id integer NOT NULL,
    texto text NOT NULL,
    fecha timestamp without time zone NOT NULL
);


ALTER TABLE public.comentario OWNER TO postgres;

--
-- Name: comentario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comentario_id_seq OWNER TO postgres;

--
-- Name: comentario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentario_id_seq OWNED BY public.comentario.id;


--
-- Name: contenido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contenido (
    id integer NOT NULL,
    titulo character varying(150) NOT NULL,
    descripcion text,
    anio integer,
    tipo character varying(50) NOT NULL,
    duracion integer,
    categoria_id integer NOT NULL
);


ALTER TABLE public.contenido OWNER TO postgres;

--
-- Name: contenido_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contenido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contenido_id_seq OWNER TO postgres;

--
-- Name: contenido_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contenido_id_seq OWNED BY public.contenido.id;


--
-- Name: contenidodesarrollador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contenidodesarrollador (
    id integer NOT NULL,
    contenido_id integer NOT NULL,
    desarrollador_id integer NOT NULL
);


ALTER TABLE public.contenidodesarrollador OWNER TO postgres;

--
-- Name: contenidodesarrollador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contenidodesarrollador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contenidodesarrollador_id_seq OWNER TO postgres;

--
-- Name: contenidodesarrollador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contenidodesarrollador_id_seq OWNED BY public.contenidodesarrollador.id;


--
-- Name: desarrollador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.desarrollador (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    pais character varying(50),
    anio_fundacion integer
);


ALTER TABLE public.desarrollador OWNER TO postgres;

--
-- Name: desarrollador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.desarrollador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.desarrollador_id_seq OWNER TO postgres;

--
-- Name: desarrollador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.desarrollador_id_seq OWNED BY public.desarrollador.id;


--
-- Name: historialvisualizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historialvisualizacion (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    contenido_id integer NOT NULL,
    fecha_visualizacion timestamp without time zone NOT NULL,
    progreso integer
);


ALTER TABLE public.historialvisualizacion OWNER TO postgres;

--
-- Name: historialvisualizacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historialvisualizacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historialvisualizacion_id_seq OWNER TO postgres;

--
-- Name: historialvisualizacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historialvisualizacion_id_seq OWNED BY public.historialvisualizacion.id;


--
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfil (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    foto_url character varying(255),
    preferencias text,
    fecha_nacimiento date
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- Name: perfil_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perfil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perfil_id_seq OWNER TO postgres;

--
-- Name: perfil_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perfil_id_seq OWNED BY public.perfil.id;


--
-- Name: puntuacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.puntuacion (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    contenido_id integer NOT NULL,
    valor integer,
    fecha timestamp without time zone NOT NULL,
    CONSTRAINT puntuacion_valor_check CHECK (((valor >= 1) AND (valor <= 5)))
);


ALTER TABLE public.puntuacion OWNER TO postgres;

--
-- Name: puntuacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.puntuacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.puntuacion_id_seq OWNER TO postgres;

--
-- Name: puntuacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.puntuacion_id_seq OWNED BY public.puntuacion.id;


--
-- Name: suscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suscripcion (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date,
    estado character varying(20) NOT NULL,
    tipo character varying(50) NOT NULL
);


ALTER TABLE public.suscripcion OWNER TO postgres;

--
-- Name: suscripcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suscripcion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.suscripcion_id_seq OWNER TO postgres;

--
-- Name: suscripcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suscripcion_id_seq OWNED BY public.suscripcion.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    contrasena character varying(100) NOT NULL,
    fecha_registro date NOT NULL,
    tipo_suscripcion character varying(50) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- Name: comentario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario ALTER COLUMN id SET DEFAULT nextval('public.comentario_id_seq'::regclass);


--
-- Name: contenido id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenido ALTER COLUMN id SET DEFAULT nextval('public.contenido_id_seq'::regclass);


--
-- Name: contenidodesarrollador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidodesarrollador ALTER COLUMN id SET DEFAULT nextval('public.contenidodesarrollador_id_seq'::regclass);


--
-- Name: desarrollador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desarrollador ALTER COLUMN id SET DEFAULT nextval('public.desarrollador_id_seq'::regclass);


--
-- Name: historialvisualizacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historialvisualizacion ALTER COLUMN id SET DEFAULT nextval('public.historialvisualizacion_id_seq'::regclass);


--
-- Name: perfil id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil ALTER COLUMN id SET DEFAULT nextval('public.perfil_id_seq'::regclass);


--
-- Name: puntuacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puntuacion ALTER COLUMN id SET DEFAULT nextval('public.puntuacion_id_seq'::regclass);


--
-- Name: suscripcion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suscripcion ALTER COLUMN id SET DEFAULT nextval('public.suscripcion_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id, nombre, descripcion) FROM stdin;
\.


--
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentario (id, usuario_id, contenido_id, texto, fecha) FROM stdin;
\.


--
-- Data for Name: contenido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contenido (id, titulo, descripcion, anio, tipo, duracion, categoria_id) FROM stdin;
\.


--
-- Data for Name: contenidodesarrollador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contenidodesarrollador (id, contenido_id, desarrollador_id) FROM stdin;
\.


--
-- Data for Name: desarrollador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.desarrollador (id, nombre, pais, anio_fundacion) FROM stdin;
\.


--
-- Data for Name: historialvisualizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.historialvisualizacion (id, usuario_id, contenido_id, fecha_visualizacion, progreso) FROM stdin;
\.


--
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perfil (id, usuario_id, foto_url, preferencias, fecha_nacimiento) FROM stdin;
\.


--
-- Data for Name: puntuacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.puntuacion (id, usuario_id, contenido_id, valor, fecha) FROM stdin;
\.


--
-- Data for Name: suscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suscripcion (id, usuario_id, fecha_inicio, fecha_fin, estado, tipo) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, nombre, email, contrasena, fecha_registro, tipo_suscripcion) FROM stdin;
1	Juan P├®rez	juan@email.com	1234	2025-07-17	premium
6	Anthony Silva	Anthony@email.com	1234	2025-07-17	premium
\.


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 1, false);


--
-- Name: comentario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentario_id_seq', 1, false);


--
-- Name: contenido_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contenido_id_seq', 1, false);


--
-- Name: contenidodesarrollador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contenidodesarrollador_id_seq', 1, false);


--
-- Name: desarrollador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.desarrollador_id_seq', 1, false);


--
-- Name: historialvisualizacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historialvisualizacion_id_seq', 1, false);


--
-- Name: perfil_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perfil_id_seq', 1, false);


--
-- Name: puntuacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.puntuacion_id_seq', 1, false);


--
-- Name: suscripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suscripcion_id_seq', 1, false);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 8, true);


--
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- Name: comentario comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (id);


--
-- Name: contenido contenido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenido
    ADD CONSTRAINT contenido_pkey PRIMARY KEY (id);


--
-- Name: contenidodesarrollador contenidodesarrollador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidodesarrollador
    ADD CONSTRAINT contenidodesarrollador_pkey PRIMARY KEY (id);


--
-- Name: desarrollador desarrollador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desarrollador
    ADD CONSTRAINT desarrollador_pkey PRIMARY KEY (id);


--
-- Name: historialvisualizacion historialvisualizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historialvisualizacion
    ADD CONSTRAINT historialvisualizacion_pkey PRIMARY KEY (id);


--
-- Name: perfil perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_pkey PRIMARY KEY (id);


--
-- Name: puntuacion puntuacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puntuacion
    ADD CONSTRAINT puntuacion_pkey PRIMARY KEY (id);


--
-- Name: suscripcion suscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suscripcion
    ADD CONSTRAINT suscripcion_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: comentario comentario_contenido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_contenido_id_fkey FOREIGN KEY (contenido_id) REFERENCES public.contenido(id);


--
-- Name: comentario comentario_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: contenido contenido_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenido
    ADD CONSTRAINT contenido_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);


--
-- Name: contenidodesarrollador contenidodesarrollador_contenido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidodesarrollador
    ADD CONSTRAINT contenidodesarrollador_contenido_id_fkey FOREIGN KEY (contenido_id) REFERENCES public.contenido(id);


--
-- Name: contenidodesarrollador contenidodesarrollador_desarrollador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contenidodesarrollador
    ADD CONSTRAINT contenidodesarrollador_desarrollador_id_fkey FOREIGN KEY (desarrollador_id) REFERENCES public.desarrollador(id);


--
-- Name: historialvisualizacion historialvisualizacion_contenido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historialvisualizacion
    ADD CONSTRAINT historialvisualizacion_contenido_id_fkey FOREIGN KEY (contenido_id) REFERENCES public.contenido(id);


--
-- Name: historialvisualizacion historialvisualizacion_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historialvisualizacion
    ADD CONSTRAINT historialvisualizacion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: perfil perfil_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT perfil_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: puntuacion puntuacion_contenido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puntuacion
    ADD CONSTRAINT puntuacion_contenido_id_fkey FOREIGN KEY (contenido_id) REFERENCES public.contenido(id);


--
-- Name: puntuacion puntuacion_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.puntuacion
    ADD CONSTRAINT puntuacion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: suscripcion suscripcion_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suscripcion
    ADD CONSTRAINT suscripcion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- PostgreSQL database dump complete
--

