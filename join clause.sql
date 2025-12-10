-- JOINS --> INNER JOIN OUTER JOIN SELF JOIN
-- JOINS COLUMNS


-- INNER JOIN IS GOING TO RETURN "ROWs" THAT ARE THE SAME IN BOTH COLUMNS FROM BOTH TABLE
-- BY DEFAULT --> JOIN REPRESENT AN INNER JOIN --> if both columns id matches then it will show/join them but missing id will not be joined
-- if there are similar columns name in both tables, we have to denote that in Alias or table name

SELECT * 
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, age, occupation
FROM parks_and_recreation.employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;


-- OUTER JOINS --> LEFT OUTER JOIN 0R LEFT JOIN / RIGHT OUTER JOIN OR RIGHT JOIN
-- LEFT JOIN is going the take everything from the left table even if there is no match in the join and then it will only return the matches from the right table
-- RIGHT JOIN is exact opposite
-- ON ==> based on

SELECT *
FROM parks_and_recreation.employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- FROM statement (employee_demographics) is our left table and LEFT JOIN employee salary is our right table
-- In employee demographics did not have id no 2. So, everything in the right table had a match

-- Now, let's try RIGHT JOIN

SELECT *
FROM parks_and_recreation.employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
;

-- RIGHT JOIN is going to take everything from the employee salary table but if there is not a match in the employee demographics, it will just have nulls (populates with nulls)
-- Here, we are doing Right join that is why from right table it will take everything and if employee id does not match with left table, it will have nulls (populates with nulls)

-- SELF JOIN --> It is a join where you tie the table to itself

SELECT * 
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

-- Simplifying this
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_id,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

-- JOINING MULTIPLE TABLES TOGETHER

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON  pd.department_id = sal.dept_id
;

-- PARKS DEPARTMENTS is for reference. It may not have many columns/rows like other tables
-- This department does not have any duplicates id like employee salary table 
-- This way we can tie all tables (employee_demographics to employee_salary to parks_departments) even if employee_demographics table does not have common column but employee salary table has common column


SELECT *
FROM parks_departments;
