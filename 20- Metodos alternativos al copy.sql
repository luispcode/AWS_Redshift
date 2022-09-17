--Alternativas para poblar tablas:

SELECT * FROM estudiante;

INSERT INTO estudiante values
(5, 'Brandon', 'Huertas', 24, '2020-01-01'),
(6,'Cristian', 'Salas', 30, '2020-01-01'),
(7,'holman', 'Campos', 24, '2020-01-01'),
(8,'Natalia', 'Montenegro', 24, '2020-01-01');

SELECT * FROM estudiante;


--bulk SELECT/insert 
SELECT e.eventname , e.starttime,
sum(pricepaid) pricepaid, sum(commission) commission
FROM sales s 
INNER JOIN event e 
ON s.eventid = e.eventid
group by e.eventname, e.starttime ;


CREATE TABLE total_price_by_event AS (
SELECT e.eventname , e.starttime,
sum(pricepaid) pricepaid, sum(commission) commission
FROM sales s 
INNER JOIN event e 
ON s.eventid = e.eventid
group by e.eventname, e.starttime);

SELECT * FROM total_price_by_event;


-- deep copy
CREATE TABLE likesales (like sales); --copiar estructura de otra tabla
INSERT INTO likesales (SELECT * FROM sales); --copiar todos los datos de una tabla
drop table sales;
alter table likesales rename to sales;

SELECT * FROM sales;




