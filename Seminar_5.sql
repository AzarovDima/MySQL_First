USE lesson3;

SELECT *
FROM staff;

-- Ранжирование 
-- Вывести список всех сотрудников и указать в общем списке место по ЗП 
SELECT
	salary,
    post,
    CONCAT(first_name, " ", last_name) AS fullname, -- "Вася Петров"
    DENSE_RANK() OVER(ORDER BY salary DESC) AS `dense_rank`
FROM staff;

-- Вывести список всех сотрудников и указать в общем списке место по ЗП 
-- Но по каждой специальности 
SELECT
	salary,
    post,
    CONCAT(first_name, " ", last_name) AS fullname, -- "Вася Петров"
    DENSE_RANK() OVER(PARTITION BY post ORDER BY salary DESC) AS `dense_rank`
FROM staff;

-- Найдите самых высокооплачиваемых сотрудников
SELECT
	*
FROM (SELECT
	salary,
    post,
    CONCAT(first_name, " ", last_name) AS fullname, -- "Вася Петров"
    DENSE_RANK() OVER(PARTITION BY post ORDER BY salary DESC) AS `dense_rank`
FROM staff) rank_salary
WHERE `dense_rank` = 1;
-- ТОп-2
SELECT
	*
FROM (SELECT
	salary,
    post,
    CONCAT(first_name, " ", last_name) AS fullname, -- "Вася Петров"
    DENSE_RANK() OVER(PARTITION BY post ORDER BY salary DESC) AS `dense_rank`
FROM staff) rank_salary
WHERE `dense_rank` IN (1,2); -- `dense_rank` = 1 OR `dense_rank` = 2

-- Агрегация 
-- Вывести по должностям: 
-- суммарную зп
-- среднюю зп 
-- процентное соотношение отдельно взятой ЗП внутри должности к суммарной ЗП 
SELECT 
	salary,
    post,
    CONCAT(firstname, " ", lastname) AS fullname,
    SUM(salary) OVER w AS sum_salary, -- (PARTITION BY post)
    AVG(salary) OVER w AS avg_salary, -- (PARTITION BY post)
    ROUND(salary * 100 / SUM(salary) OVER w, 2) AS percent_sum_salary
FROM staff
WINDOW w AS (PARTITION BY post);

SELECT 
	salary,
    post,
    CONCAT(firstname, " ", lastname) AS fullname,
    SUM(salary) OVER (PARTITION BY post) AS sum_salary, -- (PARTITION BY post)
    AVG(salary) OVER (PARTITION BY post) AS avg_salary, -- (PARTITION BY post)
    ROUND(salary * 100 / SUM(salary) OVER (PARTITION BY post), 2) AS percent_sum_salary
FROM staff;


SELECT 
	salary,
    post,
    CONCAT(firstname, " ", lastname) AS fullname,
    SUM(salary) OVER (PARTITION BY post) AS sum_salary, -- (PARTITION BY post)
    AVG(salary) OVER (PARTITION BY post) AS avg_salary, -- (PARTITION BY post)
    ROUND(salary * 100 / SUM(salary) OVER (PARTITION BY post), 2) AS percent_sum_salary
FROM staff;


SELECT 
	salary,
    post,
	CONCAT(firstname, " ", lastname) AS fullname,
    ROUND(AVG(salary) OVER w, 2) AS avg_salary
FROM staff
WINDOW w AS (
    ORDER BY salary DESC
    ROWS BETWEEN 1 PRECEDING -- предыдущая
    AND 1 FOLLOWING --  Между 1 предыдущей и 1 следующей
);

SELECT 
	salary,
    post,
	CONCAT(firstname, " ", lastname) AS fullname,
    ROUND(AVG(salary) OVER (ORDER BY salary DESC ROWS BETWEEN 1 PRECEDING  AND 1 FOLLOWING)) AS avg_salary --  Между 1 предыдущей и 1 следующей , 2) AS avg_salary
FROM staff;

-- Представления 
SELECT
	COUNT(*) AS count_staff,
    post,
    AVG(salary) AS `avg`
FROM staff
GROUP BY post
ORDER BY count_staff;

CREATE OR REPLACE VIEW count_post
AS
SELECT
	COUNT(*) AS count_staff,
    post,
    AVG(salary) AS `avg`
FROM staff
GROUP BY post
ORDER BY count_staff;

SELECT * 
FROM count_post;

SHOW FULL TABLES
WHERE Table_type = "VIEW";

ALTER VIEW count_post AS
SELECT
	COUNT(*) AS count_staff,
    post,
    AVG(salary) AS `avg`,
    SUM(salary) AS `sum`
FROM staff
GROUP BY post
ORDER BY count_staff;