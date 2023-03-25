SELECT * FROM EMPLOYEES;

/*
    ORDERBY
        - It allows us to sort data based on provided column
        -AS a Default it will order the result ASCENDING ORDER(A-Z,0-9)
        -IF you want to sort it DESCENDING order we need to specify right after column name
 */

--display all employees based on salary in asc order
SELECT * FROM EMPLOYEES
ORDER BY SALARY;

--same query
SELECT * FROM EMPLOYEES
ORDER BY SALARY ASC;

--display all employees based on salary in asc order
SELECT * FROM EMPLOYEES
ORDER BY SALARY DESC;

--display all the employees based on their firstname desc
SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME DESC;

--display all info where emp id is less than 120 and order them based on salary desc
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID < 120
ORDER BY SALARY DESC;

--display all information from employees and order them based on firstname asc and lastname desc
SELECT * FROM EMPLOYEES
ORDER BY FIRST_NAME ASC, LAST_NAME DESC;