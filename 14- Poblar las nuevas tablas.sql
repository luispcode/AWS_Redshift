COPY customer FROM 's3://awssampledbuswest2/ssbgz/customer' 
credentials 'aws_iam_role=arn:aws:iam::938883541888:role/Mi_Rol_Redshift'  
gzip compupdate off region 'us-west-2';

COPY dwdate FROM 's3://awssampledbuswest2/ssbgz/dwdate' 
credentials 'aws_iam_role=arn:aws:iam::938883541888:role/Mi_Rol_Redshift'  
gzip compupdate off region 'us-west-2';

COPY lineorder FROM 's3://awssampledbuswest2/ssbgz/lineorder' 
credentials 'aws_iam_role=arn:aws:iam::938883541888:role/Mi_Rol_Redshift'  
gzip compupdate off region 'us-west-2';

COPY part FROM 's3://awssampledbuswest2/ssbgz/part' 
credentials 'aws_iam_role=arn:aws:iam::938883541888:role/Mi_Rol_Redshift'  
gzip compupdate off region 'us-west-2';

COPY supplier FROM 's3://awssampledbuswest2/ssbgz/supplier' 
credentials 'aws_iam_role=arn:aws:iam::938883541888:role/Mi_Rol_Redshift'  
gzip compupdate off region 'us-west-2';


-- verificar formato ideal:
analyze compression customer ;

-- creando tablas mejoradas con formatos ideales
CREATE TABLE IF NOT EXISTS public.customer_pro
(
	c_custkey INTEGER NOT NULL  ENCODE az64 distkey
	,c_name VARCHAR(25) NOT NULL  ENCODE zstd
	,c_address VARCHAR(25) NOT NULL  ENCODE zstd
	,c_city VARCHAR(10) NOT NULL  ENCODE bytedict
	,c_nation VARCHAR(15) NOT NULL  ENCODE bytedict
	,c_region VARCHAR(12) NOT NULL  ENCODE bytedict
	,c_phone VARCHAR(15) NOT NULL  ENCODE zstd
	,c_mktsegment VARCHAR(10) NOT NULL  ENCODE bytedict
) 



