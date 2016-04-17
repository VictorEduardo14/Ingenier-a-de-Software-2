--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.1
-- Started on 2016-04-03 22:55:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 186 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2092 (class 0 OID 0)
-- Dependencies: 186
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 65708)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clientes (
    id_cliente integer NOT NULL,
    razon_social character varying(40) NOT NULL,
    rfc character varying(13) NOT NULL,
    domicilio character varying(40) NOT NULL,
    telefono character varying(12) NOT NULL
);


ALTER TABLE clientes OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 65788)
-- Name: cobranza; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cobranza (
    id_cliente integer,
    folio integer
);


ALTER TABLE cobranza OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 65753)
-- Name: credito_a_clientes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE credito_a_clientes (
    id_credito_a_clientes integer NOT NULL,
    id_cliente integer,
    plazo character varying(20) NOT NULL,
    limite_credito double precision NOT NULL
);


ALTER TABLE credito_a_clientes OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 65763)
-- Name: cuentas_por_pagar; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cuentas_por_pagar (
    id_cuentas_por_pagar integer NOT NULL,
    id_proveedor integer,
    monto double precision NOT NULL,
    folio integer NOT NULL
);


ALTER TABLE cuentas_por_pagar OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 65743)
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departamento (
    id_departamento integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE departamento OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 65778)
-- Name: facturas_compras; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE facturas_compras (
    folio integer NOT NULL,
    id_proveedor integer,
    fecha date NOT NULL,
    plazo character varying(20) NOT NULL,
    monto double precision NOT NULL
);


ALTER TABLE facturas_compras OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 65733)
-- Name: facturas_ventas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE facturas_ventas (
    folio integer NOT NULL,
    id_cliente integer,
    fecha date NOT NULL,
    monto double precision NOT NULL,
    metodo_de_pago character varying(12) NOT NULL
);


ALTER TABLE facturas_ventas OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 65748)
-- Name: gastos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE gastos (
    id_gastos integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    monto double precision NOT NULL
);


ALTER TABLE gastos OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 65827)
-- Name: inventario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE inventario (
    id_producto integer NOT NULL,
    descripcion character varying(50) NOT NULL,
    existencia integer NOT NULL,
    id_departamento integer
);


ALTER TABLE inventario OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 65809)
-- Name: mantenimiento_vehiculo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mantenimiento_vehiculo (
    id_vehiculo integer,
    descripcion character varying(40) NOT NULL,
    fecha_de_mantenimiento date NOT NULL,
    kilometraje double precision NOT NULL,
    id_mantenimiento integer
);


ALTER TABLE mantenimiento_vehiculo OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 65801)
-- Name: propiedades_credito; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE propiedades_credito (
    id_credito integer,
    tipo_de_propiedad character varying(40) NOT NULL,
    valor double precision NOT NULL,
    id_propiedad integer
);


ALTER TABLE propiedades_credito OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 65713)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proveedores (
    id_proveedor integer NOT NULL,
    razon_social character varying(40) NOT NULL,
    domicilio character varying(40) NOT NULL,
    rfc character varying(13) NOT NULL,
    telefono character varying(12) NOT NULL
);


ALTER TABLE proveedores OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 65723)
-- Name: solicitud_de_credito; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE solicitud_de_credito (
    id_credito integer NOT NULL,
    razon_social character varying(40) NOT NULL,
    tipo_identificacion character varying(10) NOT NULL,
    acta_constitutiva character varying(30) NOT NULL,
    domicilio character varying(30) NOT NULL,
    actividad_empresarial character varying(30) NOT NULL,
    id_solicitud_de_credito integer
);


ALTER TABLE solicitud_de_credito OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 65718)
-- Name: vehiculos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vehiculos (
    id_vehiculo integer NOT NULL,
    modelo character varying(30) NOT NULL,
    marca character varying(30) NOT NULL,
    anio integer NOT NULL,
    placas character varying(10) NOT NULL,
    color character varying(10) NOT NULL
);


ALTER TABLE vehiculos OWNER TO postgres;

