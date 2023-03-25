--------------- SELECT ,WHERE, LIKE -------------------

--TASK 1 - display department names  from departments table
SELECT DEPARTMENT_NAME FROM DEPARTMENTS;

--TASK 2 - display first_name, last_name, department_id, salary from employees
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMPLOYEES;


--TASK 3 - display first_name, last_name, department_id, salary from employees whose salary is higher than 9000
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMPLOYEES
WHERE SALARY>9000;


--TASK 4 - display first_name, last_name, department_id, salary from employees
--         whose salary equals or more than 9000 and salary equals or less than 15000
--         sort result based on salary asc

-- OPT --> 1
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMPLOYEES
WHERE SALARY>=9000 AND SALARY<=15000
ORDER BY SALARY ; -- AS DEFAULT IT WILL SORT IN ASC ORDER
-- ORDER BY 4 ; -- AS DEFAULT IT WILL SORT IN ASC ORDER

-- OPT --> 2
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN 9000 AND 15000 -- BETWEEN LOWER AND UPPER (THIS BOUNDARIES ARE INCLUDED)
ORDER BY SALARY ASC;




--TASK 5 -  display first_name, last_name, department_id, salary from employees
--          whose firstname is Peter and salary is bigger than 5000
--          sort result based on salary desc
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMPLOYEES
WHERE FIRST_NAME='Peter' AND SALARY>5000
ORDER BY SALARY DESC;
-- '' --> DATA INSIDE SINGLE QUOTE IS CASE SENSITIVE



--TASK 6 - display country_id, country_name from countries table for region id 2 or 4
--         sort result based on region_id desc and country_name asc

--OPT-->1
SELECT COUNTRY_ID,COUNTRY_NAME,REGION_ID FROM COUNTRIES
WHERE REGION_ID=2 OR REGION_ID=4
ORDER BY REGION_ID DESC,COUNTRY_NAME ASC;

--OPT-->2
SELECT COUNTRY_ID,COUNTRY_NAME,REGION_ID FROM COUNTRIES
WHERE REGION_ID IN(2,4)
ORDER BY REGION_ID DESC,COUNTRY_NAME ASC;


--TASK 7 -  display employee firstname and lastname as fullname , salary as annual salary  , job_id
--          whose job ID starts with S

SELECT FIRST_NAME||' '||LAST_NAME AS FULLNAME,SALARY*12 AS "ANNUAL SALARY",JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE 'S%';
-- % --> REFERS 0 OR MORE LETTER
-- _ --> REFERS SINGLE LETTER

-- whose job ID starts with S AND TOTAL 6 LETTER
SELECT FIRST_NAME||' '||LAST_NAME AS FULLNAME,SALARY*12 AS "ANNUAL SALARY",JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE 'S_____';
-- % --> REFERS 0 OR MORE LETTER
-- _ --> REFERS SINGLE LETTER


-- TASK 8 - display country id and country name where country name ends with a
SELECT COUNTRY_ID,COUNTRY_NAME FROM COUNTRIES
WHERE COUNTRY_NAME LIKE '%a';


-- TASK 9 -  display country id and country name where country name ends with a and third letter is i
SELECT COUNTRY_ID,COUNTRY_NAME FROM COUNTRIES
WHERE COUNTRY_NAME LIKE '__i%a';


------ INTERVIEW QUESTION  -->
/*
    Write a query to print first_name and salary for all employees in the Employee table
    who earn a salary larger than 3000
    Sort your results in ascending order of the last 3 characters in the employees first_name
    if two or more employees have first_names ending with same 3 characters, then sort them by highest salary
*/
SELECT FIRST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY>3000
ORDER BY LOWER(SUBSTR(FIRST_NAME,-3)) ASC,SALARY DESC ;



--------------- GROUP BY, HAVING  -------------------

-- TASK 10- 1 -  how many city we have in each country from locations table
SELECT COUNTRY_ID,COUNT(*) FROM LOCATIONS
GROUP BY COUNTRY_ID;

-- BEST PRACTICE IN THIS EXAMPLE SINCE WE NEED TO COUNT CITIES
SELECT COUNTRY_ID,COUNT(CITY) FROM LOCATIONS
GROUP BY COUNTRY_ID;

SELECT COUNTRY_ID,CITY FROM LOCATIONS;


-- COUNT(*) VS COUNT(CNAME)
-- COUNT(*) --> WILL COUNT ROWS
-- COUNT(CNAME) --> WILL COUNT COLUMNS AND IGNORES NULL VALUES
SELECT FIRST_NAME,DEPARTMENT_ID FROM EMPLOYEES;
SELECT COUNT(DEPARTMENT_ID) FROM EMPLOYEES; --> 106
SELECT COUNT(*) FROM EMPLOYEES; --> 107


-- TASK 10- 2  - order them based on city count in desc
SELECT COUNTRY_ID,COUNT(CITY) AS CITY_COUNT FROM LOCATIONS
GROUP BY COUNTRY_ID
ORDER BY CITY_COUNT DESC;


