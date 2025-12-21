-- Subqueries --> It's a query within another query
-- we could do this in a different ways
-- SUBQUERIES are written in ()


-- Subqueries in "WHERE" Clause
-- We want to find the actual employees who work in the parks and recreation department. 
-- We could do that if we had a few joins. But sometimes we don't wanna do that and instead we use subqueries


SELECT * 
FROM employee_demographics
WHERE employee_id IN 
				(SELECT employee_id
					FROM employee_salary
						WHERE dept_id = 1)
;

SELECT * 
FROM employee_salary;

-- WHERE the employee id from the employee_demographics table is IN its gonna try match those employee ids to this list (1,2,3,4,5,6,12)
-- Let's run this entire query. we would find ids (1,3,4,5,6,12). employee id no 2 is only in employee salary table. Since we are doing only employee_demographics table, he (employee id 2) is not here

SELECT * 
FROM employee_demographics
WHERE employee_id IN 
				(SELECT employee_id, dept_id
					FROM employee_salary
						WHERE dept_id = 1)
;

SELECT * 
FROM employee_salary;

-- we goona get no output and get an error (operand should contain 1 column). The operand is referring to the subquery. IN - is operator
-- we are doing two columns here (employee_id and dept_id). we should only have one that is - employee_id


-- Subqueries in "SELECT" Statement
-- Our task is to identify average salary --> wheather someone's salary is above average salary or below average salary

SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary;

-- This is not we are looking for.

SELECT first_name, salary,
(SELECT AVG(salary)
FROM employee_salary) AS avg_salary
FROM employee_salary
GROUP BY first_name, salary;

-- Now we will get the exact output we are looking for.


-- Subqueries in "FROM" Clause

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

-- What if we only want the average of the oldest ages column/smallest ages/ average count of these male and female. We can't do that given this table

SELECT AVG (average_age), AVG(max_age), AVG(min_age)
FROM
(SELECT gender, AVG(age) AS average_age, MAX(age) AS max_age, MIN(age) AS min_age, COUNT(age)
FROM employee_demographics
GROUP BY gender) AS aggregated_table;

-- If we run just this. we will get an error (Every derived table must have its own alias) --> AS aggregated_table.










