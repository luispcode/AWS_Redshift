
--Create table
create  table  estudiante
( id  int2,
nombre  varchar(20),
apellido  varchar(20),
edad  int2,
fecha_ingreso  date );

-- Crearemos una estructura en Redshift que pueda satisfacer las necesidades de esta tabla, 
-- Los “key” del archivo se debe llamar igual que en la tabla):

{
	"id": 4544,
	"nombre": "test_1",
	"apellido": "json_1",
	"edad": 33,
	"fecha_ingreso": "2020-08-01"
}
{
	"id": 23232,
	"nombre": "test_2",
	"apellido": "json_2",
	"edad": 22,
	"fecha_ingreso": "2020-08-03"
}

-- Ahora lo subimos a S3 con el nombre 
-- que queramos y procedemos a cargarlo de la siguiente manera:

copy  public.estudiante  from  's3://[tu_propia_ruta_del_archivo_json]'  credentials  'aws_iam_role=[tu_iam_role]'
format  as  json  'auto'  region  '[tu_region]';


-- Como se ve en la gráfica, la tabla se encuentra cargada con los datos que existen en el archivo json.

-- Carga con jsonpaths:

-- Esta carga consiste en determinar una estructura basada en 
-- el archivo json que pueda ser insertada en la tabla, como sabemos 
-- en un archivo json podemos tener datos no estructurados, pero Redshift 
-- requiere de data estructurada; de manera que lo primero será crear un 
-- pequeño ejemplo de un archivo json con datos no estructurada.

{
	"id": 4544,
	"nombre": "test_json3",
	"apellido": "test_json3",
	"edad": [
		24332,
		33,
		443,
		323232,
		43434
	],
	"fechas": [
		{
			"id": 0,
			"fecha_ingreso": "2015-05-01"
		},
		{
			"id": 1,
			"fecha_ingreso": "2016-05-30"
		}
	]
}


-- Vamos a suponer que de la lista de edades son la 
-- segunda posición o sea la posición [1] es la que yo requiero, y 
-- para las fechas, la fecha que en verdad me interesa es la contenida en el 
-- segundo bloque, para especificar estas reglas crearemos un nuevo archivo con 
-- la siguiente estructura y lo nombraremos “jsonpaths”:


{
	"jsonpaths": [
		"$['id']",
		"$['nombre']",
		"$['apellido']",
		"$['edad'][1]",
		"$['fechas'][1]['fecha_ingreso']"
	]
}


-- En donde el símbolo ($) indica la raíz del archivo json.

-- Ahora subimos nuestros dos archivos a S3 y 
-- ejecutamos la siguiente sentencia en nuestro editor SQL.

copy  public.estudiante  from  's3://[tu_propia_ruta_del_archivo_json]'  credentials  'aws_iam_role=[tu_iam_role]'
format  as  json  's3://[tu_propia_ruta_del_archivo_jsonpaths]'  region  'tu_propia_region';

-- Y como vemos, el registro fue cargado exitosamente.
