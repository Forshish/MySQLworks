use sql_class_4;

-- inner, left, right, full join 

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255)
);
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    sale_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_name, email)
VALUES
    ('John Doe', 'john@example.com'),
    ('Alice Smith', 'alice@example.com'),
    ('Bob Johnson', 'bob@example.com'),
    ('Eve Brown', 'eve@example.com');
INSERT INTO sales (customer_id, sale_date, total_amount)
VALUES
    (1, '2023-09-01', 150.00),
    (2, '2023-09-02', 200.00),
    (1, '2023-09-03', 75.00),
    (3, '2023-09-04', 300.00),
    (NULL, '2023-09-05', 50.00);

SELECT * FROM customers;
SELECT * FROM sales;
/*Inner Join:

An inner join returns only the rows that have matching values in both tables.
It filters out rows that don't have corresponding data in the other table.
*/

SELECT sales.sale_id, customers.customer_name, sales.total_amount
FROM sales
INNER JOIN customers ON sales.customer_id = customers.customer_id;

/*Left Join (or Left Outer Join):

A left join returns all rows from the left table (in this case, sales) and the matching rows from the right table (customers).
If there is no match, it returns NULL values for columns from the right table.
*/
SELECT sales.sale_id, customers.customer_name, sales.total_amount
FROM sales
LEFT JOIN customers ON sales.customer_id = customers.customer_id;

/*This query retrieves all sales, and if a sale has a corresponding customer, it includes the customer's name. 
If there is no match (e.g., for sales made by anonymous customers), it still includes the sale but with a NULL customer_name.

3. Right Join (or Right Outer Join):

A right join is similar to a left join but returns all rows from the right table (customers) and the matching rows from the left table (sales).
*/

SELECT sales.sale_id, customers.customer_name, sales.total_amount
FROM sales
RIGHT JOIN customers ON sales.customer_id = customers.customer_id;

/*This query retrieves all customers, and if a customer has made a sale, it includes the sale's information.
 If there is no match (e.g., for customers who haven't made any purchases), it still includes the customer but with NULL values for sale-related columns.

4. Full Join (or Full Outer Join):

MySQL doesn't support a standard FULL JOIN syntax directly. However, you can achieve the same result by combining a LEFT JOIN and a RIGHT JOIN with a UNION. Here's the corrected query to simulate a FULL JOIN:

*/
SELECT s.sale_id, c.customer_name, s.total_amount
FROM sales s
LEFT JOIN customers c ON s.customer_id = c.customer_id
UNION
SELECT s.sale_id, c.customer_name, s.total_amount
FROM sales s
RIGHT JOIN customers c ON s.customer_id = c.customer_id;

/*This query retrieves all sales and all customers. It includes sales and customer information when there is a match and fills in NULL values where there is no match (e.g., for customers without any sales and sales without associated customers).

In summary, these types of joins allow you to combine data from multiple tables based on the specified conditions, providing you with different subsets of data based on the relationships between the tables.


MySQL Self-Join:

A self-join is a type of SQL join where a table is joined with itself. 
It is often used when you have hierarchical or nested data within a single table.
For example, if you have a table of employees where each employee has a supervisor identified by their ID within the same table, you can perform a self-join to find relationships between employees and their supervisors.

Let's consider a simplified example of an employees table:
*/

CREATE TABLE employes (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    supervisor_id INT
);

INSERT INTO employes (employee_id, employee_name, supervisor_id)
VALUES
    (1, 'John', NULL),
    (2, 'Alice', 1),
    (3, 'Bob', 1),
    (4, 'Eve', 2);

select * from employes;

SELECT e.employee_name AS employee, s.employee_name AS supervisor
FROM employes e
LEFT JOIN employees s ON e.supervisor_id = s.employee_id;


/*
MySQL Cross Join:

A cross join (also known as a Cartesian join) combines all rows from one table with all rows from another table, resulting in a Cartesian product of the two tables.
Cross joins are rarely used in practice, but they can be useful in some specific scenarios like  You want to create a product catalog that includes all possible combinations of colors and sizes for your products.

Here's a basic example using two hypothetical tables, colors and sizes, to create a cross join:
*/

CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(255)
);

CREATE TABLE sizes (
    size_id INT PRIMARY KEY,
    size_name VARCHAR(255)
);

INSERT INTO colors (color_id, color_name)
VALUES (1, 'Red'), (2, 'Blue');

INSERT INTO sizes (size_id, size_name)
VALUES (1, 'Small'), (2, 'Large');

select * from colors;
select * from sizes;

SELECT c.color_name, s.size_name
FROM colors c
CROSS JOIN sizes s;
