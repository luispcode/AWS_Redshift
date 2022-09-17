--Estadisticas y Limpieza:

-- Analyze

SELECT * FROM pg_statistic_indicator
WHERE stairelid = 118250
;

SELECT * FROM stv_tbl_perm
WHERE name = 'sales';

SELECT * FROM pg_catalog.pg_table_def 
WHERE tablename = 'sales';

analyze sales(salesid, pricepaid);
analyze sales predicate columns;
analyze sales;

SELECT * FROM stl_analyze;


---- vaccum

SELECT "table", unsorted, vacuum_sort_benefit 
FROM svv_table_info; 

vacuum sales;
vacuum sort only sales to 75 percent;
vacuum delete only sales to 75 percent;
vacuum reindex sales;


