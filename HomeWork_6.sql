CREATE DATABASE IF NOT EXISTS Homework_6;
USE Homework_6;
-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'
DROP FUNCTION IF EXISTS times;
DELIMITER $$
CREATE FUNCTION times(seconds INT) 
  RETURNS VARCHAR(100)
  DETERMINISTIC
BEGIN
  DECLARE result VARCHAR(100);
  DECLARE days_count INT DEFAULT 0;
  DECLARE hours_count INT DEFAULT 0;
  DECLARE minutes_count INT DEFAULT 0;

  -- кол-во дней
  IF seconds >= 86400 THEN
    SET days_count = seconds DIV 86400;
    SET seconds = seconds % 86400;
  END IF;

  -- кол-во часов
  IF seconds >= 3600 THEN
    SET hours_count = seconds DIV 3600;
    SET seconds = seconds % 3600; 
  END IF;

  -- минуты и секунды
  IF seconds >=60 THEN
    SET minutes_count = seconds DIV 60;
    SET seconds = seconds % 60;
  END IF;
  
  SET result = CONCAT(
                    CAST(days_count AS CHAR), ' дней ',
                    CAST(hours_count AS CHAR), ' час ',
                    CAST(minutes_count AS CHAR), 'мин.');
  SET result = CONCAT(result, CAST(seconds AS CHAR), ' сек.');
  
  RETURN result;
END$$
DELIMITER ;

SELECT times(123456);
SELECT times(1000000);

-- 2. Выведите только четные числа от 1 до 10 (Через цикл). Пример: 2,4,6,8,10
DROP PROCEDURE IF EXISTS even_num;
DELIMITER $$ 
CREATE PROCEDURE even_num (IN count_num INT, OUT result VARCHAR(1000))
BEGIN
  DECLARE i INT DEFAULT 2;
  SET result = '';
  WHILE i <= count_num DO
	SET result = CONCAT(result, CAST(i AS char), ' '); 
    SET i = i + 2;
	END WHILE;
END
$$
DELIMITER ;
-- Вызов
SET @even_name = '';
CALL even_num(44, @even_name);
SELECT @even_name;


