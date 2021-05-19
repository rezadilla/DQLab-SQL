-- Tabel suppliers

USE dqlab;

CREATE TABLE IF NOT EXISTS suppliers (
    `SupplierID` INT,
    `ContactName` VARCHAR(20) CHARACTER SET utf8,
    `SupplierName` VARCHAR(20) CHARACTER SET utf8,
    `Address` VARCHAR(20) CHARACTER SET utf8,
    `City` VARCHAR(20) CHARACTER SET utf8,
    `PostalCode` INT,
    `Country` VARCHAR(20) CHARACTER SET utf8
);

INSERT INTO
    suppliers
VALUES
    (1,'Yulius','Yulius Syrup','Jl Jayakarta','Jakarta',14450,'Indonesia'),
    (2,'Sherly Ani','Bandung Bakery','Jalan Asia Afrika','Bandung',70117,'Indonesia'),
    (3,'Regina Tara','Tara Pastry','Jalan Merpati','Semarang',48104,'Indonesia');