-- TASK 10- 3 -  filter result where country id starts with C
SELECT COUNTRY_ID,COUNT(CITY) AS CITY_COUNT FROM LOCATIONS
WHERE COUNTRY_ID LIKE 'C%'
GROUP BY COUNTRY_ID
ORDER BY CITY_COUNT DESC;


-- TASK 10- 3 -  display country id if city count is bigger than 1
SELECT COUNTRY_ID,COUNT(CITY) AS CITY_COUNT FROM LOCATIONS
GROUP BY COUNTRY_ID
HAVING COUNT(CITY)>1
ORDER BY CITY_COUNT DESC;


-- TASK 11 -1  How many employees is working for each department
SELECT DEPARTMENT_ID,COUNT(*) AS EMPLOYEE_COUNT FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- TASK 11 -2  ignore null departments
SELECT DEPARTMENT_ID,COUNT(*) AS EMPLOYEE_COUNT FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID;

-- TASK 11 -3  display department id where employees count is less than 5
SELECT DEPARTMENT_ID,COUNT(*) AS EMPLOYEE_COUNT FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)<5;


------- SUBQUERY -------

-- TASK 12 - Display those employees firstname,lastname and salary
--           who get higher salary than the employee whose employee_id is 132

--STEP 1 --> FIND ME SALARY OF EMPLOYEE_ID 132
SELECT FIRST_NAME,SALARY FROM EMPLOYEES
WHERE EMPLOYEE_ID=132;

--STEP 2 --> FIND ME WHO IS GETTING MORE THAN 2100
SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY>2100;

-- SOLUTION --> MAKE IT DYNAMIC
SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY>(SELECT SALARY FROM EMPLOYEES
              WHERE EMPLOYEE_ID=132);

-- TASK 13 -  Display Manager firstname,lastname of Peter,Vargas from employees table

SELECT * FROM EMPLOYEES;
--STEP 1 --> FIND ME MANAGER ID FOR  Peter,Vargas
SELECT MANAGER_ID FROM EMPLOYEES
WHERE FIRST_NAME='Peter' AND LAST_NAME='Vargas'; --124

--STEP 2 --> FIND ME INFORMATION ABOUT EMPLOYEE_ID 124
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES
WHERE EMPLOYEE_ID=124;


-- SOLUTION --> MAKE IT DYNAMIC
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES
WHERE EMPLOYEE_ID=(SELECT MANAGER_ID FROM EMPLOYEES
                   WHERE FIRST_NAME='Peter' AND LAST_NAME='Vargas');


-- TASK 14 - Display Employees first_name,last_name who reports to 'Steven King'
SELECT * FROM EMPLOYEES;
--STEP 1 --> FIND ME EMPLOYEE ID FOR  'Steven King'
SELECT EMPLOYEE_ID FROM EMPLOYEES
WHERE FIRST_NAME='Steven' AND LAST_NAME='King'; --100

--STEP 2 --> FIND ME MANAGER ID EQUALS STEVEN KING EMPLOYEE ID
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES
WHERE MANAGER_ID=100;

--SOLUTION  -->MAKE IT DYNAMIC
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES
WHERE MANAGER_ID=(SELECT EMPLOYEE_ID FROM EMPLOYEES
                  WHERE FIRST_NAME='Steven' AND LAST_NAME='King');


-- TASK 15 -  display all information who is getting 11th highest salary

SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY DESC;

--STEP 1 --> FIND ME 11th HIGHEST SALARY
SELECT MIN(SALARY) FROM (SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY DESC)
WHERE ROWNUM<12; --10000


--STEP 2 --> FIND ME WHO IS GETTING THAT SALARY
SELECT * FROM EMPLOYEES
WHERE SALARY=10000;

--SOLUTION --> MERGE THIS QUERIES TO MAKE IT DYNAMIC
SELECT * FROM EMPLOYEES
WHERE SALARY=(SELECT MIN(SALARY) FROM (SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY DESC)
              WHERE ROWNUM<12);



-- TASK 16 - Display employees first_name,last_name who is working in Marketing department

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

--STEP 1 --> FIND MARKETING DEPARTMENT ID
SELECT DEPARTMENT_ID FROM DEPARTMENTS
WHERE DEPARTMENT_NAME='Marketing'; --20

--STEP 2 --> FIND EMPLOYEES WHO IS WORKING IN THIS DEPARTMENT
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID=20;

--SOLUTION -->
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID=(SELECT DEPARTMENT_ID FROM DEPARTMENTS
                     WHERE DEPARTMENT_NAME='Marketing');

--- DDL / DML ---

-- DQL --> DATA QUERY LANGUAGE  --> SELECT
-- DML --> DATA MANIPULATION LANGUAGE
-- DDL --> DATA DEFINITION LANGUAGE




----- JOINS ----

-- INNER JOIN RETURN ONLY THE DATA THAT MATCH FROM BOTH TABLE ACCORDING TO CONDITION
-- Display all first_name and  related department_name
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

