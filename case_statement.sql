use sql_class_4;

-- Create the products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10, 2),
    quantity_in_stock INT
);
-- Insert some sample data into the products table
INSERT INTO products (product_name, price, quantity_in_stock)
VALUES
    ('Product A', 25.99, 50),
    ('Product B', 75.50, 30),
    ('Product C', 120.00, 10),
    ('Product D', 10.49, 100),
    ('Product E', 200.00, 5),
    ('Product F', 60.75, 20);

Select * from products;

/*
A CASE statement in MySQL is a powerful conditional expression that allows you to perform conditional logic within your SQL queries. It's often used to create custom calculated columns, aggregate data based on certain conditions, or control the flow of the query. Let's explore a real-life example to illustrate how you can use a CASE statement in MySQL.

Example: Categorizing Products

Suppose you have a database table called products that contains information about various products, including their names, prices, and quantities in stock. You want to categorize these products into different price ranges (e.g., "Low," "Medium," and "High") based on their prices. You also want to calculate the total value of products in each category.

Here's how you can achieve this using a CASE statement:
*/

SELECT
    CASE
        WHEN price <= 50 THEN 'Low'
        WHEN price <= 100 THEN 'Medium'
        ELSE 'High'
    END AS price_category,
    COUNT(*) AS product_count,
    SUM(price) AS total_price
FROM
    products
GROUP BY
    price_category;

/*
In this SQL query:

We use the CASE statement to categorize products based on their prices. If the price is less than or equal to 50, we label it as "Low"; if it's less than or equal to 100, we label it as "Medium"; otherwise, it's labeled as "High."

We calculate the count of products in each category using the COUNT(*) function.

We calculate the total price of products in each category using the SUM(price) function.

We group the results by the price_category column to obtain the counts and total prices for each price category.

The result of this query will give you a breakdown of your products into different price categories and provide information about the number of products and the total value of products in each category.
*/

-- EXAMPLE 2

/*
Employee Bonus Calculation:Suppose you have an employees table with information about employees, including their names, salaries, and years of service. 
You want to categorize employees into different bonus tiers based on their years of service and calculate the bonus for each employee accordingly.

Here's how you can use a CASE statement to achieve this:
*/

-- Create the employees table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(255),
    salary DECIMAL(10, 2),
    years_of_service INT
);
-- Insert some sample data into the employees table
INSERT INTO employees (employee_name, salary, years_of_service)
VALUES
    ('John Doe', 60000.00, 3),
    ('Jane Smith', 75000.00, 7),
    ('Bob Johnson', 85000.00, 12),
    ('Alice Brown', 100000.00, 18);

Select * from employees;

SELECT
    employee_id,
    employee_name,
    years_of_service,
    CASE
        WHEN years_of_service < 5 THEN 0
        WHEN years_of_service >= 5 AND years_of_service < 10 THEN 500
        WHEN years_of_service >= 10 AND years_of_service < 15 THEN 1000
        ELSE 2000
    END AS bonus_amount
FROM
    employees;
    
/*
In this SQL query:

We use the CASE statement to categorize employees into different bonus tiers based on their years of service. Employees with less than 5 years of service receive no bonus, those with 5 to 9 years receive a $500 bonus, those with 10 to 14 years receive a $1,000 bonus, and those with 15 or more years receive a $2,000 bonus.

We select the employee_id, employee_name, and years_of_service columns from the employees table.

We calculate the bonus_amount for each employee using the CASE statement.

The result of this query will provide you with a list of employees, their years of service, and the corresponding bonus amounts based on the defined criteria.
*/

-- Example 3:

-- Create the orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    shipping_method VARCHAR(255)
);

-- Insert some sample data into the orders table
INSERT INTO orders (order_date, total_amount, shipping_method)
VALUES
    ('2023-09-01', 150.00, 'Standard'),
    ('2023-09-02', 200.00, 'Express'),
    ('2023-09-03', 75.00, 'Standard'),
    ('2023-09-04', 300.00, 'Express'),
    ('2023-09-05', 50.00, 'Economy');

Select * from orders;

-- let's use the CASE statement with values to calculate the shipping cost for orders based on the shipping method chosen by customers:

SELECT
    order_id,
    order_date,
    total_amount,
    shipping_method,
    CASE shipping_method
        WHEN 'Standard' THEN total_amount * 0.1
        WHEN 'Express' THEN total_amount * 0.2
        ELSE total_amount * 0.05
    END AS shipping_cost
FROM
    orders;

/*
In this query:

We use the CASE statement with values to calculate the shipping cost for each order based on the shipping method chosen by customers. For 'Standard' shipping, we charge 10% of the total amount, for 'Express' shipping, we charge 20%, and for any other shipping method (in this case, 'Economy'), we charge 5%.
The result of this query will provide you with a list of orders, their shipping methods, and the calculated shipping cost for each order.

*/
