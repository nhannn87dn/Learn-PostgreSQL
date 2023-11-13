
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
   customer;


SELECT first_name, last_name AS surname 
FROM customer;


SELECT
    first_name || ' ' || last_name AS full_name
FROM
    customer;



SELECT
	column_1, column_2, column_3,...,column_n
FROM
	table_name
ORDER BY
	sort_expression1 [ASC | DESC],
        ...
	sort_expressionN [ASC | DESC];




SELECT
	first_name, last_name
FROM
	customer
ORDER BY
	first_name ASC,
	last_name DESC;



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

