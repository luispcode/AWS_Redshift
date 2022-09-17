--Alternativas:

-- Ver registros y buscar registro de interés:

SELECT * FROM sales limit 10;

SELECT eventid FROM event e 
WHERE eventname = 'Beck';


-- Busqueda por un registro especifico para borrar posteriormente:
SELECT * FROM sales s 
WHERE eventid in (SELECT eventid FROM event e 
WHERE eventname = 'Beck');


--Creación de tabla intermedia para realizar operaciones de actualizacion o borrado.
CREATE TABLE sales_auxiliar AS (
SELECT salesid, pricepaid * 2, comission *2 FROM sales s 
WHERE eventid in (SELECT eventid FROM event e 
WHERE eventname = 'Beck'));


--update
update sales
set pricepaid = sa.pricepaid
FROM sales_auxiliar sa
WHERE sales.salesid = sa.salesid;


--delete
delete FROM sales
using sales_auxiliar
WHERE sales.salesid = sales_auxiliar.salesid ;