-- STEVEN EXECUTIVE
-- DAVID IT
-- ...
-- ..
-- .

SELECT FIRST_NAME,DEPARTMENT_NAME FROM EMPLOYEES
                                           INNER JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;


SELECT FIRST_NAME,DEPARTMENT_NAME FROM EMPLOYEES E
                                           INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT FIRST_NAME,DEPARTMENT_NAME,D.DEPARTMENT_ID FROM EMPLOYEES E
                                                           INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- IT IS POSSIBLE TO ADD MORE STATEMENT TO FILTER OR ORDER RESULTS
SELECT FIRST_NAME,DEPARTMENT_NAME FROM EMPLOYEES E JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME LIKE 'S%'
ORDER BY DEPARTMENT_NAME ASC,FIRST_NAME ASC;

-- HOW MANY EMPLOYEES WORKS IN DEPARTMENTS
SELECT DEPARTMENT_NAME,COUNT(FIRST_NAME) FROM EMPLOYEES E
                                                  JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME LIKE 'S%'
GROUP BY DEPARTMENT_NAME;


-- LEFT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR LEFT
-- Display all first_name and department_name including the  employee without department
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT FIRST_NAME,DEPARTMENT_NAME FROM EMPLOYEES E
                                           LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT FIRST_NAME,DEPARTMENT_NAME FROM DEPARTMENTS D
                                           RIGHT JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- RIGHT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR RIGHT
-- Display all first_name and department_name including the department without employee
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT FIRST_NAME,DEPARTMENT_NAME FROM EMPLOYEES E
                                           RIGHT JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT FIRST_NAME,DEPARTMENT_NAME FROM DEPARTMENTS D
                                           LEFT JOIN EMPLOYEES E on D.DEPARTMENT_ID = E.DEPARTMENT_ID;


-- FULL OUTER JOIN RETURNS EVERYTHING
-- Display all firstname and department name including the department without employees
-- and also employees without the department
SELECT FIRST_NAME,DEPARTMENT_NAME FROM DEPARTMENTS D
                                           FULL JOIN EMPLOYEES E on D.DEPARTMENT_ID = E.DEPARTMENT_ID;



--TASK 1-1
-- From the departments and locations tables,
-- display the department name, city, and state province for each department.
SELECT d.department_name, l.city, l.state_province
FROM departments d
         JOIN locations l ON d.location_id = l.location_id;

--TASK 1-2
-- display only department names ends with Sales
SELECT d.department_name, l.city, l.state_province
FROM departments d
         JOIN locations l ON d.location_id = l.location_id
WHERE DEPARTMENT_NAME LIKE '%Sales';


-- TASK 2
-- From employees, departments, and locations tables,
-- find those employees whose first name contains a letter 'z'.
-- Return first name, last name, department, city, and state province.

SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province
FROM employees e
         JOIN departments d ON e.department_id = d.department_id
         JOIN locations  l ON d.location_id = l.location_id
WHERE e.first_name LIKE '%z%';



--TASK 3
-- From the employees and departments table,
-- compute the average salary, number of employees in for each department..
-- Return department name, average salary and number of employees.

SELECT d.department_name, round(AVG(e.salary)) AS avg_salary, COUNT(e.employee_id) AS employee_count
FROM employees e
         JOIN departments  d ON e.department_id = d.department_id
GROUP BY d.department_name;


--TASK 4
-- From the employees, departments, and locations tables,
-- find full name (first and last name), and salary of those employees
-- who work in any department located in Oxford .
SELECT CONCAT(e.first_name, concat(' ', e.last_name))  , e.salary,CITY
FROM employees  e
         JOIN departments  d ON e.department_id = d.department_id
         JOIN locations  l ON d.location_id = l.location_id
WHERE l.city = 'Oxford';



--TASK 5  From the employees, departments, and locations tables,
-- -- find avg salary for each city
SELECT city,round(avg(salary))
FROM employees  e
         JOIN departments  d ON e.department_id = d.department_id
         JOIN locations  l ON d.location_id = l.location_id
group by city;


----- SELF JOIN ---
select WORKERS.FIRST_NAME,WORKERS.LAST_NAME,MANAGERS.FIRST_NAME,MANAGERS.LAST_NAME
from EMPLOYEES WORKERS  inner join EMPLOYEES MANAGERS
                                   on WORKERS.MANAGER_ID=MANAGERS.EMPLOYEE_ID;


-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers.
select WORKERS.FIRST_NAME,WORKERS.LAST_NAME,WORKERS.SALARY,MANAGERS.SALARY,MANAGERS.FIRST_NAME,MANAGERS.LAST_NAME
from EMPLOYEES WORKERS  left join EMPLOYEES MANAGERS
                                  on WORKERS.MANAGER_ID=MANAGERS.EMPLOYEE_ID
where WORKERS.SALARY>MANAGERS.SALARY;



select COUNTRY_ID,CITY from locations;