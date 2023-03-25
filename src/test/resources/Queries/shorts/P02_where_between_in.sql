select * from EMPLOYEES;

select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES
where FIRST_NAME = 'James'; -- '' is case sensitive
--I want to get first and last name and salary from employees table
--where first name is James

select FIRST_NAME, SALARY from EMPLOYEES
where SALARY<5000 and MANAGER_ID=114;
--I want to get first name and salary from employees table
--where the salary is smaller than 5k and manager_id is 114
--or we can apply this for all the employees
select * from EMPLOYEES
where SALARY<5000 and MANAGER_ID=114;

select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES
where SALARY<=5000 and SALARY >=3000;
--where the salary is less and equals to 5k but more and equals to 3k

select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES
where SALARY between 3000 and 5000;
--where the salary is less and equals to 5k but more and equals to 3k

select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES
where FIRST_NAME = 'David' or , FIRST_NAME='James';
--where first name is David or Peter or James
--instead of this we can use IN Statement
select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES
where FIRST_NAME In ('David', 'Peter', 'James');

