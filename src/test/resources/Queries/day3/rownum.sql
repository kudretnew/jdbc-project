SELECT * FROM EMPLOYEES;

/*
  it limits rows based on provided number
 */
SELECT * FROM EMPLOYEES
WHERE ROWNUM<11;


--display all information from employees who is getting first 5 highest salary
--BAD PRACTICE
--IT is getting data before order them based on salary
--and cut the list from line 6 then it tries to order them between first 5 rows
--that is why we are getting wrong list
SELECT *
FROM EMPLOYEES
WHERE ROWNUM <6
ORDER BY SALARY DESC;

--
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC;

--correct answer
--using ordered by salary desc employees table as an input,
-- after FROM keyword then cutting first 5 with rownum
SELECT *
FROM (SELECT * FROM EMPLOYEES ORDER BY SALARY DESC)
WHERE ROWNUM < 6;

--display all information who is getting 5th highest salary
SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY DESC;

--first we need to find what is 5th highest salary
SELECT MIN(SALARY) FROM (SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY DESC)
WHERE ROWNUM <6; --13000

--who is making 5th highest salary ?
SELECT * FROM EMPLOYEES
WHERE SALARY = 13000;

--dynamic way 5th
SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM (SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY DESC)
                WHERE ROWNUM <6) ;

--IQ how do you find who is making 37th highest salary
-- for the Nth highest salary formula is rownum < N+1
-- for the 37th highest salary rownum < 37+1 = 38

SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM (SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY DESC)
                WHERE ROWNUM <38) ;

--HOMEWORK --> display all information who is getting 3th lowest salary