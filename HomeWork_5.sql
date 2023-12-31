CREATE DATABASE IF NOT EXISTS Homework_5;
USE Homework_5;
DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);
INSERT INTO cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
SELECT * FROM cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
DROP VIEW IF EXISTS cars_view; -- Решил попробовать удалить представление
CREATE VIEW cars_view AS -- VIEW - Создание представления
SELECT * FROM Cars
WHERE cost < '25000';
SELECT * FROM cars_view; -- вывод представления

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор OR REPLACE)
CREATE OR REPLACE VIEW cars_view AS -- OR REPLACE - Удаляет старое а новое создает с таким же именем!!!
SELECT * FROM Cars
WHERE cost < '30000';
SELECT * FROM cars_view; -- вывод представления

-- 3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

DROP VIEW IF EXISTS cars_only; -- Решил попробовать удалить представление
CREATE VIEW cars_only AS
SELECT * FROM Cars
WHERE name = 'Skoda' or name = 'Audi';
SELECT * FROM cars_only;


/*4. Добавьте новый столбец под названием «время до следующей станции».
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций.
Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно.
Проще это сделать с помощью оконной функции LEAD . Эта функция сравнивает значения из одной строки со следующей строкой,
чтобы получить результат. В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.*/

DROP TABLE IF EXISTS stantion;
CREATE TABLE stantion
(
    train_id_integer INT NOT NULL,
    station_character_varying VARCHAR(40),
    station_time time
);
INSERT INTO stantion
VALUES 
    (110, "San Francisco", "10:00:00"),
	(110, "Redwood City", "10:54:00"),
	(110, "Palo Alto", "11:02:00"),
	(110, "San Jose", "12:35:00"),
	(120, "San Francisco", "11:00:00"),
	(120, "Palo Alto", "12:49:00"),
	(120, "San Jose", "13:30:00");
SELECT * FROM stantion;

SELECT train_id_integer, station_character_varying, station_time,
SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id_integer ORDER BY train_id_integer), station_time)
AS time_to_next_station_interval
FROM stantion;







