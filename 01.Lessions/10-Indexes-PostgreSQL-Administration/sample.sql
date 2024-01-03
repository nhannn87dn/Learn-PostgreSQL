
CREATE INDEX index_name ON table_name [USING method]
(
    column_name [ASC | DESC] [NULLS {FIRST | LAST }],
    ...
);

DROP INDEX  [ CONCURRENTLY]
[ IF EXISTS ]  index_name 
[ CASCADE | RESTRICT ];



SELECT
    tablename,indexname,indexdef
FROM
    pg_indexes
WHERE
    schemaname = 'public'
ORDER BY
    tablename, indexname;


SELECT
    indexname,indexdef
FROM
    pg_indexes
WHERE
    tablename = 'table_name';



CREATE UNIQUE INDEX index_name
ON table_name(column_name, [...]);


CREATE INDEX index_name 
ON table_name (expression);

CREATE INDEX index_name
ON table_name(column_list)
WHERE condition;

CREATE INDEX index_name
ON table_name(a,b,c,...);


EXPLAIN SELECT
    *
FROM
    people
WHERE
    last_name = 'Adams'
AND first_name = 'Lou';



CREATE INDEX idx_customers_first_name 
ON customers (first_name);

CREATE INDEX idx_customers_first_name_last_name 
ON customers (first_name, last_name);


CREATE UNIQUE INDEX uix_customers_email 
ON customers (email);


SELECT customer_id, first_name, last_name FROM customers 
WHERE last_name = 'purdy';

SELECT customer_id, first_name, last_name FROM customers 
WHERE LOWER(last_name) = 'purdy';

CREATE INDEX idx_ic_last_name
ON customers(LOWER(last_name));

SELECT * FROM staffs WHERE active = true


CREATE INDEX idx_customers_active
ON customers(active)
WHERE active = 1;

