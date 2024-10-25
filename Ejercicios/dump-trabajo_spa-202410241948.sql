--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-10-24 19:48:05

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4858 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 35456)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    apellido character varying NOT NULL,
    email character varying NOT NULL,
    telefono character varying,
    vendedor_id integer
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 35455)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 4859 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 219 (class 1259 OID 35469)
-- Name: empleados_jefes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados_jefes (
    empleado text,
    puesto_empleado character varying,
    jefe text,
    jefatura character varying
);


ALTER TABLE public.empleados_jefes OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 35442)
-- Name: trabajadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trabajadores (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    apellido character varying NOT NULL,
    puesto character varying NOT NULL,
    id_jefe integer
);


ALTER TABLE public.trabajadores OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 35441)
-- Name: trabajadores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trabajadores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trabajadores_id_seq OWNER TO postgres;

--
-- TOC entry 4860 (class 0 OID 0)
-- Dependencies: 215
-- Name: trabajadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trabajadores_id_seq OWNED BY public.trabajadores.id;


--
-- TOC entry 4698 (class 2604 OID 35459)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 4697 (class 2604 OID 35445)
-- Name: trabajadores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajadores ALTER COLUMN id SET DEFAULT nextval('public.trabajadores_id_seq'::regclass);


--
-- TOC entry 4851 (class 0 OID 35456)
-- Dependencies: 218
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes VALUES (1, 'Alberto', 'Lopez', 'alberto.lopez@example.com', '555-1234', 8);
INSERT INTO public.clientes VALUES (2, 'Beatriz', 'Fernandez', 'beatriz.fernandez@example.com', '555-5678', 8);
INSERT INTO public.clientes VALUES (3, 'Carmen', 'Garcia', 'carmen.garcia@example.com', '555-8765', 9);
INSERT INTO public.clientes VALUES (4, 'Daniel', 'Sanchez', 'daniel.sanchez@example.com', '555-4321', 9);
INSERT INTO public.clientes VALUES (5, 'Esteban', 'Torres', 'esteban.torres@example.com', '555-6789', 10);
INSERT INTO public.clientes VALUES (6, 'Felicia', 'Martinez', 'felicia.martinez@example.com', '555-9876', 10);
INSERT INTO public.clientes VALUES (7, 'Guillermo', 'Diaz', 'guillermo.diaz@example.com', '555-3456', 5);
INSERT INTO public.clientes VALUES (8, 'Helena', 'Lopez', 'helena.lopez@example.com', '555-6543', 6);
INSERT INTO public.clientes VALUES (9, 'Irene', 'Hernandez', 'irene.hernandez@example.com', '555-7890', 7);
INSERT INTO public.clientes VALUES (10, 'Javier', 'Ruiz', 'javier.ruiz@example.com', '555-8901', 7);
INSERT INTO public.clientes VALUES (11, 'Karina', 'Ramos', 'karina.ramos@example.com', '555-2345', 11);
INSERT INTO public.clientes VALUES (12, 'Luis', 'Gutierrez', 'luis.gutierrez@example.com', '555-3456', 12);
INSERT INTO public.clientes VALUES (13, 'Marta', 'Mendez', 'marta.mendez@example.com', '555-4567', 13);
INSERT INTO public.clientes VALUES (14, 'Natalia', 'Castro', 'natalia.castro@example.com', '555-5678', 14);
INSERT INTO public.clientes VALUES (15, 'Oscar', 'Alvarez', 'oscar.alvarez@example.com', '555-6789', 15);
INSERT INTO public.clientes VALUES (16, 'Patricia', 'Vargas', 'patricia.vargas@example.com', '555-7890', 16);
INSERT INTO public.clientes VALUES (17, 'Rafael', 'Moreno', 'rafael.moreno@example.com', '555-8901', 17);
INSERT INTO public.clientes VALUES (18, 'Susana', 'Jimenez', 'susana.jimenez@example.com', '555-9012', 18);
INSERT INTO public.clientes VALUES (19, 'Tomás', 'Cruz', 'tomas.cruz@example.com', '555-0123', 19);
INSERT INTO public.clientes VALUES (20, 'Ursula', 'Rivera', 'ursula.rivera@example.com', '555-1234', 20);


