---SUbQUERY

SELECT
  c.*, 
  (SELECT COUNT(product_id) 
        FROM products AS P 
        WHERE p.category_id = c.product_id) AS 'number_product'
FROM categories AS c


---Ví dụ, bạn có thể sử dụng subquery để tìm tất cả các khách hàng có đơn hàng
-- với tổng giá trị lớn hơn một ngưỡng nào đó

SELECT customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(order_amount) > 1000
)

--- Ví dụ: Lấy thông tin đơn hàng của tất cả khách hàng ở New York
SELECT
    order_id,
    order_date,
    customer_id
FROM
    orders
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            customers
        WHERE
            city = 'New York'
    )
ORDER BY
    order_date DESC;


-- ANY
expresion operator ANY(subquery)


SELECT
    product_name,price
FROM  products
WHERE
    -- Nếu price >= với bất kì giá trị nào
    -- trong kết quả SELECT thì WHERE thực thi
    price >= ANY (
        SELECT AVG (price) FROM products GROUP BY brand_id
);


--- Ví dụ: Lấy thông tin khách hàng, có đơn hàng mua vào năm 2017.

SELECT customer_id,first_name,last_name, city
FROM customers AS c
WHERE
    EXISTS (
        -- Đi tìm những khách hàng mua hàng năm 2017
        SELECT customer_id
        FROM orders AS o
        WHERE o.customer_id = c.customer_id AND YEAR (order_date) = 2017
    )
ORDER BY first_name, last_name;

--JOIN

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
    first_name, last_name
FROM staffs
UNION --Loại bỏ giá trị trùng lặp sau khi kết hợp
SELECT
    first_name, last_name
FROM
    customers;

--
SELECT
    first_name, last_name
FROM staffs
UNION ALL -- Giữ giá trị trùng lặp sau khi kết hợp
SELECT
    first_name, last_name
FROM
    customers;

-- Dựa vào đó bạn có thể: Lấy ra danh sách những sản phẩm ĐÃ được bán ra.
SELECT product_i 
    FROM products
INTERSECT
SELECT  product_id 
    FROM order_items;


-- Dựa vào đó bạn có thể: Lấy ra danh sách những sản phẩm CHƯA được bán ra

SELECT product_i FROM products
EXCEPT
SELECT  product_id FROM order_items;



WITH cte_name (column1, column2, ...)
AS (
    -- Truy vấn con
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition
)


SELECT *
FROM cte_name
WHERE condition;


-- Truy vấn và tạo bảng ảo

WITH cte_sales_amounts (staff, sales, year) AS (
    SELECT    
        first_name + ' ' + last_name, 
        SUM(quantity * price * (1 - discount)),
        YEAR(order_date)
    FROM    
        orders o
    INNER JOIN order_items i ON i.order_id = o.order_id
    INNER JOIN staffs s ON s.staff_id = o.staff_id
    GROUP BY 
        first_name + ' ' + last_name,
        year(order_date)
)
-- Câu lệnh SELECT thực hiện ngay sau CTE
SELECT staff, sales
FROM cte_sales_amounts
WHERE year = 2018;
