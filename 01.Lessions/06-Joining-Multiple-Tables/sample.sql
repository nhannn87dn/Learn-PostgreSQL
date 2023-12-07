-- Sample data for the "employees" table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    department_id INT
);

INSERT INTO employees (employee_id, name, department_id)
VALUES (1, 'John Smith', 1),
       (2, 'Jane Doe', 2),
       (3, 'Bob Johnson', NULL);

-- Sample data for the "departments" table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(255)
);

INSERT INTO departments (department_id, department_name)
VALUES (1, 'IT'),
       (2, 'HR'),
       (3, 'Marketing');

-- Inner join the "employees" and "departments" tables

SELECT e.name, d.department_name
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id
WHERE  d.department_id IS NULL;

SELECT e.name, d.department_name
FROM employees AS e
RIGHT JOIN departments AS d
ON e.department_id = d.department_id

SELECT e.name, d.department_name
FROM employees AS e
FULL JOIN departments AS d
ON e.department_id = d.department_id


-- SELFT JOIN

SELECT t1.column1, t1.column2, ...
FROM table_name t1
INNER JOIN table_name t2 ON t1.column = t2.column;



CREATE TABLE employee (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	manager_id INT,
	FOREIGN KEY (manager_id) 
	REFERENCES employee (employee_id) 
	ON DELETE CASCADE
);

INSERT INTO employee (
	employee_id, first_name, last_name, manager_id
)
VALUES
	(1, 'Windy', 'Hays', NULL),
	(2, 'Ava', 'Christensen', 1),
	(3, 'Hassan', 'Conner', 1),
	(4, 'Anna', 'Reeves', 2),
	(5, 'Sau', 'Norman', 2),
	(6, 'Kelsie', 'Hays', 3),
	(7, 'Tory', 'Goff', 3),
	(8, 'Salley', 'Lester', 3);



SELECT
    e.first_name || ' ' || e.last_name AS employee,
    m .first_name || ' ' || m .last_name AS manager
FROM
    employee e
LEFT JOIN employee m ON m .employee_id = e.manager_id
ORDER BY manager;


SELECT
   customer_id
FROM
   payment
GROUP BY
   customer_id;


SELECT
	customer_id, SUM (amount)
FROM
	payment
GROUP BY
	customer_id;

SELECT
	first_name || ' ' || last_name full_name,
	SUM (amount) amount
FROM
	payment
INNER JOIN customer USING (customer_id)    	
GROUP BY
	full_name
ORDER BY amount DESC;	




SELECT
	first_name || ' ' || last_name full_name,
	SUM (amount) AS amount
FROM
	payment
INNER JOIN customer USING (customer_id)    	
GROUP BY
	full_name
HAVING SUM (amount) > 180
ORDER BY amount DESC;



-- Cú pháp sử dụng UNION trong PostgreSQL như sau

SELECT column1, column2, ... FROM table1
UNION
SELECT column1, column2, ...FROM table2;




SELECT Name, Address FROM Customers
UNION
SELECT Name, Address FROM Suppliers;



DROP TABLE IF EXISTS top_rated_films;
CREATE TABLE top_rated_films(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

DROP TABLE IF EXISTS most_popular_films;
CREATE TABLE most_popular_films(
	title VARCHAR NOT NULL,
	release_year SMALLINT
);

INSERT INTO 
   top_rated_films(title,release_year)
VALUES
   ('The Shawshank Redemption',1994),
   ('The Godfather',1972),
   ('12 Angry Men',1957);

INSERT INTO 
   most_popular_films(title,release_year)
VALUES
   ('An American Pickle',2020),
   ('The Godfather',1972),
   ('Greyhound',2020);


SELECT * FROM top_rated_films
UNION
SELECT * FROM most_popular_films;


