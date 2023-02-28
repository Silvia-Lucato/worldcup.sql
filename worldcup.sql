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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(40) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (793, 2018, 'Final', 1152, 1153, 4, 2);
INSERT INTO public.games VALUES (794, 2018, 'Third Place', 1154, 1155, 2, 0);
INSERT INTO public.games VALUES (795, 2018, 'Semi-Final', 1153, 1155, 2, 1);
INSERT INTO public.games VALUES (796, 2018, 'Semi-Final', 1152, 1154, 1, 0);
INSERT INTO public.games VALUES (797, 2018, 'Quarter-Final', 1153, 1156, 3, 2);
INSERT INTO public.games VALUES (798, 2018, 'Quarter-Final', 1155, 1157, 2, 0);
INSERT INTO public.games VALUES (799, 2018, 'Quarter-Final', 1154, 1158, 2, 1);
INSERT INTO public.games VALUES (800, 2018, 'Quarter-Final', 1152, 1159, 2, 0);
INSERT INTO public.games VALUES (801, 2018, 'Eighth-Final', 1155, 1160, 2, 1);
INSERT INTO public.games VALUES (802, 2018, 'Eighth-Final', 1157, 1161, 1, 0);
INSERT INTO public.games VALUES (803, 2018, 'Eighth-Final', 1154, 1162, 3, 2);
INSERT INTO public.games VALUES (804, 2018, 'Eighth-Final', 1158, 1163, 2, 0);
INSERT INTO public.games VALUES (805, 2018, 'Eighth-Final', 1153, 1164, 2, 1);
INSERT INTO public.games VALUES (806, 2018, 'Eighth-Final', 1156, 1165, 2, 1);
INSERT INTO public.games VALUES (807, 2018, 'Eighth-Final', 1159, 1166, 2, 1);
INSERT INTO public.games VALUES (808, 2018, 'Eighth-Final', 1152, 1167, 4, 3);
INSERT INTO public.games VALUES (809, 2014, 'Final', 1168, 1167, 1, 0);
INSERT INTO public.games VALUES (810, 2014, 'Third Place', 1169, 1158, 3, 0);
INSERT INTO public.games VALUES (811, 2014, 'Semi-Final', 1167, 1169, 1, 0);
INSERT INTO public.games VALUES (812, 2014, 'Semi-Final', 1168, 1158, 7, 1);
INSERT INTO public.games VALUES (813, 2014, 'Quarter-Final', 1169, 1170, 1, 0);
INSERT INTO public.games VALUES (814, 2014, 'Quarter-Final', 1167, 1154, 1, 0);
INSERT INTO public.games VALUES (815, 2014, 'Quarter-Final', 1158, 1160, 2, 1);
INSERT INTO public.games VALUES (816, 2014, 'Quarter-Final', 1168, 1152, 1, 0);
INSERT INTO public.games VALUES (817, 2014, 'Eighth-Final', 1158, 1171, 2, 1);
INSERT INTO public.games VALUES (818, 2014, 'Eighth-Final', 1160, 1159, 2, 0);
INSERT INTO public.games VALUES (819, 2014, 'Eighth-Final', 1152, 1172, 2, 0);
INSERT INTO public.games VALUES (820, 2014, 'Eighth-Final', 1168, 1173, 2, 1);
INSERT INTO public.games VALUES (821, 2014, 'Eighth-Final', 1169, 1163, 2, 1);
INSERT INTO public.games VALUES (822, 2014, 'Eighth-Final', 1170, 1174, 2, 1);
INSERT INTO public.games VALUES (823, 2014, 'Eighth-Final', 1167, 1161, 1, 0);
INSERT INTO public.games VALUES (824, 2014, 'Eighth-Final', 1154, 1175, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (1152, 'France');
INSERT INTO public.teams VALUES (1153, 'Croatia');
INSERT INTO public.teams VALUES (1154, 'Belgium');
INSERT INTO public.teams VALUES (1155, 'England');
INSERT INTO public.teams VALUES (1156, 'Russia');
INSERT INTO public.teams VALUES (1157, 'Sweden');
INSERT INTO public.teams VALUES (1158, 'Brazil');
INSERT INTO public.teams VALUES (1159, 'Uruguay');
INSERT INTO public.teams VALUES (1160, 'Colombia');
INSERT INTO public.teams VALUES (1161, 'Switzerland');
INSERT INTO public.teams VALUES (1162, 'Japan');
INSERT INTO public.teams VALUES (1163, 'Mexico');
INSERT INTO public.teams VALUES (1164, 'Denmark');
INSERT INTO public.teams VALUES (1165, 'Spain');
INSERT INTO public.teams VALUES (1166, 'Portugal');
INSERT INTO public.teams VALUES (1167, 'Argentina');
INSERT INTO public.teams VALUES (1168, 'Germany');
INSERT INTO public.teams VALUES (1169, 'Netherlands');
INSERT INTO public.teams VALUES (1170, 'Costa Rica');
INSERT INTO public.teams VALUES (1171, 'Chile');
INSERT INTO public.teams VALUES (1172, 'Nigeria');
INSERT INTO public.teams VALUES (1173, 'Algeria');
INSERT INTO public.teams VALUES (1174, 'Greece');
INSERT INTO public.teams VALUES (1175, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 824, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 1175, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

