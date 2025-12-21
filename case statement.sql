-- Case Statements
-- Case statement allows you to use logic in your select statement

SELECT first_name,
last_name, age,
CASE
	WHEN age <=30 THEN "Young"
    WHEN age BETWEEN 31 and 50 THEN "Old"
    WHEN age >= 50 THEN "On Retirement"
END AS age_brakets
FROM employee_demographics;


-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- > Finance = 10% bonus

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary * 1.07
    WHEN salary = 50000 THEN salary
END AS new_salary
FROM employee_salary;

-- Now, how do we know who are in the "Finance" department --> We can do Multiple CASE Statements

SELECT * 
FROM employee_salary;
SELECT *
FROM parks_departments;

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary * 1.07
    WHEN salary = 50000 THEN salary
END AS new_salary,
CASE
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM employee_salary;