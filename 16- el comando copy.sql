--El commando COPY:

CREATE TABLE estudiante
(
id int2,
nombre varchar (20),
apellido varchar (20),
edad int2,
fecha_ingreso date
);

SELECT * FROM estudiante;


COPY estudiante FROM 's3://nuevobucketredshift/tercer_cargue.csv'
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxx:role/Mi_Rol_Redshift' 
region 'us-east-2'
delimiter ';'
ignoreheader 1 
ignoreblanklines
blanksasnull
dateformat 'mm-dd-yyyy'
;

SELECT * FROM stl_load_errors;


COPY estudiante FROM 's3://nuevobucketredshift/tercer_cargue.csv'
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxx:role/Mi_Rol_Redshift' 
region 'us-east-2'
delimiter ';'
fixedwidth '0:1,1:9,2:9,3:2,4:10'
dateformat 'mm-dd-yyyy'
;

SELECT * FROM estudiante;


COPY estudiante FROM 's3://nuevobucketredshift/test.manifest'
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxx:role/Mi_Rol_Redshift' 
delimiter ';'
ignoreheader 1
manifest
region 'us-east-2'
;

SELECT * FROM estudiante;


CREATE TABLE IF NOT EXISTS public.sales_compression_on
(
	salesid INTEGER NOT NULL  ENCODE raw
	,listid INTEGER NOT NULL  ENCODE raw
	,sellerid INTEGER NOT NULL  ENCODE raw
	,buyerid INTEGER NOT NULL  ENCODE raw
	,eventid INTEGER NOT NULL  ENCODE raw
	,dateid SMALLINT NOT NULL  ENCODE RAW
	,qtysold SMALLINT NOT NULL  ENCODE raw
	,pricepaid NUMERIC(8,2)   ENCODE raw
	,commission NUMERIC(8,2)   ENCODE raw
	,saletime TIMESTAMP WITHOUT TIME ZONE   ENCODE raw
);


CREATE TABLE IF NOT EXISTS public.sales_compression_off
(
	salesid INTEGER NOT NULL  ENCODE raw
	,listid INTEGER NOT NULL  ENCODE raw
	,sellerid INTEGER NOT NULL  ENCODE raw
	,buyerid INTEGER NOT NULL  ENCODE raw
	,eventid INTEGER NOT NULL  ENCODE raw
	,dateid SMALLINT NOT NULL  ENCODE RAW
	,qtysold SMALLINT NOT NULL  ENCODE raw
	,pricepaid NUMERIC(8,2)   ENCODE raw
	,commission NUMERIC(8,2)   ENCODE raw
	,saletime TIMESTAMP WITHOUT TIME ZONE   ENCODE raw
);


COPY public.sales_compression_off FROM 's3://nuevobucketredshift/tickitdb/sales_tab.txt' 
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxx:role/Mi_Rol_Redshift' 
delimiter '\t'timeformat 'MM/DD/YYYY HH:MI:SS' compupdate off region 'us-east-2';

SELECT * FROM pg_table_def
where tablename = 'sales_compression_on';

