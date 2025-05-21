-- Active: 1747807591069@@127.0.0.1@3306
CREATE DATABASE FirstDb;
-- CREATE DATABASE
DROP DATABASE FirstDb;
-- DELETE DATABASE
USE FirstDb;
-- USE DATABASE

CREATE TABLE firstTable ( some_val INTEGER, userName VARCHAR(50) );
--CREATE A TABLE IN DATABASE
CREATE TABLE secondTable (
    _id int AUTO_INCREMENT PRIMARY KEY,
    some_val INTEGER NOT NULL,
    userName VARCHAR(50),
    email VARCHAR(100) UNIQUE
);
--CREATE A TABLE IN DATABASE

SELECT * FROM secondTable;

INSERT INTO firstTable (some_val, userName) VALUES (12, "mohit");
--SINGLE INSERTION

SELECT * FROM firstTable;

INSERT INTO
    secondTable (some_val, userName, email)
VALUES (12, "mohit", "7.com"),
    (14, "1", "8.com"),
    (14, "1", "9.com");
--MULTIPLE INSERTIONS

SELECT * FROM secondTable;

UPDATE secondTable SET _id = _id -3

UPDATE secondTable
SET
    _id = _id -8
WHERE
    email = "6.com"
    --there is a pointer that moves when the new element is created points to next element and does not care what happend to previous element

DELETE FROM secondTable WHERE email = "6.com"