select * from EMPLOYEES;

-- order by used for sorting result

select * from COUNTRIES
order by REGION_ID; --default asc(0-9, A-Z)

select * from COUNTRIES
order by COUNTRY_NAME;

select * from COUNTRIES
order by REGION_ID desc ;

select * from COUNTRIES
where REGION_ID=3
ORDER BY COUNTRY_NAME DESC ;