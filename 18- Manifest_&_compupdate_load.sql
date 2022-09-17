--Cargar varios archivos a la vez utlizando archivos de manifiesto:

COPY estudiante FROM 's3://nuevobucketredshift/test.manifest'
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxxxx:role/Mi_Rol_Redshift' 
delimiter ';'
ignoreheader 1
manifest
region 'us-east-2'
compupdate off;


COPY public.sales_compression_off FROM 's3://nuevobucketredshift/tickitdb/sales_tab.txt' 
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxxxxxx:role/Mi_Rol_Redshift' 
delimiter '\t'
timeformat 'MM/DD/YYYY HH:MI:SS' 
compupdate off region 'us-east-2';