--
-- TOC entry 4852 (class 0 OID 35469)
-- Dependencies: 219
-- Data for Name: empleados_jefes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empleados_jefes VALUES ('Ana Perez', 'Gerente General', 'Ana Perez', 'Gerente General');
INSERT INTO public.empleados_jefes VALUES ('Luis Gonzalez', 'Gerente de Ventas', 'Luis Gonzalez', 'Gerente de Ventas');
INSERT INTO public.empleados_jefes VALUES ('Maria Lopez', 'Gerente de Marketing', 'Maria Lopez', 'Gerente de Marketing');
INSERT INTO public.empleados_jefes VALUES ('Carlos Diaz', 'Gerente de Finanzas', 'Carlos Diaz', 'Gerente de Finanzas');
INSERT INTO public.empleados_jefes VALUES ('Laura Martinez', 'Asistente de Ventas', 'Laura Martinez', 'Asistente de Ventas');
INSERT INTO public.empleados_jefes VALUES ('Jorge Hernandez', 'Asistente de Marketing', 'Jorge Hernandez', 'Asistente de Marketing');
INSERT INTO public.empleados_jefes VALUES ('Sofia Fernandez', 'Asistente de Finanzas', 'Sofia Fernandez', 'Asistente de Finanzas');
INSERT INTO public.empleados_jefes VALUES ('Pablo Torres', 'Ejecutivo de Ventas', 'Pablo Torres', 'Ejecutivo de Ventas');
INSERT INTO public.empleados_jefes VALUES ('Elena Garcia', 'Ejecutivo de Marketing', 'Elena Garcia', 'Ejecutivo de Marketing');
INSERT INTO public.empleados_jefes VALUES ('Pedro Rodriguez', 'Ejecutivo de Finanzas', 'Pedro Rodriguez', 'Ejecutivo de Finanzas');
INSERT INTO public.empleados_jefes VALUES ('Claudia Sanchez', 'Analista de Ventas', 'Claudia Sanchez', 'Analista de Ventas');
INSERT INTO public.empleados_jefes VALUES ('Ricardo Ramos', 'Analista de Marketing', 'Ricardo Ramos', 'Analista de Marketing');
INSERT INTO public.empleados_jefes VALUES ('Andres Mendez', 'Analista de Finanzas', 'Andres Mendez', 'Analista de Finanzas');
INSERT INTO public.empleados_jefes VALUES ('Natalia Cruz', 'Asistente Administrativo', 'Natalia Cruz', 'Asistente Administrativo');
INSERT INTO public.empleados_jefes VALUES ('Miguel Ruiz', 'Asistente de Recursos Humanos', 'Miguel Ruiz', 'Asistente de Recursos Humanos');
INSERT INTO public.empleados_jefes VALUES ('Patricia Flores', 'Analista de Recursos Humanos', 'Patricia Flores', 'Analista de Recursos Humanos');
INSERT INTO public.empleados_jefes VALUES ('Felipe Morales', 'Jefe de TI', 'Felipe Morales', 'Jefe de TI');
INSERT INTO public.empleados_jefes VALUES ('Angela Gutierrez', 'Desarrolladora', 'Angela Gutierrez', 'Desarrolladora');
INSERT INTO public.empleados_jefes VALUES ('Roberto Jimenez', 'Administrador de Sistemas', 'Roberto Jimenez', 'Administrador de Sistemas');
INSERT INTO public.empleados_jefes VALUES ('Gloria Alvarez', 'Soporte Técnico', 'Gloria Alvarez', 'Soporte Técnico');


--
-- TOC entry 4849 (class 0 OID 35442)
-- Dependencies: 216
-- Data for Name: trabajadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.trabajadores VALUES (1, 'Ana', 'Perez', 'Gerente General', NULL);
INSERT INTO public.trabajadores VALUES (2, 'Luis', 'Gonzalez', 'Gerente de Ventas', 1);
INSERT INTO public.trabajadores VALUES (3, 'Maria', 'Lopez', 'Gerente de Marketing', 1);
INSERT INTO public.trabajadores VALUES (4, 'Carlos', 'Diaz', 'Gerente de Finanzas', 1);
INSERT INTO public.trabajadores VALUES (5, 'Laura', 'Martinez', 'Asistente de Ventas', 2);
INSERT INTO public.trabajadores VALUES (6, 'Jorge', 'Hernandez', 'Asistente de Marketing', 3);
INSERT INTO public.trabajadores VALUES (7, 'Sofia', 'Fernandez', 'Asistente de Finanzas', 4);
INSERT INTO public.trabajadores VALUES (8, 'Pablo', 'Torres', 'Ejecutivo de Ventas', 2);
INSERT INTO public.trabajadores VALUES (9, 'Elena', 'Garcia', 'Ejecutivo de Marketing', 3);
INSERT INTO public.trabajadores VALUES (10, 'Pedro', 'Rodriguez', 'Ejecutivo de Finanzas', 4);
INSERT INTO public.trabajadores VALUES (11, 'Claudia', 'Sanchez', 'Analista de Ventas', 2);
INSERT INTO public.trabajadores VALUES (12, 'Ricardo', 'Ramos', 'Analista de Marketing', 3);
INSERT INTO public.trabajadores VALUES (13, 'Andres', 'Mendez', 'Analista de Finanzas', 4);
INSERT INTO public.trabajadores VALUES (14, 'Natalia', 'Cruz', 'Asistente Administrativo', 1);
INSERT INTO public.trabajadores VALUES (15, 'Miguel', 'Ruiz', 'Asistente de Recursos Humanos', 1);
INSERT INTO public.trabajadores VALUES (16, 'Patricia', 'Flores', 'Analista de Recursos Humanos', NULL);
INSERT INTO public.trabajadores VALUES (17, 'Felipe', 'Morales', 'Jefe de TI', 1);
INSERT INTO public.trabajadores VALUES (18, 'Angela', 'Gutierrez', 'Desarrolladora', 17);
INSERT INTO public.trabajadores VALUES (19, 'Roberto', 'Jimenez', 'Administrador de Sistemas', 17);
INSERT INTO public.trabajadores VALUES (20, 'Gloria', 'Alvarez', 'Soporte Técnico', 17);


--
-- TOC entry 4861 (class 0 OID 0)
-- Dependencies: 217
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 20, true);


--
-- TOC entry 4862 (class 0 OID 0)
-- Dependencies: 215
-- Name: trabajadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trabajadores_id_seq', 20, true);


--
-- TOC entry 4702 (class 2606 OID 35463)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 4700 (class 2606 OID 35449)
-- Name: trabajadores trabajadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajadores
    ADD CONSTRAINT trabajadores_pkey PRIMARY KEY (id);


--
-- TOC entry 4704 (class 2606 OID 35464)
-- Name: clientes clientes_vendedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES public.trabajadores(id);


--
-- TOC entry 4703 (class 2606 OID 35450)
-- Name: trabajadores trabajadores_id_jefe_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajadores
    ADD CONSTRAINT trabajadores_id_jefe_fkey FOREIGN KEY (id_jefe) REFERENCES public.trabajadores(id) ON DELETE SET NULL;


-- Completed on 2024-10-24 19:48:05

--
-- PostgreSQL database dump complete
--

