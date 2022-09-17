##### Buenas practicas para el diseño de bases de datos:

1) contraints

* PRIMARY KEY
* FOREIGN KEY

2) columnas

* Usa siempre tipos de datos date o timestamp para las fechas, si es necesario ajustar en procesos ETL. 
* Tamaños muy elevados degradan el uso de algoritmos de compresión y requieren más almacenamiento en disco .
* Comenta en qué consisten tus columnas en el diccionario de datos.
