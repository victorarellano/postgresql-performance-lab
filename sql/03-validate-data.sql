-- Laboratorio 00.4
-- Validacion de datos sinteticos

-- 1. Cardinalidad exacta de las tablas

SELECT 'customers' AS table_name, COUNT(*) AS total_rows
FROM lab.customers

UNION ALL

SELECT 'products', COUNT(*)
FROM lab.products

UNION ALL

SELECT 'sales', COUNT(*)
FROM lab.sales;

-- 2. Distribucion de ventas por estado

SELECT
    status,
    COUNT(*) AS total_rows,
    ROUND(
        100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM lab.sales
GROUP BY status
ORDER BY total_rows DESC;

-- 3. Almacenamiento de tablas e indices

SELECT
    relname AS table_name,
    pg_size_pretty(
        pg_table_size(relid)
    ) AS table_size,
    pg_size_pretty(
        pg_indexes_size(relid)
    ) AS indexes_size,
    pg_size_pretty(
        pg_total_relation_size(relid)
    ) AS total_size
FROM pg_stat_user_tables
WHERE schemaname = 'lab'
ORDER BY pg_total_relation_size(relid) DESC;

-- 5. Estadisticas de la columna status

SELECT
    tablename,
    attname,
    null_frac,
    n_distinct,
    most_common_vals,
    most_common_freqs
FROM pg_stats
WHERE schemaname = 'lab'
  AND tablename = 'sales'
  AND attname = 'status';

-- 6. Huellas digitales del contenido

SELECT
    'customers' AS table_name,
    COUNT(*) AS total_rows,
    md5(string_agg(
        md5(c::text), '' ORDER BY customer_id
    )) AS data_checksum
FROM lab.customers AS c

UNION ALL

SELECT
    'products',
    COUNT(*),
    md5(string_agg(
        md5(p::text), '' ORDER BY product_id
    ))
FROM lab.products AS p

UNION ALL

SELECT
    'sales',
    COUNT(*),
    md5(string_agg(
        md5(s::text), '' ORDER BY sale_id
    ))
FROM lab.sales AS s;
