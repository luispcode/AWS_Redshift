
--Primeras pruebas de funcionamiento general:

SELECT "hola mundo" AS texto;

CREATE TABLE estudiante (
id int2,
nombre varchar(30),
pais_id int2);

CREATE TABLE pais (
pais_id int2,
nombre varchar(60));

INSERT INTO estudiante VALUES (1,'David',1),(2,'Rocio',1),(3,'Carlos',2);

INSERT INTO pais VALUES (1,'Colombia'), (3,'Mexico');

SELECT * FROM estudiante AS e 
LEFT JOIN pais AS p
ON e.pais_id = p.pais_id;

DROP TABLE estudiante;
DROP TABLE pais;

