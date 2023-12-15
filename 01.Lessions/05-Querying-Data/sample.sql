
SELECT
   column_1, column_2, column_3,...,column_n
FROM
   table_name;

SELECT
   first_name, last_name, email
FROM
   customer;



SELECT 
   first_name || ' ' || last_name,
   email
FROM 
   customers;


SELECT first_name, last_name AS surname 
FROM customers;


SELECT c.first_name, c.last_name AS surname 
FROM customers AS c;


SELECT
    first_name || ' ' || last_name AS full_name
FROM
    customers;


SELECT *
FROM orders
WHERE order_date BETWEEN '2016-01-01' AND '2016-03-01';





SELECT
	column_1, column_2, column_3,...,column_n
FROM
	table_name
ORDER BY
	sort_expression1 [ASC | DESC],
        ...
	sort_expressionN [ASC | DESC];




SELECT first_name, last_name
FROM customer
ORDER BY
	first_name ASC;




 -- create a new table
CREATE TABLE sort_demo(
	num INT
);
-- insert some data
INSERT INTO sort_demo(num)
VALUES(1),(2),(3),(null); 



SELECT num
FROM sort_demo
ORDER BY num NULLS LAST;


SELECT num
FROM sort_demo
ORDER BY num DESC;




SELECT num
FROM sort_demo
ORDER BY 
    num DESC 
    NULLS LAST;



SELECT
   DISTINCT column1
FROM
   table_name;


SELECT
   DISTINCT column1, column2
FROM
   table_name;




SELECT
   DISTINCT ON (column1) column_alias,
   column2
FROM
   table_name
ORDER BY column1, column2;


CREATE TABLE distinct_demo (
	id serial NOT NULL PRIMARY KEY,
	bcolor VARCHAR,
	fcolor VARCHAR
);


INSERT INTO distinct_demo (bcolor, fcolor)
VALUES
	('red', 'red'),
	('red', 'red'),
	('red', NULL),
	(NULL, 'red'),
	('red', 'green'),
	('red', 'blue'),
	('green', 'red'),
	('green', 'blue'),
	('green', 'green'),
	('blue', 'red'),
	('blue', 'green'),
	('blue', 'blue');



   SELECT
	id,
	bcolor,
	fcolor
FROM
	distinct_demo ;


   SELECT
	DISTINCT bcolor
FROM
	distinct_demo
ORDER BY
	bcolor;



   SELECT
	DISTINCT bcolor,
	fcolor
FROM
	distinct_demo
ORDER BY
	bcolor,
	fcolor;




   SELECT
	DISTINCT ON (bcolor) bcolor,
	fcolor
FROM
	distinct_demo 
ORDER BY
	bcolor,
	fcolor;



--- GROUP WHERE

SELECT 
  discount, 
  COUNT(product_id) AS Total 
FROM products
WHERE discount > 3
GROUP BY discount
ORDER BY discount ASC

--- GROUPING SETS

SELECT 
    column1, column2, ..., aggregate_function(column)
FROM table
GROUP BY 
    GROUPING SETS (column1, column2, ..., ())


SELECT
    b.brand_name AS brand,
    c.category_name AS category,
    p.model_year,
    round(
        SUM (
            i.quantity * i.price * (1 - i.discount)
        ),
        0
    ) sales INTO sales_summary
FROM
    order_items i
INNER JOIN products p ON p.product_id = i.product_id
INNER JOIN brands b ON b.brand_id = p.brand_id
INNER JOIN categories c ON c.category_id = p.category_id
GROUP BY
    b.brand_name,
    c.category_name,
    p.model_year
ORDER BY
    b.brand_name,
    c.category_name,
    p.model_year;


SELECT
    brand,
    category,
    SUM (sales) sales
FROM
    sales_summary
GROUP BY
    brand, category
ORDER BY
    brand, category;


SELECT
    brand,
    SUM (sales) sales
FROM sales_summary
GROUP BY brand
ORDER BY brand;


SELECT
    category,
    SUM (sales) sales
FROM sales_summary
GROUP BY category
ORDER BY category;



SELECT
    SUM (sales) sales
FROM
    sales_summary;

(brand, category)
(brand)
(category)
()

---- UNION
SELECT
    brand,
    category,
    SUM (sales) sales
FROM
   sales_summary
GROUP BY
    brand,
    category
UNION ALL
SELECT
    brand,
    NULL,
    SUM (sales) sales
FROM
   sales_summary
GROUP BY
    brand
UNION ALL
SELECT
    NULL,
    category,
    SUM (sales) sales
FROM
   sales_summary
GROUP BY
    category
UNION ALL
SELECT
    NULL,
    NULL,
    SUM (sales)
FROM
   sales_summary
ORDER BY brand, category;

----

--- FIX UNION

SELECT
	brand,
	category,
	SUM (sales) sales
FROM
	sales_summary
GROUP BY
	GROUPING SETS (
		(brand, category),
		(brand),
		(category),
		()
	)
ORDER BY
	brand, category;


SELECT
    GROUPING(brand) grouping_brand,
    GROUPING(category) grouping_category,
    brand,
    category,
    SUM (sales) sales
FROM
    sales_summary
GROUP BY
    GROUPING SETS (
        (brand, category),
        (brand),
        (category),
        ()
    )
ORDER BY
    brand,
    category;

--- Giá trị trong cột grouping_brand cho biết hàng có được tổng hợp hay không, 
--- 1 nghĩa là số tiền bán hàng được tổng hợp theo thương hiệu, 
--- 0 có nghĩa là số tiền bán hàng không được tổng hợp theo thương hiệu. 
--- Khái niệm tương tự được áp dụng cho cột grouping_category.


--- CUBE


SELECT
    d1,
    d2,
    d3,
    aggregate_function (c4)
FROM
    table_name
GROUP BY
    GROUPING SETS (
        (d1,d2,d3), 
        (d1,d2),
        (d1,d3),
        (d2,d3),
        (d1),
        (d2),
        (d3), 
        ()
     );

SELECT
    d1,
    d2,
    d3,
    aggregate_function (c4)
FROM
    table_name
GROUP BY
    CUBE (d1, d2, d3); 


SELECT
    brand,
    category,
    SUM (sales) sales
FROM
    sales_summary
GROUP BY
    CUBE(brand, category)
ORDER BY
	brand,
	category;


(d1, d2, d3)
(d1, d2)
(d2, d3)
(d1, d3)
(d1)
(d2)
(d3)
()

(d1, d2, d3)
(d1, d2)
(d1)
()

SELECT
    d1,
    d2,
    d3,
    aggregate_function(c4)
FROM
    table_name
GROUP BY
    ROLLUP (d1, d2, d3);



SELECT
 	GROUPING(brand) g_brand,
    GROUPING(category) g_category,
    brand,
    category,
    SUM (sales) sales
FROM
    sales_summary
GROUP BY
    ROLLUP(brand, category);




column_name type GENERATED { ALWAYS | BY DEFAULT } AS IDENTITY[ ( sequence_option ) ]


