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


