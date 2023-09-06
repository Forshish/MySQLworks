use mysql_demo;
select * from employees_new;

-- Select all rows where the 'name' column starts with 'Joh'
SELECT * FROM employees_new where first_name LIKE 'Joh%';

-- Select all rows where the second letter in the 'first_name' column is 'a'
SELECT * FROM employees_new WHERE first_name LIKE '_a%';


-- Regular expressions 
-- Create the table
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    description TEXT
);

-- Insert sample data
INSERT INTO product (product_name, description) VALUES
    ('apple', 'Fresh and juicy apple.'),
    ('apples', 'Variety of apples available.'),
    ('banana', 'Yellow and delicious banana.'),
    ('orange', 'Sweet and tangy orange.'),
    ('pear', 'Juicy and ripe pear.'),
    ('grape', 'Bunch of grapes.'),
    ('applesauce', 'Homemade applesauce.'),
    ('kiwi', 'Tropical kiwi fruit.'),
    ('123', 'Number 123 for testing.'),
    ('Abc', 'Uppercase letters Abc.');

SELECT * from product;


-- Find products with names containing two or more consecutive 'a' characters using '+'
SELECT * FROM product WHERE product_name REGEXP 'a+';

-- Find products with names containing 'apple' followed by zero or more 's' characters using '*'
SELECT * FROM product WHERE product_name REGEXP 'apples*';

-- Find products with names containing exact one character between p and l
SELECT * FROM product WHERE product_name REGEXP 'ap.les';

-- Find products with names containing 'grape' or 'pear'
SELECT * FROM product WHERE product_name REGEXP 'grape|pear';

-- Find products with names starting with 'ki' and ending with 'i'
SELECT * FROM product WHERE product_name REGEXP '^ki.*i$';

-- Find products with names containing 'ban' followed by exactly one character using '.'
SELECT * FROM product WHERE product_name REGEXP 'ban.$';

-- Find products with names containing 'ora' followed by zero or one 'n' character using '?'
SELECT * FROM product WHERE product_name REGEXP 'ora?';

-- Find products with names containing 'app' or 'kiw'
SELECT * FROM product WHERE product_name REGEXP 'app|kiw';

-- Find products with names starting with 'a', 'b', or 'c' using character classes
SELECT * FROM product WHERE product_name REGEXP '^[abc]';

-- Find products with names NOT starting with 'a', 'b', or 'c' using negated character class
SELECT * FROM product WHERE product_name REGEXP '^[^abc]';

-- Find products with names starting with a letter
SELECT * FROM product WHERE product_name REGEXP '^[A-Z]';

-- Find products with names containing a digit
SELECT * FROM product WHERE product_name REGEXP '[0-9]';