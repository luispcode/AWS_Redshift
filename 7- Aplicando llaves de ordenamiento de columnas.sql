-- Llaves de ordenamiento:

CREATE TABLE public.cust_sales_date (
	c_custkey int4 NULL,
	c_nation varchar(15) NULL,
	c_region varchar(12) NULL,
	c_mktsegment varchar(10) NULL,
	d_date date NULL,
	lo_revenue int4 NULL
);

copy cust_sales_date FROM 's3://nuevobucketredshift/cust_sales_date_000.bz2' 
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxx:role/Mi_Rol_Redshift' 
BZIP2
region 'us-east-2';

SELECT count(0) FROM cust_sales_date;


SELECT * FROM cust_sales_date limit 10;


CREATE TABLE auxiliar (col int);
insert into auxiliar values (1), (2), (3), (4), (5);
SELECT * FROM auxiliar;


SELECT c_custkey, c_nation, c_region, c_mktsegment, d_date, lo_revenue
FROM cust_sales_date, auxiliar
limit 5;


CREATE TABLE cust_sales_simple
sortkey (c_custkey)
as (SELECT c_custkey, c_nation, c_region, c_mktsegment, d_date, lo_revenue
FROM cust_sales_date, auxiliar
);


CREATE TABLE cust_sales_compuesto
compound sortkey (c_custkey, c_region, c_mktsegment, d_date)
as (SELECT c_custkey, c_nation, c_region, c_mktsegment, d_date, lo_revenue
FROM cust_sales_date, auxiliar
);


CREATE TABLE cust_sales_intercalado
interleaved sortkey (c_custkey, c_region, c_mktsegment, d_date)
as (SELECT c_custkey, c_nation, c_region, c_mktsegment, d_date, lo_revenue
FROM cust_sales_date, auxiliar
);

