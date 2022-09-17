-- Creación de tablAS de prueba

CREATE TABLE unload_test AS (
SELECT * FROM cust_sales_intercalado 
union all
SELECT * FROM cust_sales_intercalado 
union all
SELECT * FROM cust_sales_intercalado 
);


CREATE TABLE unload_test_2 AS (
SELECT * FROM unload_test
limit 2000000
);

-- Comando unload para descar datos (tamaño maximo por achivo 6.2GB)

UNLOAD ('SELECT * FROM unload_test')
to 's3://nuevobucketredshift/unload_command/unload_test_'
credentials 'aws_iam_role=arn:aws:iam::938883541888:role/Mi_Rol_Redshift'
parallel off --crear un unico archivo 
allowoverwrite;

--Mas parametros para el commando unload:

UNLOAD ('SELECT * FROM unload_test_2')
to 's3://nuevobucketredshift/unload_command/unload_test_3_'
credentials 'aws_iam_role=arn:aws:iam::938883541888:role/Mi_Rol_Redshift'
allowoverwrite
delimiter ';'
header
maxfilesize 500 mb
zstd -- formatos de compresión gzip, bzip2 zstd
manifest -- crear archivo de manifiesto con los archivos que descarga
partition by (elnombredecualquiercolumna) include;