--
-- TOC entry 2071 (class 0 OID 65708)
-- Dependencies: 172
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clientes (id_cliente, razon_social, rfc, domicilio, telefono) FROM stdin;
7	Maria Del Socorro Beltran Jimenez	BEJS640410E5	Av.Pedro Moreno #467-A Guadalajara Jal	3366277381
8	LH Distribuidor SA de CV	LDI990115G26	Rio Rhin #261 Guadalajara Jal	3374665300
11	Juan Márquez López	MALOJ610970C2	Av. del Manzano #4990	3336292531
1	Respresentaciones JMP	JOPAM37493002	preiferico norte #234 Guadalajara Jal	3336483903
10	Medimex GDL De RL De CV	MGD071113N20	Av.Lazaro Cardenas #455 Guadalajara Jal.	3374774759
2	Gabriela Gutierrez Larios	GULG670926VC9	claz. Lazaro Cardenas #456-B Colima Col	3174920041
4	Distribuidora Hugos SA de CV	DHU980904DL0	Gugantes #789 Guadalajara Jal	3364738192
5	Impulsora Coercial Colimense SA de CV	ICC971206NF4	Dante #647 Colima Col	32647382935
6	Grupo Ferretero El Caminante SA de CV	GFC921211BB5	Lazaro Cardenas #27 Colima Col	3164738823
9	Georgina Gonzalez Fuentes	GOFG6502213B6	Av.Hidalgo #546 Colima Col	3155336478
3	Abarrotera Espinoza SA de CV.	AES9406067S1	Av.Benito Juarez #134 Colima Col	3274839405
\.


--
-- TOC entry 2081 (class 0 OID 65788)
-- Dependencies: 182
-- Data for Name: cobranza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cobranza (id_cliente, folio) FROM stdin;
1	6
5	5
8	7
1	8
1	4
4	9
2	3
10	10
3	2
5	1
\.


--
-- TOC entry 2078 (class 0 OID 65753)
-- Dependencies: 179
-- Data for Name: credito_a_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY credito_a_clientes (id_credito_a_clientes, id_cliente, plazo, limite_credito) FROM stdin;
3	8	30 dias	80000
11	11	30 dias	30000
10	1	30 dias	80000
1	10	15 dias	80000
2	9	15 dias	30000
4	7	30 dias	80000
5	6	15 dias	30000
6	5	30 dias	80000
7	4	15 dias	30000
8	3	30 dias	80000
9	2	30 dias	80000
\.


--
-- TOC entry 2079 (class 0 OID 65763)
-- Dependencies: 180
-- Data for Name: cuentas_por_pagar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cuentas_por_pagar (id_cuentas_por_pagar, id_proveedor, monto, folio) FROM stdin;
1	2	3782.8400000000001	133
2	4	747.38	567
3	2	374.38	677
4	1	3234.4499999999998	7899
5	8	10339.76	7533
6	10	2839	233
7	3	345	3344
8	6	5005.5600000000004	567
9	4	2899	1235
10	2	17000.360000000001	54
\.


--
-- TOC entry 2076 (class 0 OID 65743)
-- Dependencies: 177
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY departamento (id_departamento, nombre) FROM stdin;
1	medicina
2	perfumeria
3	ferreteria
4	abarrotes
5	curacion
6	papeleria
7	higiene personal
\.


--
-- TOC entry 2080 (class 0 OID 65778)
-- Dependencies: 181
-- Data for Name: facturas_compras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facturas_compras (folio, id_proveedor, fecha, plazo, monto) FROM stdin;
1	3	2015-09-02	15 dias	12366.34
2	1	2014-07-24	30 dias	2345.6700000000001
3	3	2015-07-15	15 dias	342.23000000000002
4	6	2015-12-02	30 dias	3578.6500000000001
5	3	2014-09-15	30 dias	23000.43
6	3	2015-12-30	30 dias	459.43000000000001
7	8	2013-01-23	15 dias	1500
8	9	2015-09-28	15 dias	3400
9	4	2014-01-31	15 dias	345
10	2	2015-10-24	30 dias	2113.5500000000002
11	6	2015-11-17	15 dias	1.1000000000000001
12	10	2011-11-11	15 dias	1.1000000000000001
14	11	2011-11-11	15 dias	444444.44439999998
13	8	2013-11-13	15 dias	4.4444400000000002
15	13	2011-11-21	30 dias	3.4849999999999999
16	6	2016-05-12	30 dias	999.99900000000002
\.


