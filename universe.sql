--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    age_in_millions_of_years integer,
    has_life boolean,
    description text,
    distance_from_earth numeric(4,2),
    star_in text NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    age_in_millions_of_years integer,
    has_life boolean,
    description text,
    distance_from_earth numeric(4,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: musuem; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.musuem (
    musuem_id integer NOT NULL,
    location text,
    type_of character varying(60),
    name character varying(50),
    status character varying(30) NOT NULL
);


ALTER TABLE public.musuem OWNER TO freecodecamp;

--
-- Name: musuem_musuem_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.musuem_musuem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.musuem_musuem_id_seq OWNER TO freecodecamp;

--
-- Name: musuem_musuem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.musuem_musuem_id_seq OWNED BY public.musuem.musuem_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40),
    age_in_millions_of_years integer,
    has_life boolean,
    description text,
    distance_from_earth numeric(4,2),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    age_in_millions_of_years integer,
    has_life boolean,
    description text,
    distance_from_earth numeric(4,2),
    star_in text NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: musuem musuem_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.musuem ALTER COLUMN musuem_id SET DEFAULT nextval('public.musuem_musuem_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 4000, true, 'The milky way', 23.22, 'unsure');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 4000, true, 'Andromeda', 23.22, 'unsure');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 4000, true, 'Sombrero', 23.22, 'unsure');
INSERT INTO public.galaxy VALUES (4, 'Black Eye', 4000, true, 'Black Eye', 23.22, 'unsure');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 4000, true, 'Whirlpool', 23.22, 'unsure');
INSERT INTO public.galaxy VALUES (6, 'Messier', 4000, true, 'Messier', 23.22, 'unsure');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 400, false, '', 42.22, 1);
INSERT INTO public.moon VALUES (2, 'Ganymede', 400, false, '', 42.22, 1);
INSERT INTO public.moon VALUES (3, 'Adrastea', 400, false, '', 42.22, 1);
INSERT INTO public.moon VALUES (4, 'Titan', 400, false, '', 42.22, 1);
INSERT INTO public.moon VALUES (5, 'Mimas', 400, false, '', 42.22, 1);
INSERT INTO public.moon VALUES (6, 'JLV', 400, false, '', 42.22, 2);
INSERT INTO public.moon VALUES (7, 'Isonoe', 400, false, '', 42.22, 2);
INSERT INTO public.moon VALUES (8, 'Thebe', 400, false, '', 42.22, 2);
INSERT INTO public.moon VALUES (9, 'Cyllene', 400, false, '', 42.22, 3);
INSERT INTO public.moon VALUES (10, 'Kalyke', 400, false, '', 42.22, 3);
INSERT INTO public.moon VALUES (11, 'Ananke', 400, false, '', 42.22, 3);
INSERT INTO public.moon VALUES (12, 'lo', 400, false, '', 42.22, 3);
INSERT INTO public.moon VALUES (13, 'Europa', 400, false, '', 42.22, 4);
INSERT INTO public.moon VALUES (14, 'Helike', 400, false, '', 42.22, 4);
INSERT INTO public.moon VALUES (15, 'Mneme', 400, false, '', 42.22, 4);
INSERT INTO public.moon VALUES (16, 'Dione', 400, false, '', 42.22, 4);
INSERT INTO public.moon VALUES (17, 'Triton', 400, false, '', 42.22, 4);
INSERT INTO public.moon VALUES (18, 'Sponde', 400, false, '', 42.22, 4);
INSERT INTO public.moon VALUES (19, 'Sinope', 400, false, '', 42.22, 4);
INSERT INTO public.moon VALUES (20, 'Thyone', 400, false, '', 42.22, 4);


--
-- Data for Name: musuem; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.musuem VALUES (1, '', '', 'Hist of', 'open');
INSERT INTO public.musuem VALUES (2, '', '', 'Science 1', 'closed');
INSERT INTO public.musuem VALUES (3, '', '', 'Science 2', 'closed');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 400, true, '', 42.22, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 400, true, '', 42.22, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 400, true, '', 42.22, 2);
INSERT INTO public.planet VALUES (4, 'Uranus', 400, true, '', 42.22, 3);
INSERT INTO public.planet VALUES (5, 'Neptune', 400, true, '', 42.22, 4);
INSERT INTO public.planet VALUES (6, 'Venus', 400, true, '', 42.22, 4);
INSERT INTO public.planet VALUES (7, 'Mercury', 400, true, '', 42.22, 4);
INSERT INTO public.planet VALUES (8, 'Saturn', 400, true, '', 42.22, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 400, true, '', 42.22, 5);
INSERT INTO public.planet VALUES (10, 'Ceres', 400, true, '', 42.22, 5);
INSERT INTO public.planet VALUES (11, 'Makemake', 400, true, '', 42.22, 5);
INSERT INTO public.planet VALUES (12, 'Haumea', 400, true, '', 42.22, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 400, true, '', 42.22, 'lol', 1);
INSERT INTO public.star VALUES (2, 'Antares', 400, true, 'lol', 42.22, 'lol', 2);
INSERT INTO public.star VALUES (3, 'Vega', 400, true, '', 42.22, 'lol', 3);
INSERT INTO public.star VALUES (4, 'Sirius', 400, true, '', 42.22, 'lol', 4);
INSERT INTO public.star VALUES (5, 'Hamal', 400, true, '', 42.22, 'lol', 5);
INSERT INTO public.star VALUES (6, 'Alpha', 400, true, '', 42.22, 'lol', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: musuem_musuem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.musuem_musuem_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: musuem musuem_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.musuem
    ADD CONSTRAINT musuem_pkey PRIMARY KEY (musuem_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: musuem u_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.musuem
    ADD CONSTRAINT u_key UNIQUE (name);


--
-- Name: moon m_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT m_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet p_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT p_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star s_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT s_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

