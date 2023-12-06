--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

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

ALTER TABLE ONLY public.stars DROP CONSTRAINT stars_planet_id_fkey;
ALTER TABLE ONLY public.planets DROP CONSTRAINT planets_moon_id_fkey;
ALTER TABLE ONLY public.stars DROP CONSTRAINT stars_pkey;
ALTER TABLE ONLY public.planets DROP CONSTRAINT planets_pkey;
ALTER TABLE ONLY public.moons DROP CONSTRAINT moons_pkey;
DROP TABLE public.stars;
DROP TABLE public.planets;
DROP TABLE public.moons;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: moons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moons (
    moon character varying(50) NOT NULL
);


--
-- Name: planets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planets (
    planet character varying(50) NOT NULL,
    oribtal_period_in_years numeric NOT NULL,
    moon_id character varying(50)
);


--
-- Name: stars; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stars (
    star character varying(50) NOT NULL,
    temp_in_kelvin double precision NOT NULL,
    planet_id character varying(50) NOT NULL
);


--
-- Data for Name: moons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.moons (moon) FROM stdin;
\.


--
-- Data for Name: planets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.planets (planet, oribtal_period_in_years, moon_id) FROM stdin;
\.


--
-- Data for Name: stars; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.stars (star, temp_in_kelvin, planet_id) FROM stdin;
\.


--
-- Name: moons moons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moons
    ADD CONSTRAINT moons_pkey PRIMARY KEY (moon);


--
-- Name: planets planets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet);


--
-- Name: stars stars_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stars
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star);


--
-- Name: planets planets_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moons(moon);


--
-- Name: stars stars_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stars
    ADD CONSTRAINT stars_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planets(planet);


--
-- PostgreSQL database dump complete
--

