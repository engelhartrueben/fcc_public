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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    star_id integer,
    name character varying(90) NOT NULL,
    orbital_period integer
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
    name character varying(90) NOT NULL,
    width_in_light_years integer,
    type character varying(90),
    distance_from_earth_in_light_years integer
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
    planet_id integer,
    name character varying(90) NOT NULL,
    distance_from_planet_in_millions_km numeric(8,2),
    orbit_period integer
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
    star_id integer,
    name character varying(90) NOT NULL,
    type character varying(90),
    distance_from_host_star_in_au integer,
    description text,
    has_life boolean,
    has_rings boolean
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
    galaxy_id integer,
    name character varying(90) NOT NULL,
    type character varying(90),
    width_in_millions_of_km integer
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

INSERT INTO public.comet VALUES (1, 1, 'Haley', 200);
INSERT INTO public.comet VALUES (2, 2, 'A comet', 24);
INSERT INTO public.comet VALUES (3, 1, 'Another one', 3000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Galaxy One', 250, 'Spiral', 4000);
INSERT INTO public.galaxy VALUES (2, 'Galaxy Two', 180, 'Barrel', 8900);
INSERT INTO public.galaxy VALUES (3, 'Galaxy Three', 420, 'Sphere', 10200);
INSERT INTO public.galaxy VALUES (4, 'Galaxy Four', 45, 'Spiral', 2500);
INSERT INTO public.galaxy VALUES (5, 'Galaxy Five', 600, 'Irregular', 45000);
INSERT INTO public.galaxy VALUES (6, 'Galaxy Six', 945, 'Seyfert', 2450);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'moon 1', 4.00, 2);
INSERT INTO public.moon VALUES (2, 1, 'moon 2', 5.00, 4);
INSERT INTO public.moon VALUES (3, 1, 'moon 3', 6.00, 2);
INSERT INTO public.moon VALUES (4, 1, 'moon 4', 3.00, 2);
INSERT INTO public.moon VALUES (5, 2, 'moon 5', 29.00, 2);
INSERT INTO public.moon VALUES (6, 2, 'moon 6', 3.00, 21);
INSERT INTO public.moon VALUES (7, 2, 'moon 7', 4.00, 44);
INSERT INTO public.moon VALUES (8, 3, 'moon 8', 42.00, 42);
INSERT INTO public.moon VALUES (9, 4, 'moon 9', 4.00, 5);
INSERT INTO public.moon VALUES (10, 6, 'moon 10', 90.00, 65);
INSERT INTO public.moon VALUES (11, 12, 'moon 11', 4.00, 3);
INSERT INTO public.moon VALUES (12, 15, 'moon 12', 5.00, 5);
INSERT INTO public.moon VALUES (13, 12, 'moon 13', 3.00, 8);
INSERT INTO public.moon VALUES (14, 20, 'moon 14', 9.00, 10);
INSERT INTO public.moon VALUES (15, 19, 'moon 15', 6.00, 6);
INSERT INTO public.moon VALUES (16, 19, 'moon 16', 2.00, 2);
INSERT INTO public.moon VALUES (17, 1, 'moon 17', 98.00, 98);
INSERT INTO public.moon VALUES (18, 8, 'moon 18', 50.00, 23);
INSERT INTO public.moon VALUES (19, 9, 'moon 19', 43.00, 33);
INSERT INTO public.moon VALUES (20, 1, 'moon 20', 100.00, 120);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 'Rocky', 1, 'mid sized, decent atmosphere. lots of water', true, false);
INSERT INTO public.planet VALUES (2, 2, 'A9XYGE', 'Rocky', 3, 'a planet with rings', false, true);
INSERT INTO public.planet VALUES (3, 2, 'TH98DE', 'Rocky', 3, 'unsure how we know life is here but whatever', true, false);
INSERT INTO public.planet VALUES (4, 3, 'GHBN90', 'Rocky', 3, 'recently discovered', false, false);
INSERT INTO public.planet VALUES (5, 3, 'JKIO87', 'Rocky', 2, 'far far away there was a jedi or something', false, false);
INSERT INTO public.planet VALUES (6, 4, 'OI09JH', 'Rocky', 3, 'a super duper silly planet', false, false);
INSERT INTO public.planet VALUES (7, 4, 'RE65RE', 'Rocky', 3, '???', false, false);
INSERT INTO public.planet VALUES (8, 5, 'NM32HF', 'Rocky', 6, 'the planet of bread', false, true);
INSERT INTO public.planet VALUES (9, 5, 'DP75KE', 'Rocky', 3, 'IDK', false, false);
INSERT INTO public.planet VALUES (10, 6, 'BI32BI', 'Rocky', 2, 'A planet of bi', false, true);
INSERT INTO public.planet VALUES (12, 1, 'KL02BF', 'Rocky', 6, 'ultimately unsure', false, false);
INSERT INTO public.planet VALUES (13, 1, 'BH7878', 'Rocky', 3, 'totaly and entirley weird', false, false);
INSERT INTO public.planet VALUES (14, 2, '424242', 'Rocky', 4, 'the answer', true, false);
INSERT INTO public.planet VALUES (15, 2, 'Marvin', 'Rocky', 1, 'we gave marvin his own planet and named it after him', true, false);
INSERT INTO public.planet VALUES (16, 3, '54BG32', 'Rocky', 2, 'the intern found it, we dont know whats going on her', false, false);
INSERT INTO public.planet VALUES (17, 3, 'GR98GR', 'Rocky', 6, 'its a rock in space, who would have guessed', false, false);
INSERT INTO public.planet VALUES (18, 4, 'TH74FP', 'rocky', 4, 'another rock. wow', false, false);
INSERT INTO public.planet VALUES (19, 4, 'BH90BK', 'Gas', 4, 'its a ball of gas', false, false);
INSERT INTO public.planet VALUES (20, 5, 'BH84KI', 'Gas', 8, 'you think itd make a nice vacay?', false, false);
INSERT INTO public.planet VALUES (21, 5, 'KI33LL', 'ROCK', 3, 'ROCK', false, false);
INSERT INTO public.planet VALUES (22, 6, 'BI99NM', 'Rock', 6, 'not rock rock, but rock', false, false);
INSERT INTO public.planet VALUES (23, 6, 'Mars', 'Rocky', 1, 'relatively small, bad atmosphere', false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Lynx', 'Red Giant', 200);
INSERT INTO public.star VALUES (2, 2, 'Crux', 'Brown Dwarf', 45);
INSERT INTO public.star VALUES (3, 3, 'Leo', 'Neutron', 65);
INSERT INTO public.star VALUES (4, 4, 'Cancer', 'Red Dwarf', 120);
INSERT INTO public.star VALUES (5, 5, 'Taurus', 'Red Giant', 600);
INSERT INTO public.star VALUES (6, 6, 'Lyra', 'Brown Dwarf', 37);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 23, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet unique_comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: comet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

