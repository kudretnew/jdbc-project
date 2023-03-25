select * from EMPLOYEES;

--Display all information who is making max salary
--max salary
SELECT MAX(SALARY) FROM EMPLOYEES; --24000

--if we know max salary can we find who is getting it ?
SELECT *
FROM EMPLOYEES
WHERE SALARY = 24000;

--if the Steven King salary changes we cant find person who is getting max salary with the query above

--dynamic result
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);

--TASK: Give me all information who is getting min salary
--min salary ?
SELECT MIN(SALARY)
FROM EMPLOYEES;

--who is making min salary ?
SELECT * FROM EMPLOYEES
WHERE SALARY = 2100;

--dynamic query
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);

--display all information who is getting second highest salary ?
--find max salary
SELECT MAX(SALARY) FROM EMPLOYEES;

--second max salary
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY <24000;
--who is making 17000

SELECT *
FROM EMPLOYEES
WHERE SALARY = 17000;

--make it dynamic
SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE SALARY <
                                                        (SELECT MAX(SALARY) FROM EMPLOYEES));
--TASK: Display all information who is getting more than average ?
--find average salary
SELECT ROUND(AVG(SALARY))FROM EMPLOYEES; --6462

--who is making more than average salary ?
SELECT *
FROM EMPLOYEES
WHERE SALARY > 6462;

SELECT *
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY)FROM EMPLOYEES);