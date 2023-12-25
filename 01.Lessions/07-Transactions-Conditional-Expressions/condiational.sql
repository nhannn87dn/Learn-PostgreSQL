

CASE WHEN condition THEN result
     [WHEN ...]
     [ELSE default_result]
END



CASE expression
    WHEN value THEN result
    [WHEN ...]
    [ELSE default_result]
END

SELECT first_name,
       last_name,
       CASE
           WHEN gender = 0 THEN 'Female'
           WHEN gender = 1 THEN 'Male'
       END sex
FROM staffs
ORDER BY first_name;





SELECT
    CASE order_status
        WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Processing'
        WHEN 3 THEN 'Rejected'
        WHEN 4 THEN 'Completed'
    END AS order_status,
    COUNT(order_id) AS order_count
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2018
GROUP BY order_status;



COALESCE(expression1, expression2, ...)

SELECT 
    COALESCE(NULL, 'Hi', 'Hello', NULL) result;


SELECT 
    store_name, 
    COALESCE(phone,'N/A') phone
FROM stores
ORDER BY store_name;


NULLIF(expression1, expression2)

SELECT NULLIF (1, 1); -- return NULL
SELECT NULLIF (1, 0); -- return 1



CREATE TABLE posts (
  id serial primary key,
	title VARCHAR (255) NOT NULL,
	desc VARCHAR (150),
	body TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP
);


INSERT INTO posts 
      (title, desc, body)
VALUES
      ('test post 1','test post desc 1','test post body 1'),
      ('test post 2','','test post body 2'),
      ('test post 3', null ,'test post body 3');


SELECT
	id,
	title,
	COALESCE (
		NULLIF (desc, ''), --  1 | 0
		LEFT (body, 40) -- 1
	)
FROM
	posts;


CAST(expression AS data_type)


SELECT CAST('123' AS INTEGER) AS result;
SELECT CAST(3.14 AS INTEGER) AS result;
SELECT CAST('2021-12-31' AS DATE) AS result;


SELECT 
   CAST('true' AS BOOLEAN),
   CAST('false' as BOOLEAN),
   CAST('T' as BOOLEAN),
   CAST('F' as BOOLEAN);


   