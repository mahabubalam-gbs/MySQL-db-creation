-- Window Functions
-- Where GROUP BY don't roll everything up into one row when grouping
-- Window Functions allow us to look at a partition or a group but they keep their own unique rows in the output

SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON sal.employee_id = dem.employee_id
GROUP BY gender;

-- For window function, all we have to put is over with a closed parenthesis
-- This would show average salary of everybody

SELECT gender, AVG(salary) OVER()
FROM employee_demographics dem
JOIN employee_salary sal
	ON sal.employee_id = dem.employee_id;

-- PARTITION BY is going to separate it out kind of like GROUP BY

SELECT gender, AVG(salary) OVER(PARTITION BY gender) 
FROM employee_demographics dem
JOIN employee_salary sal
	ON sal.employee_id = dem.employee_id;
    
-- We would get female's average salary in their own individual rows and male average salary in their own individual rows

-- why we would use window functions --> we can add additional information window function doesn't affect the average column at all.

SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender) 
FROM employee_demographics dem
JOIN employee_salary sal
	ON sal.employee_id = dem.employee_id;
    
    
-- If we try to do this exact same thing with GROUP BY --> we would get a complete different result
-- Because we are grouping by the first_name, last_name, and the gender
-- We're breaking everything out based off of the unique values in these columns
-- On the other hand,  "AVG(salary) OVER(PARTITION BY gender)" it is completely independent of what is going on in these other columns --> window function

SELECT dem.first_name, dem.last_name, gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON sal.employee_id = dem.employee_id
GROUP BY dem.first_name, dem.last_name, gender;

-- SUM operation
SELECT dem.first_name, dem.last_name, gender, SUM(salary) OVER(PARTITION BY gender) 
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

-- Rolling total can be done within MySQL
-- A rolling total is going to start at a specific value and add on values from subsequent rows based off of your partition

SELECT dem.first_name, dem.last_name, gender, salary, SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

-- without PARTITION BY
SELECT dem.first_name, dem.last_name, gender, salary, SUM(salary) OVER(ORDER BY dem.employee_id) AS Rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;


-- There are some special thing that you can only do with window functions or window like funtions (ROW_NUMBER / RANK / DENSE_RANK)
-- ROW_NUMBER()--> will get a column of row numbers and OVER() --> everything
-- row numbers are unique, they will not have any duplicate numbers

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

-- Rank row numbers based on the highest salary first down to the lowest salary

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;


-- RANK() --> when it encounters a duplicate based off the ORDER BY which is the salary, rank is going the assign the same number   
-- what is unique about the rank is that the next number is not gonna be the next number numerically, is going to be the next number positionally

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;


-- DENSE_RANK() --> when it founds any duplicate, it duplicates them but it's gonna give the next number numerically NOT positionally
-- that's the only difference between rank and dense_rank

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

