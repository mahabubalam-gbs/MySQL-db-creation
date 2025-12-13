-- UNION
-- UNION allows to combine rows together from separate tables or from the same table
-- BY DEFAULT --> UNION is "UNION DISTINCT" where DISTINCT is goona take only "unique values". DISTINCT will remove all the duplicates
-- Use Multiple "SELECT STATEMENTS"

SELECT age, gender
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary
;

-- You just can join random data together. Rather, you need to combine the same data

SELECT first_name, last_name
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary
;

-- IF you want to show all common and uncommon data, you should use "UNION ALL"

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;


-- NOW try use case
-- Company may want to find out the oldest person to sack from the company or want to sake highest paid employees

SELECT first_name, last_name, "Old"
FROM employee_demographics
WHERE age > 50;

SELECT first_name, last_name, "Old" AS Label
FROM employee_demographics
WHERE age > 50
UNION
SELECT first_name, last_name, "Highly Paid Employees" AS Label
FROM employee_salary
WHERE salary > 70000
;

SELECT first_name, last_name, "Old Man" AS Label
FROM employee_demographics
WHERE age > 40 AND gender = "Male"
UNION
SELECT first_name, last_name, "Old Lady" AS Label
FROM employee_demographics
WHERE age > 40 AND gender = "Female"
UNION
SELECT first_name, last_name, "Highly Paid Employees" AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name
;
