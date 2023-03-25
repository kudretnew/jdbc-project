--your manager is asking all jobs and their average salary.

select * from EMPLOYEES;

select distinct JOB_ID from EMPLOYEES;

--get me average salary for IT_PROG
SELECT AVG(SALARY) FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

--get me average salary for 'AC_ACCOUNT'
SELECT AVG(SALARY) FROM EMPLOYEES
WHERE JOB_ID = 'AC_ACCOUNT';


--get me average salary for 'AC_ACCOUNT'
SELECT AVG(SALARY) FROM EMPLOYEES
WHERE JOB_ID = 'AD_ASST';

--
SELECT JOB_ID,AVG(SALARY),COUNT(*),SUM(SALARY),MIN(SALARY),MAX(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;
--
--Display how many departments we have in each location
SELECT * FROM DEPARTMENTS;

SELECT LOCATION_ID, COUNT(*)
FROM DEPARTMENTS
GROUP BY LOCATION_ID;

--order result based on number of departments in desc
SELECT LOCATION_ID, COUNT(*)
FROM DEPARTMENTS
GROUP BY LOCATION_ID
ORDER BY count(*) DESC;

SELECT LOCATION_ID, COUNT(*)
FROM DEPARTMENTS
GROUP BY LOCATION_ID
ORDER BY 2 ASC;

--display how many countries we have in each regions
SELECT REGION_ID,COUNT(*) FROM COUNTRIES
GROUP BY REGION_ID;

--order them based on number of countries in desc
SELECT REGION_ID,COUNT(*) FROM COUNTRIES
GROUP BY REGION_ID
ORDER BY 2 DESC;

SELECT REGION_ID,COUNT(*) FROM COUNTRIES
GROUP BY REGION_ID
ORDER BY COUNT(*) ASC;
--------------------------
--get me total salary for each department from employees table.
SELECT DEPARTMENT_ID, SUM(SALARY),COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, SUM(SALARY),COUNT(*)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL --to remove null department id from the result
GROUP BY DEPARTMENT_ID;

---display jobids where their avg salary more than 5k
SELECT JOB_ID,AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVG(SALARY) >5000;

--display departments where their average salary is more than 6k
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY))
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL --to remove null department id from the result
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >6000
ORDER BY 2 ASC;

--IQ --> display duplicate(more than one) firstname from employees table.
SELECT first_name,count(*) FROM EMPLOYEES
GROUP BY first_name
HAVING COUNT(*)>1;

--display department id where employees count is bigger than 5
SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY  DEPARTMENT_ID
HAVING COUNT(*) > 5
ORDER BY 2 DESC;