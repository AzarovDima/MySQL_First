-- Лекция 3

CREATE DATABASE IF NOT EXISTS Lection_3;
USE Lection_3;
DROP TABLES IF EXISTS phone;
-- 1. Создаем таблицу по условию
CREATE TABLE IF NOT EXISTS phone
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    ProdactName VARCHAR(45),
    Manufacturer VARCHAR(45),
    ProductCount INT,
    Price INT
);
INSERT phone(ProdactName,Manufacturer,ProductCount,Price)
VALUES
	('iPhone X', 'Apple', '3', '76000'),
	('iPhone 8', 'Apple', '2', '51000'),
	('iPhone 7', 'Apple', '5', '32000'),
	('Galaxy S9', 'Samsung', '2', '56000'),
	('Galaxy S8', 'Samsung', '1', '46000'),
	('Honor 10', 'Huawei', '5', '28000'),
	('Nokia 8', 'HMD Global', '6', '38000');
    
SELECT * FROM phone
ORDER BY Price; -- Сортировка [ASC | DESC] - По возрастанию \Или по убыванию

SELECT ProdactName, ProductCount * Price AS TotalSum
FROM phone
ORDER BY TotalSum DESC;

SELECT ProdactName, Price, ProductCount
FROM phone
ORDER BY ProductCount * Price;

SELECT * FROM phone
LIMIT 3; -- Заданное кол-во строчек!!

SELECT * FROM phone
LIMIT 2,3;

SELECT DISTINCT Manufacturer FROM phone; -- DISTINCT Уникальные значения из столбца
SELECT DISTINCT Manufacturer, ProductCount FROM phone; 

-- Группировка GROUP BY

SELECT Manufacturer, COUNT(*) AS ModelCount
FROM phone
GROUP BY Manufacturer;

/*Агрегатные функции — count, sum, avg, обработка Null
Агрегатные функции вычисляют некоторые скалярные значения
в наборе строк. В MySQL есть следующие агрегатные функции:
AVG: вычисляет среднее значение
SUM: вычисляет сумму значений
MIN: вычисляет наименьшее значение
MAX: вычисляет наибольшее значение
COUNT: вычисляет количество строк в запросе*/

SELECT AVG(Price) AS Average_Price FROM phone;

SELECT AVG(Price) FROM phone
WHERE Manufacturer = 'Apple';

SELECT COUNT(*) FROM phone;

SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM phone
GROUP BY Manufacturer
HAVING COUNT(*) > 1;

SELECT Manufacturer, COUNT(*) AS ModelsCount
FROM phone
WHERE Price * ProductCount > 80000
GROUP BY Manufacturer
HAVING COUNT(*) > 1;

SELECT Manufacturer, COUNT(*) AS Model, SUM(ProductCount) AS Units
FROM phone
WHERE Price * ProductCount > ''
GROUP BY Manufacturer
HAVING SUM(ProductCount) > 2
ORDER BY Units DESC;

SELECT * FROM phone
ORDER BY Price DESC;

SELECT COUNT(*) AS sum
FROM phone;
-- 1 Параметр LIMIT
SELECT * FROM phone
LIMIT 5;

-- 2 ДВА Параметра LIMIT

SELECT * FROM phone
LIMIT 1,2;

SELECT SUM(Price) AS TotalSum FROM phone;

SELECT MIN(price)
FROM phone
WHERE Manufacturer = 'Apple';

SELECT MIN(price), MAX(price), AVG(price)
FROM phone
WHERE Manufacturer = 'Samsung';

SELECT Manufacturer, COUNT(*) AS Models, Price, ProductCount
FROM phone
WHERE Price > '40000'
GROUP BY Manufacturer;