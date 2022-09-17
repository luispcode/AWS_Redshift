-- Análisis de rendimiento utilizando tablas del sistema:

select * from stv_tbl_perm 
where name = 'encoding_venueseats'--118144 identificador de la tabla


select col,max(blocknum) -- ver bloques de datos que se estan utilizando, es del catalogo de postgres
from pg_catalog.stv_blocklist
where tbl = 118144
and col <= 11
group by col;


select *
from pg_catalog.stv_blocklist
where tbl = 118144
and col = 0;


-- Es recomendable caergar una parte de la infomacion, ejecutar analyze y luego saber el encoding ideal para la data.
-- Estandar zstd parece ser el mejor en general
-- Conocer formato de compresión ideal para cada columna
Analyze compression cartesian_venue; 