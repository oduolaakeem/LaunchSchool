--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: lists; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE lists (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.lists OWNER TO ubuntu;

--
-- Name: lists_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lists_id_seq OWNER TO ubuntu;

--
-- Name: lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE lists_id_seq OWNED BY lists.id;


--
-- Name: todos; Type: TABLE; Schema: public; Owner: ubuntu; Tablespace: 
--

CREATE TABLE todos (
    id integer NOT NULL,
    name text NOT NULL,
    list_id integer NOT NULL,
    is_completed boolean DEFAULT false
);


ALTER TABLE public.todos OWNER TO ubuntu;

--
-- Name: todos_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE todos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.todos_id_seq OWNER TO ubuntu;

--
-- Name: todos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE todos_id_seq OWNED BY todos.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY lists ALTER COLUMN id SET DEFAULT nextval('lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY todos ALTER COLUMN id SET DEFAULT nextval('todos_id_seq'::regclass);


--
-- Data for Name: lists; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY lists (id, name) FROM stdin;
\.


--
-- Name: lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('lists_id_seq', 1, false);


--
-- Data for Name: todos; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY todos (id, name, list_id, is_completed) FROM stdin;
\.


--
-- Name: todos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('todos_id_seq', 1, true);


--
-- Name: lists_name_key; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY lists
    ADD CONSTRAINT lists_name_key UNIQUE (name);


--
-- Name: lists_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (id);


--
-- Name: todos_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu; Tablespace: 
--

ALTER TABLE ONLY todos
    ADD CONSTRAINT todos_pkey PRIMARY KEY (id);


--
-- Name: todos_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

ALTER TABLE ONLY todos
    ADD CONSTRAINT todos_list_id_fkey FOREIGN KEY (list_id) REFERENCES lists(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

