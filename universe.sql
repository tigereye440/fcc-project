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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_description text,
    galaxy_age_in_million_years integer NOT NULL,
    galaxy_distance_from_earth numeric NOT NULL,
    galaxy_types text,
    is_spherical boolean
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
    moon_description text,
    moon_age_in_million_years integer NOT NULL,
    moon_distance_from_earth numeric NOT NULL,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_description text,
    planet_age_in_million_years integer NOT NULL,
    planet_distance_from_earth numeric NOT NULL,
    planet_has_life boolean NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_galaxy (
    planet_galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.planet_galaxy OWNER TO freecodecamp;

--
-- Name: planet_galaxy_planet_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_galaxy_planet_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_galaxy_planet_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: planet_galaxy_planet_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_galaxy_planet_galaxy_id_seq OWNED BY public.planet_galaxy.planet_galaxy_id;


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
    star_description text,
    star_age_in_million_years integer NOT NULL,
    star_distance_from_earth numeric(4,1) NOT NULL,
    star_is_spherical boolean,
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_galaxy planet_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy ALTER COLUMN planet_galaxy_id SET DEFAULT nextval('public.planet_galaxy_planet_galaxy_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy the Solar system is founc in. Estimated to contain about 100 to 400 billion stars. It is barred spiral in shape.', 13600000, 26670, 'Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'It is a spiral galaxy and it is the closest galaxy to the milky way.Estimated to contain about 1 trillion stars. It is the galaxy on a collision course with the milky way.', 10000000, 2537000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'It is a spiral galaxy and it is has active star forming areas. It is the biggest in the Local Group. Estimated to contain about 40 billion stars.', 15000000, 27237000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'It is an unbarred spiral galaxy. Known for its bright nucleus and prominent dust lane in its inclined disk, giving it a sombrero-like appearance. Estimated to contain about 100 billion stars.', 31000000, 13250000, 'Spiral', false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'With a mass of about 160 billion MO. Famous for its well-defined spiral structure and interaction with its companion galaxy, NGC 5195.It is an unbarred spiral galaxy. Known for its bright nucleus and prominent dust lane in its inclined disk, giving it a sombrero-like appearance. Estimated to contain about 100 billion stars.', 400300000, 31000000, 'Spiral', true);
INSERT INTO public.galaxy VALUES (6, 'Mesier 87', 'With a mass of about 6.5 tillion MO. Estimated to contain about 1 trillion stars.', 13240000, 53500000, 'Elliptical', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Only natural satellite of Earth, phases, craters.', 0, 4.5, 1);
INSERT INTO public.moon VALUES (2, 'Io', 'Most volcanically active body in the Solar System.', 628, 4.5, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 'Icy surface, potential subsurface ocean.', 628, 4.5, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon in the solar system, also has a magnetic field.', 628, 4.5, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Heavily cratered moon with an ancient surface.', 628, 4.5, 5);
INSERT INTO public.moon VALUES (7, 'Titan', 'Has thick atmosphere with liquid hydrocarbon lakes.', 1200, 4.5, 6);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'Possesses geysers ejecting water vapor with potential subsurface ocean.', 1200, 4.5, 6);
INSERT INTO public.moon VALUES (9, 'Mimas', 'Has a large crater called Herschel, "Death Star" appearance.', 1200, 4.5, 6);
INSERT INTO public.moon VALUES (10, 'Lapetus', 'Two-tone coloration, one dark and one light hemisphere.', 1200, 4.5, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Possible thin atmosphere, heavily cratered.', 1200, 4.5, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'Has an Icy surface with signs of geological activity', 1200, 4.5, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 'Icy surface, large craters, valleys.', 1200, 4.5, 6);
INSERT INTO public.moon VALUES (14, 'Titania', 'Largest moon of Uranus, signs of tectonic activity.', 2700, 4.5, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Second largest moon of Uranus, has reddish tint', 2700, 4.5, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'Dark, heavily cratered surface', 2700, 4.5, 7);
INSERT INTO public.moon VALUES (17, 'Ariel', 'Evidence of geological activity, canyons', 2700, 4.5, 7);
INSERT INTO public.moon VALUES (18, 'Miranda', 'Dramatic surface features, tectonic activity', 2700, 4.5, 7);
INSERT INTO public.moon VALUES (19, 'Triton', 'Has a retrograde orbit, with geysers ejecting nitrogen', 4300, 4.5, 8);
INSERT INTO public.moon VALUES (20, 'Phobos', 'Irregular shape, large Stickney crater', 78, 4.5, 4);
INSERT INTO public.moon VALUES (21, 'Neroid', 'Highly eccentric orbit, icy composition, possible capture origin', 4300, 4.5, 8);
INSERT INTO public.moon VALUES (22, 'Phoebe', 'Retrograde orbit, heavily cratered, dark surface, possible Kuiper Belt origin.', 1200, 4.5, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Venus', 'Similar in size and structure to earth. Thick toxic atmosphere. Hottest planet in the solar system.', 4500, 41.0, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only planet known to support life. Has a diverse climate and breathable atmosphere. Surface is 71% water. Has one moon.', 4540, 0.0, true, 1);
INSERT INTO public.planet VALUES (1, 'Mercury', 'Smallest planet in the solar system. Closest to the sun with no atmosphere to retain heat.', 4500, 77.0, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Known as the red planet due to iron oxide on its surface, Thin atmosphere composed of CO2.', 4500, 78.0, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in the solar system. Known for its Great Red Spot. Has 79 moons. Composed of mostly hydrogen and helium', 4500, 628.0, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The second largest planet in the solar system. Known for its extensive and bright ring system. Has 83 moons.', 4500, 127.5, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Unique for its extreme axial tilt about 98 degress. Has a faint ring system and 27 moons.', 4500, 2723, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The farthest planet from the sun. Has the strongest winds in the solar system. It has 14 moons.', 4500, 4351, false, 1);
INSERT INTO public.planet VALUES (10, 'Trappist 1E', 'One of seven known planets orbiting the ultracool dwarf star TRAPPIST-1, located within its habitable zone. TRAPPIST-1e is about 0.93 times the size of Earth.', 8000, 374640000, false, 6);
INSERT INTO public.planet VALUES (12, 'Trappist 1C', 'TRAPPIST-1c, also designated as 2MASS J23062928-0502285 c, is a mainly rocky exoplanet orbiting around the ultracool dwarf star TRAPPIST-1, located 40.7 light-years (12.5 parsecs) away from Earth in the constellation Aquarius.', 8000, 385050000, false, 6);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri B', 'Located in the habitable zone of Proxima Centauri, making it a prime candidate for potential habitability studies. It orbits its host star every 11.2 days.', 4850, 41003000, false, 2);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri C', 'Proxima Centauri c is an exoplanet orbiting the red dwarf star Proxima Centauri, which is the closest star to the Sun and part of a triple star system. It is located approximately 4.2 light-years (1.3 parsecs; 40 trillion kilometres; 25 trillion miles) from Earth in the constellation of Centaurus, making it, Proxima b, and Proxima d the closest known exoplanets to the Solar System.', 4850, 39740000, false, 2);


--
-- Data for Name: planet_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_galaxy VALUES (1, 2, 1, 'MILKY_V');
INSERT INTO public.planet_galaxy VALUES (2, 3, 1, 'MILKY_E');
INSERT INTO public.planet_galaxy VALUES (3, 1, 1, 'MILKY_M');
INSERT INTO public.planet_galaxy VALUES (4, 4, 1, 'MILKY_MA');
INSERT INTO public.planet_galaxy VALUES (5, 5, 1, 'MILKY_J');
INSERT INTO public.planet_galaxy VALUES (6, 6, 1, 'MILKY_S');
INSERT INTO public.planet_galaxy VALUES (7, 7, 1, 'MILKY_U');
INSERT INTO public.planet_galaxy VALUES (8, 8, 1, 'MILKY_N');
INSERT INTO public.planet_galaxy VALUES (9, 12, 1, 'MILKY_T1C');
INSERT INTO public.planet_galaxy VALUES (10, 10, 1, 'MILKY_T1E');
INSERT INTO public.planet_galaxy VALUES (11, 9, 1, 'MILKY_PCB');
INSERT INTO public.planet_galaxy VALUES (12, 13, 1, 'MILKY_PCC');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The star that is closest to the sun in the milky way galaxy. It is small and has a low mass', 4850, 950.0, true, 1);
INSERT INTO public.star VALUES (3, 'M31-RV', 'This is a red variable star.  Known for its dramatic changes in brightness over time. It is considered similar to the red supergiant variable stars in the Milky Way.', 1, 2.5, true, 3);
INSERT INTO public.star VALUES (1, 'Sun', 'The only star in the solar system that sits at the center, it is near perfect sperical', 4567, 1.6, true, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'It is the brightest star in the night sky and a red supergiant star.', 230, 8.6, true, 1);
INSERT INTO public.star VALUES (5, 'Mirach', 'Mirach Bayer designation Beta Andromedae, Latinized from β Andromedae, is a prominent star in the northern constellation of Andromeda.', 7000, 199.0, true, 2);
INSERT INTO public.star VALUES (6, 'Trappist-1', 'TRAPPIST-1 is a cool red dwarf star[c] with seven known exoplanets. It lies in the constellation Aquarius about 40.66 light-years away from Earth. Its radius is slightly larger than Jupiter and it has a mass of about 9% of the Sun. It is estimated to be 7.6 billion years old, making it older than the Solar System.', 41, 760.0, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_galaxy_planet_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_galaxy_planet_galaxy_id_seq', 12, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


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
-- Name: planet_galaxy planet_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_name_key UNIQUE (name);


--
-- Name: planet_galaxy planet_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_pkey PRIMARY KEY (planet_galaxy_id);


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
-- Name: planet_galaxy unique_galaxy_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT unique_galaxy_planet UNIQUE (planet_id, galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_galaxy planet_galaxy_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet_galaxy planet_galaxy_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_galaxy
    ADD CONSTRAINT planet_galaxy_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

