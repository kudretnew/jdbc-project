--display all information who is getting 3th lowest salary
SELECT * FROM EMPLOYEES;

SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY ASC;
-- 3rd min is 2400

--get 3rd min salary dynamically
SELECT MAX(SALARY) FROM (SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY ASC)
WHERE ROWNUM <4;

SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM (SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY ASC)
                WHERE ROWNUM <4);

--who is making 46th min salary dynamically
SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM (SELECT DISTINCT SALARY FROM EMPLOYEES ORDER BY SALARY ASC)
                WHERE ROWNUM <47);

select * from EMPLOYEES
where SALARY = (select max(salary) from (select SALARY from (select distinct SALARY from EMPLOYEES order by (SALARY) asc)
    where rownum<4));
--display 37th lowest salary
select distinct SALARY from EMPLOYEES order by SALARY asc;

select SALARY from EMPLOYEES
    where SALARY = (select SALARY from (select distinct SALARY from EMPLOYEES order by SALARY asc)
                                  where ROWNUM<38);

select * from EMPLOYEES
where SALARY = (select max(SALARY)from (select distinct SALARY from EMPLOYEES order by SALARY asc)
                where ROWNUM<38);
