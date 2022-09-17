-- Algoritmos de ordenamiento:

SET enable_result_cache_for_session to off;

SELECT MAX(lo_revenue), MIN(lo_revenue) 
FROM cust_sales_simple
WHERE c_custkey < 100000; --4.987s 326ms

SELECT MAX(lo_revenue), MIN(lo_revenue) 
FROM cust_sales_compuesto
WHERE c_custkey < 100000; -- 307ms --218ms

SELECT MAX(lo_revenue), MIN(lo_revenue) 
FROM cust_sales_intercalado
WHERE c_custkey < 100000; --4.320s --309ms
--------------------------------------------
SELECT MAX(lo_revenue), MIN(lo_revenue) 
FROM cust_sales_simple 
WHERE c_region = 'ASIA'
AND c_mktsegment = 'FURNITURE' ; --7.281s -- 1.390

SELECT MAX(lo_revenue), MIN(lo_revenue)
FROM cust_sales_compuesto
WHERE c_region = 'ASIA'
AND c_mktsegment = 'FURNITURE' ; --7.611s --974ms

SELECT MAX(lo_revenue), MIN(lo_revenue)
FROM cust_sales_intercalado 
WHERE c_region = 'ASIA'
AND c_mktsegment = 'FURNITURE' ; --4.519 --346ms
-----------------------------------------------------
SELECT MAX(lo_revenue), MIN(lo_revenue)  FROM cust_sales_simple 
WHERE d_date BETWEEN '01/01/1996' AND '01/14/1996'
AND c_mktsegment = 'FURTNITURE'
AND c_region = 'ASIA';

SELECT MAX(lo_revenue), MIN(lo_revenue) 
FROM cust_sales_compuesto 
WHERE d_date BETWEEN '01/01/1996' AND '01/14/1996'
AND c_mktsegment = 'FURTNITURE'
AND c_region = 'ASIA' ;

SELECT MAX(lo_revenue), MIN(lo_revenue) 
FROM cust_sales_intercalado
WHERE d_date BETWEEN '01/01/1996' AND '01/14/1996'
AND c_mktsegment = 'FURTNITURE'
AND c_region = 'ASIA';