--
-- TOC entry 2075 (class 0 OID 65733)
-- Dependencies: 176
-- Data for Name: facturas_ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY facturas_ventas (folio, id_cliente, fecha, monto, metodo_de_pago) FROM stdin;
1	3	2015-09-10	10459.23	contado
2	5	2013-09-17	3547.98	credito
3	3	2014-01-10	5003.25	contado
4	5	2015-10-02	17903.240000000002	credito
5	3	2014-07-23	547.57000000000005	contado
6	3	2014-09-10	976.55999999999995	credito
7	1	2015-12-02	3478.4699999999998	contado
8	5	2013-09-23	12847.57	contado
9	2	2015-03-30	9345.5599999999995	credito
15	4	2015-09-15	89.900000000000006	credito
18	3	2011-11-17	1.1000000000000001	credito
19	1	2015-11-17	1.1000000000000001	credito
13	10	2010-10-10	6.5999999999999996	contado
10	8	2022-12-22	4444.4444000000003	credito
14	7	2016-11-11	1.1000000000000001	credito
20	2	2015-11-23	6.5999999999999996	contado
21	10	2015-11-23	3.2999999999999998	credito
22	11	2015-11-23	22000	contado
23	11	2015-11-24	5000	contado
24	9	2016-02-08	9.9000000000000004	credito
25	8	2016-02-16	1.1000000000000001	credito
26	6	2016-03-05	9.9000000000000004	credito
27	10	2016-04-01	999.99900000000002	contado
\.


--
-- TOC entry 2077 (class 0 OID 65748)
-- Dependencies: 178
-- Data for Name: gastos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY gastos (id_gastos, descripcion, monto) FROM stdin;
1	gastos varios	124.54000000000001
2	hojas de papel	500
4	gastos varios	3058.6399999999999
5	grapas	100.23
6	gastos varios	865.60000000000002
7	gastos varios	124.56999999999999
8	engrapadoras	300
9	libreta	280.44999999999999
10	toner	350
11	pan bimbo nuevo	45.700000000000003
12	hojaldre de limon	12.449999999999999
3	plumas	148.5
13	lata de aire comprimido	50.68
14	engrapadoras	530.87
15	Desarmadores	200.5
16	hola	12.23
17	probando gastos	999.99900000000002
\.


--
-- TOC entry 2084 (class 0 OID 65827)
-- Dependencies: 185
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY inventario (id_producto, descripcion, existencia, id_departamento) FROM stdin;
4	Aceite Menen 50ml	3	7
5	Aceite Olivo Jaloma	50	3
6	Terramicina Troscisco	30	1
7	Sedalmerck 200mg	25	1
8	Sh.Sedal 300ml	2	2
9	Cinta Navitek	1	6
10	Baygon Aerosol	20	3
3	Raid Casa y Jardin	3	3
11	Paracetamol	133	1
12	venda #5 Jaloma	50	5
14	Aspirina	30	1
15	segunda prueba del producto	88	3
\.


--
-- TOC entry 2083 (class 0 OID 65809)
-- Dependencies: 184
-- Data for Name: mantenimiento_vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mantenimiento_vehiculo (id_vehiculo, descripcion, fecha_de_mantenimiento, kilometraje, id_mantenimiento) FROM stdin;
2	cambio de aceite	2015-07-25	208	1
3	transimision	2015-03-23	10374.450000000001	2
7	bateria	2014-07-22	504	3
5	transimision	2015-07-15	12456	4
9	cambio de aceite	2015-12-13	354	5
2	cambio de aceite	2014-03-16	235	6
9	bateria	2015-03-18	578	7
8	cambio de aceite	2014-07-30	198.87	8
2	frenos	2015-12-12	784.88	9
1	cambio de aceite	2015-07-24	279	10
9	cambio de rines	2011-11-11	2000	11
2	rines nuevos	2011-11-11	30222.450000000001	12
2	cambio de aceite	2011-12-11	1000	13
9	cambio rines	2011-11-11	390.87	14
4	frenos	2015-11-23	3.2999999999999998	17
12	Cambio de Frenos	2015-11-23	2000.98	18
11	Frenos	2011-11-11	6765765	16
11	Llantas	2011-11-11	3000.8899999999999	15
11	anticongelante nuevo	2011-11-21	56686.089999999997	19
11	afinacion	2015-11-24	800	20
8	probando mantenimientos	2016-04-01	3000	21
\.


