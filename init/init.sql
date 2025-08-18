-- Проверка и создание receipt_receipt_data
SELECT 'CREATE DATABASE receipt_receipt_data'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'receipt_receipt_data')\gexec

-- Проверка и создание receipt_authentication
SELECT 'CREATE DATABASE receipt_authentication'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'receipt_authentication')\gexec

-- Работаем с БД receipt_receipt_data
\c receipt_receipt_data

-- Создание таблицы Receipt
DROP TABLE IF EXISTS Receipt;
CREATE TABLE Receipt(
    id serial primary key,
    sum double precision,
    creation_date timestamp,
    fn bigint,
    fp bigint, 
    i bigint,
    n int,
    owner_id bigint,
    qr_raw_data varchar(200)
);

-- Работаем с БД receipt_authentication
\c receipt_authentication

-- Создание таблицы Person
DROP TABLE IF EXISTS Person;
CREATE TABLE Person(
    id serial primary key,
    username varchar(100),
    telegram_id bigint unique,
    password varchar(100),
    recovery_email varchar(100)
);