CREATE DATABASE IF NOT EXISTS Lection_4;
USE Lection_4;
DROP TABLE IF EXISTS Customers;
CREATE TABLE IF NOT EXISTS Customers
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    AccountSum DECIMAL
);
DROP TABLE IF EXISTS Employees;
CREATE TABLE IF NOT EXISTS Employees
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL   
);

INSERT INTO Customers(FirstName, LastName, AccountSum)
VALUES
('TOM1', 'SMIT1', 2000),
('TOM2', 'SMIT2', 4000),
('TOM3', 'SMIT3', 8000),
('TOM4', 'SMIT4', 10000);

INSERT INTO Employees(FirstName, LastName)
VALUES
('TOM1', 'SMIT1'),
('Klark', 'ROst'),
('TOM2', 'SMIT2'),
('TOM3', 'SMIT3'),
('TOM4', 'SMIT4'),
('Rex1', 'Lost2');


SELECT FirstName, LastName
FROM Customers
UNION SELECT FirstName, LastName -- Удаляет дублируюбщие строки
FROM Employees
ORDER BY FirstName DESC;

SELECT FirstName, LastName
FROM Customers
UNION ALL SELECT FirstName, LastName -- не удаляет дублирующие строки
FROM Employees
ORDER BY FirstName;

SELECT FirstName, LastName, AccountSum + AccountSum * 0.1 AS TotalSum
FROM Customers WHERE AccountSum < 3000
UNION SELECT FirstName, LastName, AccountSum + AccountSum * 0.3 AS TotalSum
FROM Customers WHERE AccountSum >= 3000;

DROP TABLE IF EXISTS Products;
CREATE TABLE IF NOT EXISTS Products
(
	Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(20) NOT NULL,
    Manufacturer VARCHAR(20) NOT NULL,
    ProductCount INT DEFAULT 0,
    Price DECIMAL NOT NULL
);

