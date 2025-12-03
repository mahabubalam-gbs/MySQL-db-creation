-- GROUP BY // ORDER BY --> AGGREGATE FUNCTION

-- GROUP BY
SELECT gender , AVG(age), MAX(age), MIN(age), COUNT(age)
    FROM parks_and_recreation.employee_demographics 
    GROUP BY gender
;

SELECT occupation, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
    FROM parks_and_recreation.employee_salary
    GROUP BY occupation
;

-- ORDER BY --> ordering either ascending or descending
SELECT *
 FROM parks_and_recreation.employee_demographics
 ORDER BY first_name ASC
 ;
 
 SELECT *
 FROM parks_and_recreation.employee_demographics
 ORDER BY first_name DESC
 ;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age
;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age DESC
;

-- ORDERING BY POSITION OF THE FIELD --> NOT BEST PRACTICE

SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY 5, 4 DESC
;
