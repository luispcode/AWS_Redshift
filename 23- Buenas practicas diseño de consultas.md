#### Buenas practicas para diseño de consultas en Redshift:

* Evita usar SELECT * FROM

* Usar joins por llaves siempre que sea posible.

* Tantas condiciones en el where como sea posible.

* Evita usar funciones en el SELECT.

* Usar columnas "sort" en el group by (mismo orden).

* Usa subconsultas con menos de 200 registros.

* Si usas group by y order by asegerate que esten en el mismo orden.

* Filtra lo mismo cuentas veces se pueda en las distintas tablas.