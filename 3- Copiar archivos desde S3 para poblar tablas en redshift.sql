COPY public_data.users FROM 's3://nuevobucketredshift/tickitdb/allusers_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxx:role/Mi_Rol_Redshift' 
delimiter '|' 
region 'us-east-2';

COPY public_data.venue FROM 's3://nuevobucketredshift/tickitdb/venue_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxx:role/Mi_Rol_Redshift' 
delimiter '|' 
region 'us-east-2';

COPY public_data.category FROM 's3://nuevobucketredshift/tickitdb/category_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxx:role/Mi_Rol_Redshift' 
delimiter '|' 
region 'us-east-2';

COPY public_data.date FROM 's3://nuevobucketredshift/tickitdb/date2008_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxx:role/Mi_Rol_Redshift' 
delimiter '|' 
region 'us-east-2';

COPY public_data.event FROM 's3://nuevobucketredshift/tickitdb/allevents_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxx:role/Mi_Rol_Redshift' 
delimiter '|' 
timeformat 'YYYY-MM-DD HH:MI:SS' 
region 'us-east-2';

COPY public_data.listing FROM 's3://nuevobucketredshift/tickitdb/listings_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxx:role/Mi_Rol_Redshift' 
delimiter '|' 
region 'us-east-2';

COPY public_data.sales FROM 's3://nuevobucketredshift/tickitdb/sales_tab.txt'
credentials 'aws_iam_role=arn:aws:iam::xxxxxxxxxxx:role/Mi_Rol_Redshift'
delimiter '\t' 
timeformat 'MM/DD/YYYY HH:MI:SS' 
region 'us-east-2';