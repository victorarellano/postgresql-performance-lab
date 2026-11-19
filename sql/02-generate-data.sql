-- Laboratorio 00.4
-- Generacion determinista de datos sinteticos
-- PostgreSQL 17
-- Ejecutar sobre tablas vacias

BEGIN;

-- 1. Clientes: 10.000 registros

INSERT INTO lab.customers (
    customer_id,
    name,
    region
)
SELECT
    i,
    'Customer ' || i,
    'Region ' || (1 + (i - 1) % 5)
FROM generate_series(1, 10000) AS g(i);


-- 2. Productos: 1.000 registros

INSERT INTO lab.products (
    product_id,
    name,
    category,
    price
)
SELECT
    i,
    'Product ' || i,
    'Category ' || (1 + (i - 1) % 10),
    (1000 + i * 137) / 100.0
FROM generate_series(1, 1000) AS g(i);


-- 3. Ventas: 1.000.000 de registros

INSERT INTO lab.sales (
    sale_id,
    customer_id,
    product_id,
    sale_date,
    quantity,
    status
)
SELECT
    i,
    1 + ((i::bigint * 7919) % 10000),
    1 + ((i::bigint * 3571
         + i / 10000) % 1000),
    DATE '2024-01-01' + ((i - 1) % 731),
    1 + ((i / 100) % 10),
    CASE
        WHEN ((i::bigint * 73 + i / 10000)
              % 100) < 90 THEN 'completed'
        WHEN ((i::bigint * 73 + i / 10000)
              % 100) < 98 THEN 'pending'
        ELSE 'cancelled'
    END
FROM generate_series(1, 1000000) AS g(i);

COMMIT;
