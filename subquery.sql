use sql_class_4;

CREATE TABLE employe (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(255),
    department VARCHAR(255),
    salary DECIMAL(10, 2)
);
INSERT INTO employe (employee_name, department, salary)
VALUES
    ('John Doe', 'HR', 50000.00),
    ('Alice Smith', 'Engineering', 60000.00),
    ('Bob Johnson', 'Engineering', 55000.00),
    ('Eve Brown', 'Finance', 48000.00),
    ('Charlie Brown', 'Finance', 52000.00),
    ('Grace Wilson', 'HR', 48000.00);

select * from employe;

-- Retrieve all employees whose salary is higher than the average salary.
SELECT employee_name, salary
FROM employe
WHERE salary > (SELECT AVG(salary) FROM employe);

-- Find all employees who work in departments with more than one employee.
SELECT employee_name, department
FROM employe
WHERE department IN 
(SELECT department 
 FROM employe
 GROUP BY department 
 HAVING COUNT(*) > 1);
 
-- Find employees whose salary is higher than the average salary in their respective departments.
SELECT employee_name, department, salary
FROM employe e
WHERE salary > (SELECT AVG(salary) FROM employe WHERE department = e.department);


-- Find all employees who work in departments with more than one employee.
SELECT employee_name, department
FROM employe
WHERE department IN (SELECT department FROM employees GROUP BY department HAVING COUNT(*) > 1);

-- Find departments that have at least one employee earning more than $55,000.

SELECT DISTINCT department
FROM employe d
WHERE EXISTS (SELECT 1 FROM employees WHERE department = d.department AND salary > 55000.00);

-- Find the employee(s) with the highest salary.
SELECT employee_name, salary
FROM employe
WHERE salary = (SELECT MAX(salary) FROM employe);

-- Highest Salary in Each Department:
SELECT department,MAX(salary) AS highest_salary
FROM employe
GROUP BY department;

-- Second Highest Salary in Each Department:
SELECT department,
       MAX(salary) AS second_highest_salary
FROM employe
WHERE (department, salary) NOT IN (
    SELECT department, MAX(salary) AS first_highest_salary
    FROM employe
    GROUP BY department
)
GROUP BY department;

-- Extras
drop table sample_table; 

CREATE TABLE sample_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    column1 VARCHAR(255),
    column2 INT
);
INSERT INTO sample_table (column1, column2)
VALUES
    ('A', 1),
    ('B', 2),
    ('C', 3),
    ('A', 1),
    ('B', 2),
    ('D', 4),
    ('E', 1);

select * from sample_table;

-- Find the Most Frequent Value in a Column, Along with Its Frequency Using a Subquery:
SELECT column2, count
FROM (
    SELECT column2, COUNT(*) AS count
    FROM sample_table
    GROUP BY column2
) subquery
ORDER BY count DESC
LIMIT 1;

-- Find Duplicate Values in 1 Column:
SELECT column1, COUNT(*) AS frequency
FROM sample_table
GROUP BY column1
HAVING COUNT(*) > 1;

-- Find Duplicate Values on 2 Columns Combination:
SELECT column1, column2, COUNT(*) AS frequency
FROM sample_table
GROUP BY column1, column2
HAVING COUNT(*) > 1;

/* Find Duplicate Values on all Columns Combination:
SELECT *
FROM your_table
GROUP BY column1, column2, ...  -- List all columns here
HAVING COUNT(*) > 1;
*/

-- How to Delete Duplicate Values:
SET SQL_SAFE_UPDATES = 0;

-- Create a temporary table to store the IDs of rows to be deleted
CREATE TEMPORARY TABLE temp_ids AS
    SELECT MIN(id) AS min_id
    FROM sample_table
    GROUP BY column1, column2;

select * from temp_ids;
 
-- Delete rows from the original table based on the temporary table
DELETE FROM sample_table
WHERE id NOT IN (SELECT min_id FROM temp_ids);

-- Drop the temporary table
DROP TEMPORARY TABLE temp_ids;

select * from sample_table;



