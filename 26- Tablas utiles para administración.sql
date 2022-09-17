--informacion de columnas (tipo de dato, compresion, distribucion, ordenamiento, nulos):
SELECT * FROM pg_catalog.pg_table_def 
where tablename = 'sales';


--informacion sobre los bloques de datos utilizados por columnas y slices:
SELECT * FROM pg_catalog.stv_blocklist; 


-- informacion y logs de errores durante cargas de datos:
SELECT * FROM stl_load_errors;


-- informacion y seguimiento de etl, de que se cargo exitosamente y en que momento y con que query lo hizo:
SELECT * FROM stl_load_commits;


--informacion sobre queries especificas:
SELECT * FROM stl_query 
where query = 1719; 


-- aqui se guardan todos las queries en texto con datos de perfomance:
SELECT * FROM svl_qlog
order by starttime desc;


-- informacion de usuarios para administradores:
SELECT * FROM svl_user_info;


-- informacion de todas las tablas y esquemas en la base de datos:
SELECT * FROM svv_tables 
where table_schema ='public';

