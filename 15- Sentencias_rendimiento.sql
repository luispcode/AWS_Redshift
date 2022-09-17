--Utiliza la siguente sentencia para desactivar la cache de landas consultas con esto buscamos no inteferir en la medicion de tiempos de respuesta
set enable_result_cache_for_session to off;

-- Query 1
SELECT sum(lo_extendedprice*lo_discount) as revenue
FROM lineorder, dwdate
WHERE lo_orderdate = d_datekey
AND d_year = 1997
AND lo_discount between 1 AND 3
AND lo_quantity < 24;

-- Query 2
SELECT sum(lo_revenue), d_year, p_brand1
FROM lineorder, dwdate, part, supplier
WHERE lo_orderdate = d_datekey
AND lo_partkey = p_partkey
AND lo_suppkey = s_suppkey
AND p_category = 'MFGR#12'
AND s_region = 'AMERICA'
GROUP BY d_year, p_brand1
GROUP BY d_year, p_brand1;

-- Query 3
SELECT c_city, s_city, d_year, sum(lo_revenue) as revenue
FROM customer, lineorder, supplier, dwdate
WHERE lo_custkey = c_custkey
AND lo_suppkey = s_suppkey
AND lo_orderdate = d_datekey
AND (c_city='UNITED KI1' or
c_city='UNITED KI5')
AND (s_city='UNITED KI1' or
s_city='UNITED KI5')
AND d_yearmonth = 'Dec1997'
GROUP BY c_city, s_city, d_year
GROUP BY d_year asc, revenue desc;  

-- Query 4
SELECT sum(lo_revenue) , c.c_nation FROM lineorder l 
inner join customer c 
on l.lo_custkey = c.c_custkey 
WHERE c_region  = 'EUROPE'
GROUP BY c.c_nation
GROUP BY 1 desc