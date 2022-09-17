#### Cadenas de texto

| Tipo de dato | Tipo de dato en redshift | Tamaño | 
|--------------|--------------------------|---------|
CHAR , CHARACTER o NCHAR|Longitud de la cadena incluidos espacios en blanco anteriores o posteriores(si corresponde) | 4.096 bytes 
VARCHAR , CHARACTER VARYING o NVARCHAR|4 bytes + bytes totales por caracteres , donde cada carácter puede tener entre 1 y 4 bytes|65.535 bytes|
BPCHAR|Convertido a CHAR ( 256 ) de 256 bytes longitud fija|256 byes
TEXT|Convertido a VARCHAR ( 256 )|260 bytes


#### Eipos de datos numericos:

##### Enteros:

| Tipo de dato | Bytes | Rango | 
|--------|------|---------|
SMALL INT O INT 2|2|De - 32768 a +32767
INTEGER , INT o INT4|4|De -2147483648 a 2147483647
BIGINT o INT8|8|De - 9223372036854775808 a 9223372036854775807


#### Decimales:

| Tipo de dato | Bytes | Rango | 
|--------|------|---------|
DECIMAL O NUMERIC|128|38 Dígitos


#### Toda la tabla de datos:

Data type	|	Aliases	|	Description
----|---|---
SMALLINT	|	INT2	|	Signed two - byte integer
INTEGER	|	INT , INT4	|	Signed four - byte integer
BIGINT	|	INT8	|	Signed eight - byte integer
DECIMAL	|	NUMERIC	|	Exact numeric of selectable precision
REAL	|	FLOAT4	|	Single precision floating - point number
DOUBLE PRECISION	|	FLOAT8 , FLOAT	|	Double precision floating - point number
BOOLEAN	|	BOOL	|	Logical Boolean ( true / false )
CHAR	|	CHARACTER , NCHAR , BPCHAR	|	Fixed - length character string
VARCHAR	|	CHARACTER VARYING , NVARCHAR , TEXT	|	Variable - length character string with a user
DATE	|		|	Calendar date ( year , month , day )
TIMESTAMP	|	TIMESTAMP WITHOUT TIME ZONE	|	Date and time ( without time zone )
TIMESTAMPTZ	|	TIMESTAMP WITH TIME ZONE	|	Date and time ( with time zone )
GEOMETRY	|		|	Spatial data
