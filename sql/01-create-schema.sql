-- Laboratorio 00.4
-- Creacion del modelo relacional
-- PostgreSQL 17

BEGIN;

CREATE SCHEMA lab;

CREATE TABLE lab.customers (
    customer_id integer PRIMARY KEY,
    name        varchar(100) NOT NULL,
    region      varchar(50) NOT NULL
);

CREATE TABLE lab.products (
    product_id  integer PRIMARY KEY,
    name        varchar(100) NOT NULL,
    category    varchar(50) NOT NULL,
    price       numeric(12,2) NOT NULL
                CHECK (price >= 0)
);

CREATE TABLE lab.sales (
    sale_id     bigint PRIMARY KEY,
    customer_id integer NOT NULL
                REFERENCES lab.customers(customer_id),
    product_id  integer NOT NULL
                REFERENCES lab.products(product_id),
    sale_date   date NOT NULL,
    quantity    integer NOT NULL
                CHECK (quantity > 0),
    status      varchar(20) NOT NULL
                CHECK (status IN (
                    'completed',
                    'pending',
                    'cancelled'
                ))
);

COMMIT;
