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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    density_g_cm3 numeric(4,2) NOT NULL,
    dimensions character varying(20)
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    constellation character varying(20),
    distance_earth_millions_light_years numeric(4,2),
    apparent_magnitude numeric(4,2)
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
    name character varying(20) NOT NULL,
    orbital_period numeric(6,2) NOT NULL,
    temperature_k integer,
    has_life boolean,
    planet_id integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_type character varying(30) NOT NULL,
    moons integer,
    mass numeric(5,2),
    has_life boolean,
    star_id integer,
    description text
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
    name character varying(20) NOT NULL,
    spectral_type character varying(10) NOT NULL,
    apparent_magnitude numeric(5,2),
    absolute_magnitude numeric(4,2),
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Cometa Halley', 0.60, '15x8x8');
INSERT INTO public.comet VALUES (2, '16P/Borrelly', 0.30, '8x4x4');
INSERT INTO public.comet VALUES (3, '81P/Wild', 0.60, '5.5x4x3.3');
INSERT INTO public.comet VALUES (4, '67P/Churyumov-Gerasimenko', 0.47, '4.1x3.3x1.8');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'Espiral Barrada', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Espiral', 'Andromeda', 2.56, 4.17);
INSERT INTO public.galaxy VALUES (3, 'Triangulo', 'Espiral', 'Triangulum', 2.64, 6.19);
INSERT INTO public.galaxy VALUES (4, 'Enana del Can Mayor', 'Irregular', 'Canis Maior', 0.03, NULL);
INSERT INTO public.galaxy VALUES (5, 'Enana Eliptica de Sagitario', 'Eliptica', 'Sagitario', 0.08, 4.50);
INSERT INTO public.galaxy VALUES (6, 'Gran Nube de Magallanes', 'Enana', 'Dorado y Mensa', 0.16, 4.50);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 29.00, 380, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Fobos', 0.32, 233, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1.25, 233, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Adrastea', 0.30, NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Aitne', 680.00, NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Amaltea', 0.50, 120, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Aedea', 715.00, NULL, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Caldona', 699.00, NULL, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Calisto', 16.50, 134, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Carpo', 456.10, NULL, NULL, 5);
INSERT INTO public.moon VALUES (11, 'Europa', 3.50, 75, NULL, 5);
INSERT INTO public.moon VALUES (12, 'Atlas', 0.60, 81, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Dafne', 0.60, NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 2.25, 87, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Helena', 2.75, NULL, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Mimas', 1.00, 64, NULL, 6);
INSERT INTO public.moon VALUES (17, 'Ariel', 2.52, 58, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Cupido', 0.62, 64, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Margarita', 1687.00, 65, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Miranda', 1.41, 86, NULL, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 'Terrestrial', NULL, 0.06, NULL, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', NULL, 0.82, NULL, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Marte', 'Terrestrial', 2, 0.11, NULL, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas', 79, 318.00, NULL, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturno', 'Gas', 82, 95.00, NULL, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Urano', 'Gas', 27, 14.60, NULL, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptuno', 'Gas', 14, 17.20, NULL, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Alfa Centauri bb', 'Terrestrial', NULL, NULL, NULL, 2, NULL);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri', 'Terrestrial', NULL, NULL, NULL, 2, NULL);
INSERT INTO public.planet VALUES (11, 'HD 20794 c', 'Terrestrial', NULL, NULL, NULL, 5, NULL);
INSERT INTO public.planet VALUES (12, 'HD 20794 d', 'Terrestrial', NULL, NULL, NULL, 5, NULL);
INSERT INTO public.planet VALUES (3, 'Tierra', 'Terrestrial', 1, 1.00, true, 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'G2V', -26.73, 4.80, 1);
INSERT INTO public.star VALUES (2, 'Alfa Centauri', 'G2V', -0.01, 4.34, 1);
INSERT INTO public.star VALUES (3, 'Tau Ceti', 'G8Vp', 3.49, 5.68, 1);
INSERT INTO public.star VALUES (4, 'Achird', 'G3V', 3.46, 4.59, 1);
INSERT INTO public.star VALUES (5, '82 Eridani', 'G5V', 4.26, 5.35, 1);
INSERT INTO public.star VALUES (6, 'Delta Pavonis', 'G8V', 3.55, 4.62, 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

