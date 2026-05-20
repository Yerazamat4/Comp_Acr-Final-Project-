--
-- PostgreSQL database dump
--

\restrict 9mkfCOGz0g4iAsWMuedCD5YOKqQ1Bd3oUQ73hnDgUSkclxmiJ7wJiXkqfg2ZMcs

-- Dumped from database version 16.13
-- Dumped by pg_dump version 16.13

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
-- Name: airports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airports (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    lat double precision,
    lon double precision
);


ALTER TABLE public.airports OWNER TO postgres;

--
-- Name: airports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.airports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.airports_id_seq OWNER TO postgres;

--
-- Name: airports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.airports_id_seq OWNED BY public.airports.id;


--
-- Name: booking_airports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking_airports (
    booking_id integer NOT NULL,
    from_airport_id integer,
    to_airport_id integer
);


ALTER TABLE public.booking_airports OWNER TO postgres;

--
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    id bigint NOT NULL,
    user_id bigint,
    jet_id bigint,
    departure_date timestamp without time zone NOT NULL,
    total_price double precision,
    status character varying(255) DEFAULT 'PENDING'::character varying,
    from_airport_id bigint,
    to_airport_id bigint,
    route character varying(255)
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_id_seq OWNER TO postgres;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- Name: jets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jets (
    id bigint NOT NULL,
    model character varying(255) NOT NULL,
    capacity bigint NOT NULL,
    price_per_hour double precision NOT NULL,
    status character varying(255) DEFAULT 'AVAILABLE'::character varying,
    photo_url character varying(255)
);


ALTER TABLE public.jets OWNER TO postgres;

--
-- Name: jets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jets_id_seq OWNER TO postgres;

--
-- Name: jets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jets_id_seq OWNED BY public.jets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255),
    email character varying(255),
    password character varying(255),
    phone_num character varying(255),
    role character varying(255) DEFAULT 'CLIENT'::character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: airports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airports ALTER COLUMN id SET DEFAULT nextval('public.airports_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: jets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jets ALTER COLUMN id SET DEFAULT nextval('public.jets_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airports (id, name, code, city, country, lat, lon) FROM stdin;
1	Almaty International Airport	ALA	Almaty	Kazakhstan	43.35	77.04
2	Astana International Airport	NQZ	Astana	Kazakhstan	51.02	71.47
3	John F. Kennedy International	JFK	New York	USA	40.64	-73.78
4	Dubai International Airport	DXB	Dubai	UAE	25.25	55.36
5	Heathrow Airport	LHR	London	UK	51.48	-0.46
6	Charles de Gaulle Airport	CDG	Paris	France	49.01	2.55
\.


--
-- Data for Name: booking_airports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking_airports (booking_id, from_airport_id, to_airport_id) FROM stdin;
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (id, user_id, jet_id, departure_date, total_price, status, from_airport_id, to_airport_id, route) FROM stdin;
2	5	1	2026-05-31 19:59:00	25000	CANCELLED	1	1	\N
3	5	2	2026-05-17 20:04:00	5000	CANCELLED	1	1	\N
4	5	2	2026-05-24 20:09:00	5000	CANCELLED	1	1	\N
5	5	3	2026-05-17 20:13:00	7000	CANCELLED	1	1	\N
6	5	3	2026-05-17 20:13:00	7000	CANCELLED	1	2	\N
8	5	2	2026-05-23 21:57:00	35000	CONFIRMED	1	6	\N
7	5	1	2026-05-17 21:25:00	0	CANCELLED	1	1	\N
9	5	2	2026-05-23 21:57:00	20000	CONFIRMED	1	4	\N
10	5	3	2026-05-18 21:59:00	0	CANCELLED	1	1	\N
\.


--
-- Data for Name: jets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jets (id, model, capacity, price_per_hour, status, photo_url) FROM stdin;
2	Gulfstream G650	14	5000	UNAVAILABLE	https://media.cnn.com/api/v1/images/stellar/prod/181203181548-gulfstream-g650-aerial-4.jpg?q=w_1600,h_900,x_0,y_0,c_fill
1	AC-130	80	25000	AVAILABLE	https://media.defense.gov/2008/Dec/18/2000647935/2000/2000/0/080820-F-5957S-912.JPG
3	Bombardier Global 7500	19	7000	AVAILABLE	https://jetvip.ru/media/plane/68876/image_12hXHQA.jpg
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, phone_num, role) FROM stdin;
1	Amir	examsd@gmail.com	$2a$10$wbM.za8xMT2fIKP2z5OM2.rvoroQ5Z0kCTdwtsHlhYB6wHr6A8jaC	872347825345	CLIENT
2	Amir	example@gmail.com	$2a$10$OiOOa98sG07jianZ6SkunuOFXXb4vgYP9NHOdKoX08wWmMosCHSlG	872347825345	CLIENT
3	u	qwerty@gmail.com	$2a$10$dcMdHz7Wx9l24rTPNIe55uPu6tZKA20s2Vjaceac/ogPK/BYjul8O	3456789	CLIENT
4	q	q@gmail.com	$2a$10$rQJg4wUC5k9kfMgp8prxFu1tIhZdZcPWfBtMkM3mt6eN94FI94Nru	12345	CLIENT
5	w	w	$2a$10$IbssO7DGP6kf7olXMGzPk.eWsC4nV94vMtR44z2vWI/3oIny0I/4.	12345	CLIENT
\.


--
-- Name: airports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.airports_id_seq', 6, true);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 10, true);


--
-- Name: jets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jets_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: airports airports_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_code_key UNIQUE (code);


--
-- Name: airports airports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);


--
-- Name: booking_airports booking_airports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_airports
    ADD CONSTRAINT booking_airports_pkey PRIMARY KEY (booking_id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: jets jets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jets
    ADD CONSTRAINT jets_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: booking_airports booking_airports_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_airports
    ADD CONSTRAINT booking_airports_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: booking_airports booking_airports_from_airport_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_airports
    ADD CONSTRAINT booking_airports_from_airport_id_fkey FOREIGN KEY (from_airport_id) REFERENCES public.airports(id) ON DELETE SET NULL;


--
-- Name: booking_airports booking_airports_to_airport_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking_airports
    ADD CONSTRAINT booking_airports_to_airport_id_fkey FOREIGN KEY (to_airport_id) REFERENCES public.airports(id) ON DELETE SET NULL;


--
-- Name: bookings bookings_from_airport_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_from_airport_id_fkey FOREIGN KEY (from_airport_id) REFERENCES public.airports(id);


--
-- Name: bookings bookings_jet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_jet_id_fkey FOREIGN KEY (jet_id) REFERENCES public.jets(id) ON DELETE SET NULL;


--
-- Name: bookings bookings_to_airport_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_to_airport_id_fkey FOREIGN KEY (to_airport_id) REFERENCES public.airports(id);


--
-- Name: bookings bookings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict 9mkfCOGz0g4iAsWMuedCD5YOKqQ1Bd3oUQ73hnDgUSkclxmiJ7wJiXkqfg2ZMcs

