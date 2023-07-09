-- Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными. Добавьте скриншот на платформу в качестве ответа на ДЗ

CREATE DATABASE IF NOT EXISTS HOMEWORK_1;
USE HOMEWORK_1;

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
	('Galaxy S9', 'Samsung', '2', '56000'),
	('Galaxy S8', 'Samsung', '1', '41000'),
	('P 20 Pro', 'Huawei', '5', '36000');
    
SELECT * FROM phone;

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)

SELECT ProdactName, Manufacturer, Price
FROM phone
WHERE ProductCount > '2';

-- 3. Выведите весь ассортимент товаров марки “Samsung”

SELECT ProdactName,Manufacturer,ProductCount,Price
FROM phone
WHERE Manufacturer = 'Samsung';

# 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**

SELECT 
    ProdactName, Manufacturer, ProductCount, Price
FROM
    phone
WHERE
    ProductCount * Price > '100000'
        AND ProductCount * Price < '145000';

/* 4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
	4.1. Товары, в которых есть упоминание "Iphone"
	4.2. "Galaxy"
	4.3.  Товары, в которых есть ЦИФРЫ
	4.4.  Товары, в которых есть ЦИФРА "8"  
*/
SELECT ProdactName,Manufacturer,ProductCount,Price
FROM phone
WHERE ProdactName LIKE 'iPhone%';

SELECT ProdactName,Manufacturer,ProductCount,Price
FROM phone
WHERE ProdactName LIKE 'Galaxy%';

SELECT ProdactName,Manufacturer,ProductCount,Price
FROM phone
WHERE ProdactName LIKE '%8%' or Manufacturer LIKE '%8%';