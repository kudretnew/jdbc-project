select * from EMPLOYEES;

--the query below second column name is "ROUND(AVG(SALARY))" which is not nice looking
select DEPARTMENT_ID, round(avg(SALARY)) as Average_salary
--or "Average salary" works too, but not preferable
from  EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg(SALARY) >6000;

--the manager is asking display the annual salary for all employees as annual_salary
select  FIRST_NAME, SALARY*12 as annual_salary from EMPLOYEES;


    /*
    STRING Manipulation

In java we do concatenation like this  Java  +first_name+ “ ” + last_name
In SQL we do concatenation like this  SQL  ||first_name|| ‘ ’ || last_name
Basically instead of + we use || and instead of “ ” we use ‘ ’   //DO NOT forget space between quotation


     */

select FIRST_NAME || ' ' || LAST_NAME as full_name from EMPLOYEES;

--add @cydeo.com to all the emails in the employee table.

select EMAIL||'@cydeo.com' as new_email from EMPLOYEES;
select * from EMPLOYEES;
select concat(EMAIL,'@cydeo.com') from EMPLOYEES;

--lower_case
select lower(EMAIL||'@cydeo.com') as new_email from EMPLOYEES;

--upper_case
select UPPER(EMAIL||'@cydeo.com') as new_email from EMPLOYEES;

--INITCAP makes all the first letter upper case
select INITCAP(email||'@cydeo.com') from EMPLOYEES;


select EMAIL,length(EMAIL) as email_length from EMPLOYEES;

select FIRST_NAME,length(FIRST_NAME) as first_name_length from EMPLOYEES
where length(FIRST_NAME)=6
order by FIRST_NAME desc ;

select FIRST_NAME from EMPLOYEES
where FIRST_NAME like '______'
order by FIRST_NAME desc;

select COUNT(*) from EMPLOYEES
where FIRST_NAME like '______';

--display initial from firstname and lastname --> E.A. --K.A.
select * from EMPLOYEES;
select substr(FIRST_NAME,0,1)||'.'||substr(EMPLOYEES.LAST_NAME, 0,1)||'.' as initials from EMPLOYEES;
/*
If write -2 it takes 2 from back
If the beginning index is 0, it is treated as 1
If the beginning index is negative, it will start form backwards
If we do not specify number of char it will work till the end
 */

select FIRST_NAME, substr(FIRST_NAME,-2) from EMPLOYEES;
select FIRST_NAME, substr(FIRST_NAME,0) from EMPLOYEES;

SELECT * FROM EMPLOYEES;

/*
    1.Column alieases --> it is temporary name to show in display
    2.Table alieases which we will learn later
        Employees --> E
 */

--the query below second column name is "ROUND(AVG(SALARY))" which is not nice.
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) as "Average salary"
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL --to remove null department id from the result
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >6000
ORDER BY 2 ASC;

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) as Average_salary
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL --to remove null department id from the result
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >6000
ORDER BY 2 ASC;


--manager is asking display annual salary for all employees as annual_salary
SELECT FIRST_NAME, SALARY*12 as annual_salary
FROM EMPLOYEES;

--NOTE --> we are just displaying and nothing will change it DB

---------------------STRING MANIPULATION---------------------
/*
        CONCAT
            --Java --> + first_name+" "+last_name
            --SQL --> || first_name||' '||last_name
 */
--I want to get fullname column where we have firstname+' '+lastname
SELECT FIRST_NAME||' '||LAST_NAME as full_name
FROM EMPLOYEES;

--add @cydeo.com to all the emails in the employee table.
SELECT email||'@cydeo.com' FROM EMPLOYEES;

SELECT concat(EMAIL,'@cydeo.com') FROM  EMPLOYEES;

--lowercase
SELECT lower(email||'@cydeo.com') FROM EMPLOYEES;

--uppercase

SELECT UPPER(email||'@cydeo.com') FROM EMPLOYEES;

--INITCAP
--it makes first letter uppercase

SELECT INITCAP(email||'@cydeo.com') FROM EMPLOYEES;

--LENGTH
select email, length(email) as email_length FROM EMPLOYEES;

--display all employees where firstname length equals 6
SELECT FIRST_NAME from EMPLOYEES
WHERE length(FIRST_NAME) = 6;

--another solution
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '______';

--how many question ??
SELECT COUNT(*) FROM EMPLOYEES
WHERE FIRST_NAME LIKE '______';

--display initial from firstname and lastname --> S.K.  ---- N.K.

--SUBSTR(columName,beginningIndex,numberOfChar)
select * from EMPLOYEES;

select substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1)||'.' as initials from EMPLOYEES;

select substr(FIRST_NAME,1,1)||'.'||substr(LAST_NAME,1,1)||'.' as initials from EMPLOYEES;

select FIRST_NAME,substr(FIRST_NAME,-2,2) from EMPLOYEES;

select FIRST_NAME,substr(FIRST_NAME,-3) from EMPLOYEES;

/*
    -if beginning index is 0, it is treated as 1
    -if the beginning index negative, it will start from backwards
    -if we dont specify number of char it will work till the end
 */
