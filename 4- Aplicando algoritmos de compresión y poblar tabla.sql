SELECT * FROM venue limit 10;
SELECT count(0) FROM venue;
SELECT count(*) FROM venue;


CREATE TABLE cartesian_venue AS (
SELECT venueid, venuename, venuecity, venuestate, venueseats
FROM venue, listing );

SELECT venueseats FROM venue 
limit 100

SELECT * FROM cartesian_venue limit 10;

CREATE TABLE encoding_venue (
nameraw varchar(100) encode raw,
namebytedict varchar(100) encode bytedict,
namelzo varchar(100) encode lzo,
namerunlength varchar(100) encode runlength,
nametext255 varchar(100) encode text255,
nametext32k varchar(100) encode text32k,
namezstd varchar(100) encode zstd
);

INSERT INTO encoding_venue
(
SELECT venuename, venuename, venuename, venuename, venuename, venuename, venuename
FROM cartesian_venue
);


SELECT count(*) FROM encoding_venue limit 10;


-- Analisis rendimiento compresiones para otras tablas.

CREATE TABLE cartesian_venueseats AS (
SELECT venueseats
FROM venue, listing );

SELECT venueseats 
FROM cartesian_venueseats
limit 100;


CREATE TABLE encoding_venueseats (
venueseatsraw decimal (8,2) encode raw,
venueseatsbytedict decimal (8,2) encode bytedict, 
venueseatslzo decimal (8,2) encode lzo,
venueseatsrunlength decimal (8,2) encode runlength,
venueseatszstd decimal (8,2) encode zstd
);

ALTER TABLE encoding_venueseats
add venueseatsmostly32 decimal (8,2) encode mostly32;

SELECT * 
FROM encoding_venueseats


INSERT INTO encoding_venueseats
(
SELECT venueseats, venueseats, venueseats, venueseats, venueseats, venueseats, venueseats, venueseats, venueseats, venueseats
FROM cartesian_venueseats
);

SELECT * FROM encoding_venueseats
limit 10


--Buscamos el ID de la tabla, en mi caso es 101656
SELECT * FROM stv_tbl_perm 
WHERE name = 'encoding_venueseats';

--Agrupamos los bloques de cada método
SELECT col, max(blocknum) FROM pg_catalog.stv_blocklist
WHERE tbl = 101656
AND col <= 10 
GROUP BY col;

--Ganan zstd y runlength con un peso de 1

--Comparamos nuestro análisis con el de redshift
analyze compression cartesian_venueseats;
--Nos recomienda zstd con una compresión esperada del 98,99%




