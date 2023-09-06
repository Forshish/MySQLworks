use mysql_demo;

-- Step 1: Create the table
CREATE TABLE employes (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    years_of_experience INT
);

-- Step 2: Insert sample data
INSERT INTO employes (department, salary, years_of_experience) VALUES
    ('HR', 60000.00, 3),
    ('IT', 75000.00, 5),
    ('IT', 80000.00, 8),
    ('Sales', 55000.00, 2),
    ('Sales', 62000.00, 4);

Select * from employes;

-- Example1: Find average salary for each department
SELECT department, AVG(salary)
FROM employes
GROUP BY department;

-- Example2: Find average salary above $65000 for each department
SELECT department, AVG(salary) AS avg_salary
FROM employes
GROUP BY department
HAVING avg_salary > 65000.00;

-- Example3: Find average salary above $60000 for departments with more than one employee
SELECT department, AVG(salary) AS avg_salary
FROM employes
GROUP BY department
HAVING COUNT(employee_id) > 1 AND avg_salary > 60000.00;

-- Example4: Find average salary, number of employees for departments with avg_salary > $60000 and more than one employee
SELECT department, AVG(salary) AS avg_salary, COUNT(employee_id) AS num_employees
FROM employes
GROUP BY department
HAVING avg_salary > 60000.00 AND num_employees > 1;

-- Example with GROUP BY on two columns: Find average salary for each department and experience level
SELECT department, years_of_experience, AVG(salary) AS avg_salary
FROM employes
GROUP BY department, years_of_experience;

-- ORDER BY IN SQL

SELECT department
FROM employes
ORDER BY department DESC;

SELECT department, AVG(salary) AS avg_salary
FROM employes
GROUP BY department
ORDER BY department DESC;

SELECT department, AVG(salary) AS avg_salary, COUNT(employee_id) AS num_employees
FROM employes
GROUP BY department
HAVING num_employees > 1
ORDER BY department DESC;





