-- 1. Создание БД
CREATE DATABASE IF NOT EXISTS lesson3;

-- 2. Подключаемся к БД
USE lesson3;
DROP TABLE IF EXISTS staff;
CREATE TABLE IF NOT EXISTS staff 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8,2), -- 100 000 . 00 - 8 - знаков всего, 2 - в дробной части
    age INT
);
-- 4. Заполнение таблицы данными
INSERT staff(first_name, last_name, post, seniority,salary,age)
VALUES ("Петр", "Петров", "Начальник", 8, 70000, 30); -- id = 1
INSERT staff (first_name, last_name, post, seniority, salary, age)
VALUES
  ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
  ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
  ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
  ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
  ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
  ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
  ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
  ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
  ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
  ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
  ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
  ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
  SELECT * FROM staff;
-- ORDER BY Сортировка
SELECT
	id,
    salary,
    CONCAT(first_name, ' ', last_name) AS fullname
FROM staff
ORDER BY salary DESC -- Исходное значение по возростанию, DESC по убыванию
LIMIT 5;

SELECT
	id,
    salary,
    first_name,
    last_name
FROM staff
ORDER BY last_name DESC, first_name DESC, salary;

SELECT DISTINCT last_name
FROM staff
ORDER BY last_name;

-- Группировка - group by 
-- По каждой отдельно взятой должности найти:
-- Среднюю ЗП, мин и макс ЗП, кол-во сотрудников и разницу между макс и мин ЗП

SELECT
	post,
    ROUND(AVG(salary), 2) AS average,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary, 
    COUNT(*) AS `count`, -- буква ё на англ.
	MAX(salary) - MIN(salary) AS diff
FROM staff
WHERE post != "Уборщик" -- До группировки я исключил "Уборщик"
GROUP BY post
HAVING AVG(salary) > 25000 -- Работать лучше с агрегатными функциями 
ORDER BY average;