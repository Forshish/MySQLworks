use mysql_demo;

-- Create the table
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    quantity INT,
    sale_date DATE
);

-- Insert sample data
INSERT INTO sales (product_id, quantity, sale_date) VALUES
    (1, 5, '2023-08-01'),
    (1, 3, '2023-08-02'),
    (2, 7, '2023-08-01'),
    (2, 4, '2023-08-03'),
    (3, 10, '2023-08-02');

-- Aggregate Functions
SELECT SUM(quantity) AS total_quantity FROM sales;

SELECT AVG(quantity) AS average_quantity FROM sales;

SELECT count(quantity) AS TOTAL_COUNT FROM sales;

SELECT MIN(quantity) AS min_quantity FROM sales;

SELECT MAX(quantity) AS max_quantity FROM sales;

-- Mathematical Functions

-- Create the data table
CREATE TABLE data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL(10, 4),
    quantity INT,
    column1 INT,
    column2 INT
);

-- Insert sample data
INSERT INTO data (price, quantity, column1, column2) VALUES
    (10.0000, 5, 10, 15),
    (20.5034, 3, 20, 8),
    (15.7522, 8, 5, 12),
    (5.252, 2, 8, 20),
    (25.9999, 10, 25, 18);

select * from data; 

-- Round the price to two decimal places
SELECT price, ROUND(price, 2) AS rounded_price
FROM data;

-- Find the absolute difference between column1 and column2
SELECT price, column2, ABS(price - column2) AS absolute_difference
FROM data;

-- Calculate the square root of the quantity
SELECT quantity, SQRT(quantity) AS sqrt_quantity
FROM data;

-- Calculate the power of column1 raised to column2
SELECT column1, column2, POWER(column1, column2) AS power_result
FROM data;

-- Find the remainder when dividing column2 by 3
SELECT column2, MOD(column2, 3) AS remainder
FROM data;

-- The CEIL function returns the smallest integer greater than or equal to a given number. The FLOOR function returns the largest integer less than or equal to a given number.
-- Example using CEIL function
SELECT price, CEIL(price) AS ceil_price
FROM data;

-- Example using FLOOR function
SELECT price, FLOOR(price) AS floor_price
FROM data;


-- Date and time functions 

-- Create the datetime_data table
CREATE TABLE datetime_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(50),
    event_date DATETIME
);

-- Insert sample data
INSERT INTO datetime_data (event_name, event_date) VALUES
    ('Event A', '2023-08-15 09:00:00'),
    ('Event B', '2023-08-17 13:30:00'),
    ('Event C', '2023-08-16 10:15:00'),
    ('Event D', '2023-08-15 14:00:00'),
    ('Event E', '2023-08-18 11:45:00');

select * from datetime_data;

-- Example 1: Extract year from event_date
SELECT event_name, event_date, YEAR(event_date) AS event_year
FROM datetime_data;

-- Example 2: Calculate difference in days between two event dates
SELECT event_name, event_date,
       DATEDIFF('2023-08-20', event_date) AS days_until_aug_20
FROM datetime_data;

-- Example 3: Add 3 hours to event_date
SELECT event_name, event_date, 
       DATE_ADD(event_date, INTERVAL 3 HOUR) AS updated_event_date
FROM datetime_data;

-- Example 4: Format event_date in a different way
SELECT event_name, event_date, 
       DATE_FORMAT(event_date, '%Y-%m-%d %h:%i %p') AS formatted_event_date
FROM datetime_data;

-- Example 5: Find the earliest and latest event dates
SELECT MIN(event_date) AS earliest_event_date,
       MAX(event_date) AS latest_event_date
FROM datetime_data;

-- Example 6: Extract month from event_date
SELECT event_name, event_date, MONTH(event_date) AS event_month
FROM datetime_data;

-- Example 7: Extract day of the week from event_date (1 = Sunday, 2 = Monday, ...)
SELECT event_name, event_date, DAYOFWEEK(event_date) AS day_of_week
FROM datetime_data;

-- Example 8: Calculate the number of months between two dates
SELECT event_name, event_date,
       TIMESTAMPDIFF(MONTH, event_date, '2023-09-01') AS months_until_sep_1
FROM datetime_data;

-- Example 9: Get the current date and time

-- Retrieve the current date
SELECT CURDATE() AS todays_date;

-- Retrieve the current time
SELECT CURTIME() AS curr_time;

-- Extras
-- Create the employees table
CREATE TABLE emp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50)
);

-- Insert sample data
INSERT INTO emp (first_name, last_name, department) VALUES
    ('John', 'Doe', 'HR'),
    ('Jane', 'Smith', 'IT'),
    ('Michael', 'Johnson', 'IT'),
    ('Emily', 'Williams', 'Finance'),
    ('Robert', 'Brown', 'Finance');

select * from emp;

-- Example using LIMIT to retrieve a limited number of rows
SELECT first_name, last_name
FROM emp
LIMIT 3;

-- Example using DISTINCT to retrieve unique department names
SELECT DISTINCT department
FROM emp;

-- Example using AS to create aliases for column names
SELECT first_name AS "First", last_name AS "Last"
FROM emp;

-- Example using UNION to combine results from two queries
SELECT first_name, last_name
FROM emp
WHERE department = 'HR'
UNION
SELECT first_name, last_name
FROM emp
WHERE department = 'IT';


