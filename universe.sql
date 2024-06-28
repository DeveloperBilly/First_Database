--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellations (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_number integer,
    vip_star character varying(30),
    galaxy_id integer,
    is_visible_from_earth boolean
);


ALTER TABLE public.constellations OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellations.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text NOT NULL,
    mass_in_solar_mass numeric,
    star_number_in_bilion numeric,
    diameter_in_light_years integer
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
    name character varying(30) NOT NULL,
    surface_in_km2 character varying(30),
    gravity numeric,
    distance_from_parent_planet_in_km integer,
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
    type text,
    gravity_in_ms numeric,
    diameter_in_km integer,
    star_id integer
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
    name character varying(30) NOT NULL,
    age_in_million_years character varying(20),
    temperature_in_k integer,
    galaxy_id integer,
    type text,
    is_a_vip_star boolean
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
-- Name: constellations constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


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
-- Data for Name: constellations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellations VALUES (1, 'Orion', 81, 'Betelgeuse', 1, true);
INSERT INTO public.constellations VALUES (2, 'Ursa major', 20, 'Dubhe', 1, true);
INSERT INTO public.constellations VALUES (3, 'Andromeda', 16, 'Alpheratz', 2, true);
INSERT INTO public.constellations VALUES (4, 'Cassiopeia', 5, 'Schedar', 1, true);
INSERT INTO public.constellations VALUES (5, 'Lyra', 9, 'Vega', 1, true);
INSERT INTO public.constellations VALUES (6, 'Pegasus', 9, 'Enif', 1, true);
INSERT INTO public.constellations VALUES (7, 'Canis Major', 8, 'Sirius', 4, true);
INSERT INTO public.constellations VALUES (8, 'Triangulum', 3, 'Mothallah', 3, true);
INSERT INTO public.constellations VALUES (9, 'Cartwheel', NULL, NULL, 5, false);
INSERT INTO public.constellations VALUES (10, 'Antennae', NULL, NULL, 6, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral galaxy', 1500000000000, 100, 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda(M31)', 'Spiral galaxy', 1230000000000, 100000, 220000);
INSERT INTO public.galaxy VALUES (4, 'Canis Major(M41)', 'Spiral galaxy', 40000000000, 30, 55000);
INSERT INTO public.galaxy VALUES (6, 'Antennae Galaxies', 'Spiral galaxy', 150000000000, NULL, 70000);
INSERT INTO public.galaxy VALUES (7, 'Sombrero(M104)', 'Lens-shaped galaxy', 100000000000, NULL, 50000);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel Galaxy', 'Ring galaxy', 170000000000, NULL, 150000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum(M33)', 'Spiral galaxy', 50000000000, 40, 50000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', '37.9 million', 1.62, 384400, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', '1550', 0.0057, 6000, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', '495', 0.003, 20000, 2);
INSERT INTO public.moon VALUES (4, 'Io', '41.9 million', 1.79, 421700, 6);
INSERT INTO public.moon VALUES (5, 'Europa', '30.6 million', 1.31, 671100, 6);
INSERT INTO public.moon VALUES (6, 'Ganymede', '87.2 million', 1.43, 1070400, 6);
INSERT INTO public.moon VALUES (7, 'Callisto', '73 million', 1.24, 1882700, 6);
INSERT INTO public.moon VALUES (8, 'Titan', '83 million', 1.35, 1222000, 5);
INSERT INTO public.moon VALUES (9, 'Rhea', '7.33 million', 0.264, 527000, 5);
INSERT INTO public.moon VALUES (10, 'Iapetus', '7.59 million', 0.223, 3561300, 5);
INSERT INTO public.moon VALUES (11, 'Dione', '4.48 million', 0.232, 377400, 5);
INSERT INTO public.moon VALUES (12, 'Tethys', '8 million', 0.146, 294600, 5);
INSERT INTO public.moon VALUES (13, 'Titania', '7.36 million', 0.379, 435900, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', '7.33 million', 0.346, 583500, 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', '5.1 million', 0.233, 266000, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', '5.58 million', 0.27, 190900, 7);
INSERT INTO public.moon VALUES (17, 'Miranda', '2.88 million', 0.079, 129900, 7);
INSERT INTO public.moon VALUES (18, 'Triton', '23 million', 0.779, 354800, 4);
INSERT INTO public.moon VALUES (19, 'Proteus', '7.9 million', 0.06, 117600, 4);
INSERT INTO public.moon VALUES (20, 'UY Scuoti b1', NULL, NULL, NULL, 14);
INSERT INTO public.moon VALUES (21, 'UY Scuoti b2', NULL, NULL, NULL, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 9.8, 12742, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 3.7, 6779, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', 8.87, 12104, 1);
INSERT INTO public.planet VALUES (4, 'Neptune', 'Gas giant', 11.15, 49244, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas giant', 10.44, 116460, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'Gas giant', 24.79, 139820, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Terrestrial', 3.7, 4880, 1);
INSERT INTO public.planet VALUES (9, 'Alpheratz I', 'Extrasolar Planet (hypothetical)', NULL, NULL, 2);
INSERT INTO public.planet VALUES (10, 'Capella b', 'Extrasolar Planet (hypothetical)', NULL, NULL, 3);
INSERT INTO public.planet VALUES (11, 'Deneb b', 'Extrasolar Planet (hypothetical)', NULL, NULL, 4);
INSERT INTO public.planet VALUES (12, 'Betelgeuse b', 'Extrasolar Planet (hypothetical)', NULL, NULL, 5);
INSERT INTO public.planet VALUES (13, 'Antares a', 'Extrasolar Planet (hypothetical)', NULL, NULL, 6);
INSERT INTO public.planet VALUES (14, 'UY Scuoti b', 'Extrasolar Planet (hypothetical)', NULL, NULL, 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', 8.69, 50724, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', '4600', 5773, 1, 'Yellow dwarf(G2V)', false);
INSERT INTO public.star VALUES (3, 'Capella', '500-750', 4900, 3, 'Orange giant', false);
INSERT INTO public.star VALUES (4, 'Deneb', '8-20', 8500, 4, 'Bright supergiant', false);
INSERT INTO public.star VALUES (5, 'Betelgeuse', '8-8.5', 3500, 5, 'Red supergiant', true);
INSERT INTO public.star VALUES (6, 'Antares', '12', 3500, 6, 'Red supergiant', false);
INSERT INTO public.star VALUES (7, 'UY Scuoti', 'many', 3500, 7, 'Red supergiant', false);
INSERT INTO public.star VALUES (2, 'Alpheratz', '10-12', 7500, 2, 'Supergiant', true);


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellations constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellations constellations_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

