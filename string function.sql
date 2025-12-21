-- String Functions
-- LENGTH(), UPPER(), LOWER(), TRIM(), LEFT(), RIGHT(), SUBSTRING(), REPLACE(), LOCATE(), CONCAT()


-- Length() is used to check the phone numbers

SELECT LENGTH('SKYFALL');

SELECT first_name, LENGTH(first_name) AS first_name_length
FROM employee_demographics;

SELECT first_name, LENGTH(first_name) AS first_name_length
FROM employee_demographics
ORDER BY 2;

-- UPPER() / LOWER()

SELECT UPPER('skyfall');
SELECT LOWER ('SKYFALL');

SELECT first_name, UPPER(first_name) AS upper_case, LOWER(first_name) AS lower_case
FROM employee_demographics;


-- TRIM() --> LEFT-TRIM --> LTRIM()/RIGHT-TRIM --> RTRIM()

SELECT TRIM('     SKYFALL    ');
SELECT LTRIM ('     SKY    ');
SELECT RTRIM('    SKY     ');

-- LEFT FUNCTION ---> How many characters do we want to select from the lefthand side
-- LEFT(column_name, length in number) --> (first_name, 4)

SELECT first_name, LEFT(first_name, 4)
FROM employee_demographics;


-- RIGHT FUNCTION ---> How many characters do we want to select from the righthand side
--  RIGHT(column_name, length in number)


SELECT first_name, RIGHT(first_name, 4)
FROM employee_demographics;


-- SUBSTRING() --> extremly usefull function
-- SUBSTRING(column_name,start postion, how many characters we want) --> SUBTRING(first_name,3, 2)

SELECT first_name, 
SUBSTRING(first_name, 3)
FROM employee_demographics;

SELECT first_name, 
SUBSTRING(first_name, 3, 2)
FROM employee_demographics;

SELECT first_name,birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics;


-- REPLACE()
-- REPLACE(first_name, 'a', 'z') --> it will replace specific characters with different characters you want --> 'a' will be replaced by 'z'(small letter/capital letter)

SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;


-- LOCATE() --> looking for a character and returns the first position of the character;

SELECT LOCATE('a', "Mahabub");

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;


-- CONCAT() --> Concat multiple columns into a single column

SELECT first_name, last_name,
CONCAT(first_name, " " ,last_name) AS full_name
FROM employee_demographics;

