-- SELECT * FROM EMPLOYEES;
/*
    it show different values from query result based provided column
 */

-- it returns 107
SELECT FIRST_NAME FROM EMPLOYEES;

--it removed duplicates and returned 91 result
SELECT DISTINCT FIRST_NAME FROM EMPLOYEES;

-- it will check each row to filter different columns --> * --> all columns
SELECT DISTiNCT * FROM EMPLOYEES;

select * from jobs;

select job_id from jobs;
--since primary key cannot be duplicate it gives the same result with distinct.
select distinct job_id from jobs;