--
-- TOC entry 2082 (class 0 OID 65801)
-- Dependencies: 183
-- Data for Name: propiedades_credito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY propiedades_credito (id_credito, tipo_de_propiedad, valor, id_propiedad) FROM stdin;
1	terreno	2300000	1
2	casa	2500000	2
3	terreno	23000000	3
4	terreno	300000	4
5	terreno	1000000	5
6	auto/terreno	1230000	6
7	casa	500000	7
8	auto	150000	8
9	auto/casa	2543000	9
10	casa	2000000	10
4	auto	8977.8700000000008	11
5	auto	45000	12
8	auto	18000	13
\.


--
-- TOC entry 2072 (class 0 OID 65713)
-- Dependencies: 173
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proveedores (id_proveedor, razon_social, domicilio, rfc, telefono) FROM stdin;
2	Francisco Vega Carrillo	Av.Pedro Moreno #476 Guadalajara Jal	VECF831126S71	3364656868
3	Roberto De Lira Carrillo	Juarez #646 Guadalajara Jal	LICR941118DH7	336654332
4	Distribuidora Hugos SA de CV	Gigantes #789 Guadalajara Jal	DHU980904DL0	3364738192
5	Distribuidora Mergom SA de CV	calle 3 #65 Merc.Abastos Guadalajara Jal	STD9007188C5	3348855760
6	Maria Guadalupe Ruiz Escoto	Bethoveen #785 Guadalajara Jal	RUEG471204PMA	3377565004
7	Papeleria El Cisne SA de CV	Calz.Poniente #647 Zamora Mich	CIPA774893D5	5577384905
9	Adriana Guadalupe Verduzco Morfin	Av.Vallarta #74-B Guadalajara Jal	VEMA85091NF5	3364773848
1	Respresentaciones JMP	preiferico norte #234 Guadalajara Jal	JOPAM37493002	3336483903
10	Medimex GDL De RL De CV	Av.Lazaro Cardenas #455 Guadalajara Jal	MGD071113N20	3374774759
8	LH Distribuidor SA de CV.	Rio Rhin #261 Guadalajara Jal	LDI990115G26	3374665300
11	Oscar Diaz Marquez	344455464	jalapa 344	OSDM4343522
12	juanito	3444344	jajajaja	JEJEJEN
13	Juan Márquez López	Gabrielle Da Nunzio #4990	MALOJ610970C2	3336292531
\.


--
-- TOC entry 2074 (class 0 OID 65723)
-- Dependencies: 175
-- Data for Name: solicitud_de_credito; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY solicitud_de_credito (id_credito, razon_social, tipo_identificacion, acta_constitutiva, domicilio, actividad_empresarial, id_solicitud_de_credito) FROM stdin;
1	Gabriela Tamirez Zamora	INE	no	Alcalde #34	si	1
2	Centro Ferretero	cedula	si	Carretera Chapala	si	2
3	Ferdinando Ruiz Valencia	INE	no	Av. Constitucion #90	si	3
5	Joel Torres Mancilla	INE	no	Carretera Toluca #900	si	5
6	Miguel Angel Ramos Murillo	pasaporte	no	Lopez Mateos #6285	si	6
8	Mini Super Liberacion	INE	si	calzada #12	si	8
9	Vidal Ochoa	INE	no	Ocampo #120	si	9
10	Jose Lopez Cardenas	INE	no	Gigante #20	si	10
7	Octavio Guerrero	INE	no	R.f.magon #1366	si	7
4	Gabriela Gutierrez Larios	INE	si	Carretera Chapala #789	si	4
\.


--
-- TOC entry 2073 (class 0 OID 65718)
-- Dependencies: 174
-- Data for Name: vehiculos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vehiculos (id_vehiculo, modelo, marca, anio, placas, color) FROM stdin;
1	RAM	Chrysler	92	JAF-35-98	gris
2	Express Vann	Chevrolette	2002	HJF-65-89	blanco
3	Venture	Chevrolette	2001	JLK-34-78	bronce
4	Civic	Honda	1993	JAE-98-78	blanco
5	Econoline	Ford	2005	HLQ-23-78	rojo
7	Acord	Honda	2007	HOp-98-09	blanco
10	Megane	Renault	2007	JER-23-56	rojo
9	Clio	Renault	2011	HAL-28-13	blanco
11	Chevy Monza	Chevrolette	2011	JUT-74-90	azul
12	Attitude	Hyundai	2014	JEG-34-09	azul
13	sienna	Toyota	2016	JJI-99-99	verde
8	Atos	Hyundai	2004	JLF-23-18	rojo
\.


