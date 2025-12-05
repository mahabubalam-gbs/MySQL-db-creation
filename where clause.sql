-- WHERE Clause --> FILTER ROW LEVEL

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE gender != "Female"
AND age > 50
;

-- LOGICAL OPERATORS -- AND OR NOT

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > "1985-01-01"
AND gender = "male"
;


SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > "1985-01-01"
OR gender = "male"
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > "1985-01-01"
OR NOT gender = "male"
;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55
;

-- LIKE Statement -- doesn't have to be exact match
-- % and _ (special characters/sequence) -- % means anything before/after string

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'Jerry'
;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'Jer%'
;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'Jer%'
;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%a%'
;

-- _ (underscore) one _ means one character // -- two underscore means two character after string

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a__'
;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a___%'
;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1989%'
;