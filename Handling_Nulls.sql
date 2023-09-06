use mysql_demo;
-- Create the table with NULL and NOT NULL constraints
CREATE TABLE cust (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE
);

-- Insert data with NULL and NOT NULL values
INSERT INTO cust (first_name, last_name, email, phone) VALUES
    ('John', 'Doe', 'john@example.com', '123-456-7890'),
    ('Jane', 'Smith', NULL, '987-654-3210'),
    ('Michael', 'Johnson', 'michael@example.com', NULL),
    ('Emily', NULL, 'emily@example.com', '555-123-4567'),
    ('Robert', 'Williams', 'robert@example.com', '111-222-3333');

Select * from cust;

-- Query for records with NULL values
-- Find customers with no last name
SELECT * FROM cust WHERE last_name IS NULL;

-- Query for records with NOT NULL values
-- Find customers with email addresses
SELECT * FROM cust WHERE email IS NOT NULL;

-- Query for records with NOT NULL values
-- Find customers with phone numbers
SELECT * FROM cust WHERE phone IS NOT NULL;
