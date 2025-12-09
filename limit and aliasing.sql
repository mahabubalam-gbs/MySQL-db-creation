-- LIMIT & ALIASING

SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC
LIMIT 3
;

-- LIMIT 2, 1 --> START AT POSITION 2 AND SELECTING 1 ROW AFTER
SELECT * 
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;

-- ALIASING 

SELECT gender, AVG(age) AS avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40
;

-- NOT NECESSARY TO MENTION "AS" --> The benefit is that we don't have to call AVG function in HAVING CLAUSE

SELECT gender, AVG(age) avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40
;
