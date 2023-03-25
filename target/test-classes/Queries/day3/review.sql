select * from EMPLOYEES;

--Task: how many locations we have for each country
SELECT COUNTRY_ID,COUNT(*)
FROM LOCATIONS
GROUP BY COUNTRY_ID;

--order them based country_id asc
SELECT COUNTRY_ID,COUNT(*)
FROM LOCATIONS
GROUP BY COUNTRY_ID
ORDER BY COUNTRY_ID DESC;

--what if I want to see only US,UK and CA
SELECT COUNTRY_ID,COUNT(*)
FROM LOCATIONS
WHERE COUNTRY_ID IN('US','UK','CA')
GROUP BY COUNTRY_ID
ORDER BY COUNTRY_ID DESC;

--display where location count is bigger than 2
SELECT COUNTRY_ID,COUNT(*)
FROM LOCATIONS
WHERE COUNTRY_ID IN('US','UK','CA')
GROUP BY COUNTRY_ID
HAVING count(*)>2
ORDER BY COUNTRY_ID DESC;

--TASK2: Display all employees salary in following format as column name Employees_salary
--Ex:
-- Steven makes 24000
-- Neena makes 17000
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME||' makes '||SALARY as Employees_salary
FROM EMPLOYEES;