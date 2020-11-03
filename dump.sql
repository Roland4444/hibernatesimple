--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3 (Ubuntu 10.3-1)
-- Dumped by pg_dump version 10.3 (Ubuntu 10.3-1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: app; Type: SCHEMA; Schema: -; Owner: user2
--

CREATE SCHEMA app;


ALTER SCHEMA app OWNER TO user2;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: departments; Type: TABLE; Schema: app; Owner: user2
--

CREATE TABLE app.departments (
    id integer NOT NULL,
    name text,
    alias text,
    type text
);


ALTER TABLE app.departments OWNER TO user2;

--
-- Name: flyway_schema_history; Type: TABLE; Schema: app; Owner: user2
--

CREATE TABLE app.flyway_schema_history (
    installed_rank integer NOT NULL,
    version text,
    description text NOT NULL,
    type text NOT NULL,
    script text NOT NULL,
    checksum integer,
    installed_by text NOT NULL,
    installed_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE app.flyway_schema_history OWNER TO user2;

--
-- Name: metals; Type: TABLE; Schema: app; Owner: user2
--

CREATE TABLE app.metals (
    id integer NOT NULL,
    name text
);


ALTER TABLE app.metals OWNER TO user2;

--
-- Name: mode; Type: TABLE; Schema: app; Owner: user2
--

CREATE TABLE app.mode (
    id integer NOT NULL,
    name text,
    mode_code text
);


ALTER TABLE app.mode OWNER TO user2;

--
-- Name: properties; Type: TABLE; Schema: app; Owner: user2
--

CREATE TABLE app.properties (
    id integer NOT NULL,
    name text,
    value text
);


ALTER TABLE app.properties OWNER TO user2;

--
-- Name: tares; Type: TABLE; Schema: app; Owner: user2
--

CREATE TABLE app.tares (
    id integer NOT NULL,
    name text,
    weight double precision,
    deleted boolean
);


ALTER TABLE app.tares OWNER TO user2;

--
-- Name: temp_tares; Type: TABLE; Schema: app; Owner: user2
--

CREATE TABLE app.temp_tares (
    id integer NOT NULL,
    name text,
    weight double precision,
    waybill_id integer
);


ALTER TABLE app.temp_tares OWNER TO user2;

--
-- Name: waybills; Type: TABLE; Schema: app; Owner: user2
--

CREATE TABLE app.waybills (
    id integer NOT NULL,
    waybill integer,
    department_id integer,
    date_create date,
    time_create time without time zone,
    comment text,
    upload boolean,
    mode text,
    complete boolean DEFAULT false,
    scale_id integer DEFAULT 0
);


ALTER TABLE app.waybills OWNER TO user2;

--
-- Name: weighings; Type: TABLE; Schema: app; Owner: user2
--

CREATE TABLE app.weighings (
    id integer NOT NULL,
    brutto double precision,
    netto double precision,
    clogging double precision,
    trash double precision,
    metal_id integer,
    waybill_id integer,
    deleted boolean DEFAULT false,
    tare double precision
);


ALTER TABLE app.weighings OWNER TO user2;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    firstname character varying(40) NOT NULL,
    secondname character varying(40) NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films (
    id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.films OWNER TO postgres;

--
-- Data for Name: departments; Type: TABLE DATA; Schema: app; Owner: user2
--

COPY app.departments (id, name, alias, type) FROM stdin;
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: app; Owner: user2
--

COPY app.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
\.


--
-- Data for Name: metals; Type: TABLE DATA; Schema: app; Owner: user2
--

COPY app.metals (id, name) FROM stdin;
\.


--
-- Data for Name: mode; Type: TABLE DATA; Schema: app; Owner: user2
--

COPY app.mode (id, name, mode_code) FROM stdin;
1	Приемка	ACCEPTANCE
2	Отгрузка	SHIPMENT
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: app; Owner: user2
--

COPY app.properties (id, name, value) FROM stdin;
\.


--
-- Data for Name: tares; Type: TABLE DATA; Schema: app; Owner: user2
--

COPY app.tares (id, name, weight, deleted) FROM stdin;
\.


--
-- Data for Name: temp_tares; Type: TABLE DATA; Schema: app; Owner: user2
--

COPY app.temp_tares (id, name, weight, waybill_id) FROM stdin;
\.


--
-- Data for Name: waybills; Type: TABLE DATA; Schema: app; Owner: user2
--

COPY app.waybills (id, waybill, department_id, date_create, time_create, comment, upload, mode, complete, scale_id) FROM stdin;
\.


--
-- Data for Name: weighings; Type: TABLE DATA; Schema: app; Owner: user2
--

COPY app.weighings (id, brutto, netto, clogging, trash, metal_id, waybill_id, deleted, tare) FROM stdin;
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, firstname, secondname) FROM stdin;
0	roman	pastushkov
\.


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films (id, name) FROM stdin;
1	82 minutes
2	83 minutes
\.


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

