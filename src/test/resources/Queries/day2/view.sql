SELECT * FROM EMPLOYEES;

select substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1)||'.' as initials ,
       FIRST_NAME||' '||LAST_NAME as full_name from EMPLOYEES;

CREATE VIEW EmployeeInfo as
select substr(FIRST_NAME,0,1)||'.'||substr(LAST_NAME,0,1)||'.' as initials ,
       FIRST_NAME||' '||LAST_NAME as full_name from EMPLOYEES;

SELECT * FROM EMPLOYEEINFO;

SELECT initials FROM EMPLOYEEINFO;

--drop view

DROP VIEW EmployeeInfo;