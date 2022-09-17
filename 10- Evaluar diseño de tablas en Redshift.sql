-- Script para evaluar el diseño de tablAS:

SELECT
	schema schemaname,
	"table" tablename,
	table_id tableid,
	size size_in_mb,
	case
		WHEN diststyle NOT IN ('EVEN', 'ALL') THEN 1
		ELSE 0
	END has_dist_key,
	casee
		WHEN sortkey1 is not null THEN 1
		ELSE 0
	END has_sort_key,
	case
		WHEN encoded = 'Y' THEN 1
		ELSE 0
	END has_col_encodINg,
	cast(max_blocks_per_slice - min_blocks_per_slice AS FLOAT) / greatest(NVL (min_blocks_per_slice, 0)::int, 1) ratio_skew_across_slices,
	cast(100 * dist_slice AS FLOAT) /(
	SELECT
		COUNT(DISTINCT slice)
	FROM
		stv_slices) pct_slices_populated
FROM
	svv_table_info ti
JOIN (
	SELECT
		tbl, MIN(c) min_blocks_per_slice, MAX(c) max_blocks_per_slice, COUNT(DISTINCT slice) dist_slice
	FROM
		(
		SELECT
			b.tbl, b.slice, COUNT(*) AS c
		FROM
			STV_BLOCKLIST b
		GROUP BY
			b.tbl, b.slice)
	WHERE
		tbl IN (
		SELECT
	schema schemaname,
	"table" tablename,
	table_id tableid,
	size size_in_mb,
	case
		WHEN diststyle NOT IN ('EVEN', 'ALL') THEN 1
		ELSE 0
	END has_dist_key,
	case
		WHEN sortkey1 is not null THEN 1
		ELSE 0
	END has_sort_key,
	case
		WHEN encoded = 'Y' THEN 1
		ELSE 0
	END has_col_encoding,
	cASt(max_blocks_per_slice - min_blocks_per_slice AS FLOAT) / greatest(NVL (min_blocks_per_slice, 0)::int, 1) ratio_skew_across_slices,
	cASt(100 * dist_slice AS FLOAT) /(
	SELECT
		COUNT(DISTINCT slice)
	FROM
		stv_slices) pct_slices_populated
FROM
	svv_table_info ti
JOIN (
	SELECT
		tbl, MIN(c) min_blocks_per_slice, MAX(c) max_blocks_per_slice, COUNT(DISTINCT slice) dist_slice
	FROM
		(
		SELECT
			b.tbl, b.slice, COUNT(*) AS c
		FROM
			STV_BLOCKLIST b
		GROUP BY
			b.tbl, b.slice)
	WHERE
		tbl IN (
		SELECT
			table_id
		FROM
			svv_table_INfo)
	GROUP BY
		tbl) iq ON
	iq.tbl = ti.table_id;
			table_id
		FROM
			svv_table_INfo)
	GROUP BY
		tbl) iq ON
	iq.tbl = ti.table_id;