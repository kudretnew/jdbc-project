---- PRACTICE 1 ----


--4. List all the different region_ids in countries table
SELECT DISTINCT REGION_ID FROM COUNTRIES;


--5. Display the salary of the employee Grant Douglas (lastName: Grant, firstName: Douglas)

SELECT SALARY FROM EMPLOYEES
WHERE FIRST_NAME='Douglas' AND LAST_NAME='Grant';

--6. Display all department information from departments table
-- if the department name values are as below
-- IT , Public Relations , Sales , Executive
-- > OPTION --1
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_NAME='IT' OR  DEPARTMENT_NAME='Sales' OR  DEPARTMENT_NAME='Public Relations' OR  DEPARTMENT_NAME='Executive';

-- > OPTION --2
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IN ('IT','Sales','Public Relations','Executive');

-- NOT IN  operator will excluded following departments
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_NAME NOT IN ('IT','Sales','Public Relations','Executive');

-- 16 . Display all unique job_id that ends with CLERK in employee table

SELECT DISTINCT JOB_ID FROM EMPLOYEES
WHERE JOB_ID LIKE '%CLERK';

SELECT DISTINCT JOB_ID,FIRST_NAME FROM EMPLOYEES
WHERE JOB_ID LIKE '%CLERK';



-- 20-4 How many employees are there in each group that have minimum
-- salary of 5000 ?

SELECT JOB_ID,COUNT(*) FROM EMPLOYEES
WHERE SALARY>=5000
GROUP BY JOB_ID;

-- IT WILL FILTER RESULT AFTER GROUP ACCORDING TO THEIR MIN SALARY
-- SINCE IT PROG EMPLOYEES MIN SALARY IS 4200
-- IT WILL NOT SHOW THIS GROUP
SELECT JOB_ID,COUNT(*) FROM EMPLOYEES
GROUP BY JOB_ID
HAVING MIN(SALARY)>=5000;


-- 21. display all job_id and average salary who work as any of these jobs
-- IT_PROG,SA_REP, FI_ACCOUNT, AD_VP


-- 23. Display total salary for each department except department_id 50, and where



---- PRACTICE 2 ----
--8.  Find the 3rd maximum salary from the employees table (do not include duplicates)


--12. Find the 3rd minimum salary from the employees table (do not include duplicates)

---- PRACTICE 3 ----
-- 1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES AND  REGION TABLE


-- 3.  FIND OUT DEPARTMENT_NAME AND CITY


-- 5.  FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID , DEPARTMENT NAME FOR DEPARTMENT ID 80 OR 40


-- 7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,  CITY


-- 8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,CITY , COUNTRY_NAME , REGION_NAME


-- 11 .FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT