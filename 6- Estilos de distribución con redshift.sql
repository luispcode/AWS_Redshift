-- Estilos de distribución:

CREATE TABLE dist_key (columna int)
diststyle key distkey (columna);
INSERT INTO dist_key values (10);

CREATE TABLE dist_even (columna int)
diststyle even;
INSERT INTO dist_even values (10);

CREATE TABLE dist_all (columna int)
diststyle all;
INSERT INTO dist_all values (10);

CREATE TABLE dist_auto (columna int) -- dist auto selecciona la mejor distribucion automaticamente.
INSERT INTO dist_auto values (10);


-- ver tipo de distribucion:
SELECT * FROM pg_catalog.svv_table_info
WHERE "table" like '%dist%'
limit 10;

-- ver como estan definidAS lAS tablAS de postgresql.

SELECT * FROM pg_table_def
WHERE tablename = 'users';

SELECT * FROM svv_diskusage
WHERE "name" = 'users'
AND col = 0;

SELECT DISTINCT slice, col, num_values, minvalue, maxvalue FROM svv_diskusage
WHERE "name" = 'users'
AND col = 0
AND num_values > 0
ORDER BY slice, col
;

CREATE TABLE user_key_state distkey(state) AS (SELECT * FROM users);

SELECT DISTINCT slice, col, num_values, minvalue, maxvalue FROM svv_diskusage
WHERE "name" = 'user_key_state'
AND col = 0
AND num_values > 0
ORDER BY slice, col
;

CREATE TABLE user_even diststyle even AS (SELECT * FROM users);

SELECT DISTINCT slice, col, num_values, minvalue, maxvalue FROM svv_diskusage
WHERE "name" = 'user_even' 
AND col = 0
AND num_values > 0
ORDER BY slice, col
;

CREATE TABLE user_all diststyle all AS (SELECT * FROM users);

SELECT DISTINCT slice, col, num_values, minvalue, maxvalue FROM svv_diskusage
WHERE "name" = 'user_all' 
AND col = 0
AND num_values > 0
ORDER BY slice, col;