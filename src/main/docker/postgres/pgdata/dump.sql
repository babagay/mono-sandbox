--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

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
-- Name: DATABASE "monoSandbox"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "monoSandbox" IS 'Db for monoSandbox project';


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
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: monosandbox
--

CREATE SEQUENCE public.hibernate_sequence
START WITH 1
INCREMENT BY 1
NO MINVALUE
MAXVALUE 100111000
CACHE 2;


ALTER TABLE public.hibernate_sequence OWNER TO monosandbox;

--
-- Name: jhi_authority; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_authority (
    name character varying(50) NOT NULL
);


ALTER TABLE public.jhi_authority OWNER TO postgres;

--
-- Name: jhi_persistent_audit_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_persistent_audit_event (
    event_id bigint NOT NULL,
    principal character varying(50) NOT NULL,
    event_date timestamp without time zone,
    event_type character varying(255)
);


ALTER TABLE public.jhi_persistent_audit_event OWNER TO postgres;

--
-- Name: jhi_persistent_audit_evt_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_persistent_audit_evt_data (
    event_id bigint NOT NULL,
    name character varying(150) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.jhi_persistent_audit_evt_data OWNER TO postgres;

--
-- Name: jhi_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_user (
    id bigint NOT NULL,
    login character varying(50) NOT NULL,
    password_hash character varying(60),
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    image_url character varying(256),
    activated boolean NOT NULL,
    lang_key character varying(6),
    activation_key character varying(20),
    reset_key character varying(20),
    created_by character varying(50) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    reset_date timestamp without time zone,
    last_modified_by character varying(50),
    last_modified_date timestamp without time zone
);


ALTER TABLE public.jhi_user OWNER TO postgres;

--
-- Name: jhi_user_authority; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jhi_user_authority (
    user_id bigint NOT NULL,
    authority_name character varying(50) NOT NULL
);


ALTER TABLE public.jhi_user_authority OWNER TO postgres;

--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
00000000000000	jhipster	config/liquibase/changelog/00000000000000_initial_schema.xml	2018-05-26 14:57:17.979625	1	EXECUTED	7:a6235f40597a13436aa36c6d61db2269	createSequence sequenceName=hibernate_sequence		\N	3.5.4	\N	\N	7335837753
00000000000001	jhipster	config/liquibase/changelog/00000000000000_initial_schema.xml	2018-05-26 14:57:18.521509	2	EXECUTED	7:b0afe4a554a42e0708f3886aea500ad4	createTable tableName=jhi_user; createIndex indexName=idx_user_login, tableName=jhi_user; createIndex indexName=idx_user_email, tableName=jhi_user; createTable tableName=jhi_authority; createTable tableName=jhi_user_authority; addPrimaryKey tableN...		\N	3.5.4	\N	\N	7335837753
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: jhi_authority; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jhi_authority (name) FROM stdin;
ROLE_ADMIN
ROLE_USER
\.


--
-- Data for Name: jhi_persistent_audit_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jhi_persistent_audit_event (event_id, principal, event_date, event_type) FROM stdin;
951	admin	2018-05-26 14:57:38.433	AUTHENTICATION_SUCCESS
952	admin	2018-05-26 15:45:48.105	AUTHENTICATION_SUCCESS
953	admin	2018-05-26 15:48:48.815	AUTHENTICATION_SUCCESS
954	admin	2018-05-26 17:13:18.708	AUTHENTICATION_SUCCESS
1001	admin	2018-05-29 20:47:07.434	AUTHENTICATION_SUCCESS
1002	admin	2018-05-29 20:50:35.426	AUTHENTICATION_SUCCESS
1051	admin	2018-05-30 11:30:25.373	AUTHENTICATION_SUCCESS
1101	user	2018-05-31 20:32:11.448	AUTHENTICATION_SUCCESS
1151	user	2018-05-31 20:37:46.428	AUTHENTICATION_SUCCESS
1201	user	2018-05-31 20:46:05.49	AUTHENTICATION_SUCCESS
1251	admin	2018-05-31 21:36:48.838	AUTHENTICATION_SUCCESS
1301	user	2018-05-31 21:45:21.924	AUTHENTICATION_SUCCESS
1351	admin	2018-05-31 23:25:40.266	AUTHENTICATION_SUCCESS
1401	anonymous	2018-06-01 12:41:05.423	AUTHENTICATION_FAILURE
1402	anonymous	2018-06-01 12:41:12.09	AUTHENTICATION_FAILURE
1403	anonymous	2018-05-12 12:12:12.12	AUTHENTICATION_FAILURE
1	admin	2018-06-01 13:15:11.777	AUTHENTICATION_SUCCESS
\.


--
-- Data for Name: jhi_persistent_audit_evt_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jhi_persistent_audit_evt_data (event_id, name, value) FROM stdin;
1401	type	org.springframework.security.authentication.BadCredentialsException
1401	message	Bad credentials
1402	type	org.springframework.security.authentication.BadCredentialsException
1402	message	Bad credentials
\.


--
-- Data for Name: jhi_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jhi_user (id, login, password_hash, first_name, last_name, email, image_url, activated, lang_key, activation_key, reset_key, created_by, created_date, reset_date, last_modified_by, last_modified_date) FROM stdin;
2	anonymoususer	$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO	Anonymous	User	anonymous@localhost		t	ru	\N	\N	system	2018-05-26 14:57:17.998638	\N	system	\N
4	user	$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K	User	User	user@localhost		t	ru	\N	\N	system	2018-05-26 14:57:17.998638	\N	system	\N
3	admin	$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC	Administrator	Administrator	wonderer@i.ua		t	ru	\N	\N	system	2018-05-26 14:57:17.998638	\N	admin	2018-05-26 15:03:52.887
1	system	$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG	System	System	system@localhost		f	ru	\N	\N	system	2018-05-26 14:57:17.998638	\N	admin	2018-05-26 17:13:24.254
\.


--
-- Data for Name: jhi_user_authority; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jhi_user_authority (user_id, authority_name) FROM stdin;
1	ROLE_ADMIN
1	ROLE_USER
3	ROLE_ADMIN
3	ROLE_USER
4	ROLE_USER
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: monosandbox
--

SELECT pg_catalog.setval('public.hibernate_sequence', 2, true);


--
-- Name: jhi_persistent_audit_evt_data jhi_persistent_audit_evt_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_persistent_audit_evt_data
ADD CONSTRAINT jhi_persistent_audit_evt_data_pkey PRIMARY KEY (event_id, name);


--
-- Name: jhi_user_authority jhi_user_authority_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_user_authority
ADD CONSTRAINT jhi_user_authority_pkey PRIMARY KEY (user_id, authority_name);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: jhi_authority pk_jhi_authority; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_authority
ADD CONSTRAINT pk_jhi_authority PRIMARY KEY (name);


--
-- Name: jhi_persistent_audit_event pk_jhi_persistent_audit_event; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_persistent_audit_event
ADD CONSTRAINT pk_jhi_persistent_audit_event PRIMARY KEY (event_id);


--
-- Name: jhi_user pk_jhi_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_user
ADD CONSTRAINT pk_jhi_user PRIMARY KEY (id);


--
-- Name: jhi_user ux_user_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_user
ADD CONSTRAINT ux_user_email UNIQUE (email);


--
-- Name: jhi_user ux_user_login; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_user
ADD CONSTRAINT ux_user_login UNIQUE (login);


--
-- Name: idx_persistent_audit_event; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_persistent_audit_event ON public.jhi_persistent_audit_event USING btree (principal, event_date);


--
-- Name: idx_persistent_audit_evt_data; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_persistent_audit_evt_data ON public.jhi_persistent_audit_evt_data USING btree (event_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_user_email ON public.jhi_user USING btree (email);


--
-- Name: idx_user_login; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_user_login ON public.jhi_user USING btree (login);


--
-- Name: jhi_user_authority fk_authority_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_user_authority
ADD CONSTRAINT fk_authority_name FOREIGN KEY (authority_name) REFERENCES public.jhi_authority(name);


--
-- Name: jhi_persistent_audit_evt_data fk_evt_pers_audit_evt_data; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_persistent_audit_evt_data
ADD CONSTRAINT fk_evt_pers_audit_evt_data FOREIGN KEY (event_id) REFERENCES public.jhi_persistent_audit_event(event_id);


--
-- Name: jhi_user_authority fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jhi_user_authority
ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.jhi_user(id);


--
-- Name: TABLE databasechangelog; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.databasechangelog TO monosandbox;


--
-- Name: TABLE databasechangeloglock; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.databasechangeloglock TO monosandbox;


--
-- Name: TABLE jhi_authority; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.jhi_authority TO monosandbox;


--
-- Name: TABLE jhi_persistent_audit_event; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.jhi_persistent_audit_event TO monosandbox;


--
-- Name: TABLE jhi_persistent_audit_evt_data; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.jhi_persistent_audit_evt_data TO monosandbox;


--
-- Name: TABLE jhi_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.jhi_user TO monosandbox;


--
-- Name: TABLE jhi_user_authority; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.jhi_user_authority TO monosandbox;


--
-- PostgreSQL database dump complete
--