--
-- TOC entry 1932 (class 2606 OID 65712)
-- Name: cientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT cientes_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 1946 (class 2606 OID 65757)
-- Name: credito_a_clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY credito_a_clientes
    ADD CONSTRAINT credito_a_clientes_pkey PRIMARY KEY (id_credito_a_clientes);


--
-- TOC entry 1948 (class 2606 OID 65767)
-- Name: cuentas_por_pagar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cuentas_por_pagar
    ADD CONSTRAINT cuentas_por_pagar_pkey PRIMARY KEY (id_cuentas_por_pagar);


--
-- TOC entry 1942 (class 2606 OID 65747)
-- Name: departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id_departamento);


--
-- TOC entry 1950 (class 2606 OID 65782)
-- Name: facturas_compras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY facturas_compras
    ADD CONSTRAINT facturas_compras_pkey PRIMARY KEY (folio);


--
-- TOC entry 1940 (class 2606 OID 65737)
-- Name: facturas_ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY facturas_ventas
    ADD CONSTRAINT facturas_ventas_pkey PRIMARY KEY (folio);


--
-- TOC entry 1944 (class 2606 OID 65752)
-- Name: gastos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY gastos
    ADD CONSTRAINT gastos_pkey PRIMARY KEY (id_gastos);


--
-- TOC entry 1952 (class 2606 OID 65831)
-- Name: inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 1934 (class 2606 OID 65717)
-- Name: proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id_proveedor);


--
-- TOC entry 1938 (class 2606 OID 65727)
-- Name: solicitud_de_credito_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY solicitud_de_credito
    ADD CONSTRAINT solicitud_de_credito_pkey PRIMARY KEY (id_credito);


--
-- TOC entry 1936 (class 2606 OID 65722)
-- Name: vehiculos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehiculos
    ADD CONSTRAINT vehiculos_pkey PRIMARY KEY (id_vehiculo);


--
-- TOC entry 1958 (class 2606 OID 65796)
-- Name: cobranza_folio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cobranza
    ADD CONSTRAINT cobranza_folio_fkey FOREIGN KEY (folio) REFERENCES facturas_ventas(folio);


--
-- TOC entry 1957 (class 2606 OID 65791)
-- Name: cobranza_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cobranza
    ADD CONSTRAINT cobranza_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);


--
-- TOC entry 1954 (class 2606 OID 65758)
-- Name: credito_a_clientes_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY credito_a_clientes
    ADD CONSTRAINT credito_a_clientes_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);


--
-- TOC entry 1955 (class 2606 OID 65768)
-- Name: cuentas_por_pagar_id_proveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cuentas_por_pagar
    ADD CONSTRAINT cuentas_por_pagar_id_proveedor_fkey FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor);


--
-- TOC entry 1956 (class 2606 OID 65783)
-- Name: facturas_compras_id_proveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facturas_compras
    ADD CONSTRAINT facturas_compras_id_proveedor_fkey FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor);


--
-- TOC entry 1953 (class 2606 OID 65738)
-- Name: facturas_ventas_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY facturas_ventas
    ADD CONSTRAINT facturas_ventas_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);


--
-- TOC entry 1961 (class 2606 OID 65832)
-- Name: id_departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inventario
    ADD CONSTRAINT id_departamento FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento);


--
-- TOC entry 1960 (class 2606 OID 65812)
-- Name: mantenimiento_vehiculo_id_vehiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mantenimiento_vehiculo
    ADD CONSTRAINT mantenimiento_vehiculo_id_vehiculo_fkey FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo);


--
-- TOC entry 1959 (class 2606 OID 65804)
-- Name: propiedades_credito_id_credito_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY propiedades_credito
    ADD CONSTRAINT propiedades_credito_id_credito_fkey FOREIGN KEY (id_credito) REFERENCES solicitud_de_credito(id_credito);


--
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-04-03 22:55:50

--
-- PostgreSQL database dump complete
--

