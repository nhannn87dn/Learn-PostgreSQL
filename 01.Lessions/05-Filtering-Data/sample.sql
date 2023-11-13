SELECT select_list
FROM table_name
WHERE condition
ORDER BY sort_expression


SELECT
	last_name,
	first_name
FROM
	customer
WHERE
	first_name = 'Jamie';



SELECT
	last_name,
	first_name
FROM
	customer
WHERE
	first_name = 'Jamie' AND last_name = 'Rice';

SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	last_name = 'Rodriguez' OR  first_name = 'Adam';

SELECT
	first_name,
	last_name
FROM
	customer
WHERE 
	first_name IN ('Ann','Anne','Annie');


SELECT
	first_name, last_name
FROM
	customer
WHERE 
	first_name LIKE 'Ann%'

SELECT 
	first_name, last_name
FROM 
	customer 
WHERE 
	first_name LIKE 'Bra%'
    AND last_name <> 'Motley';


SELECT first_name, last_name, address_id 
FROM customer 
WHERE address_id BETWEEN 100 AND 110;



-- LIMIT


SELECT
	film_id,title, release_year
FROM
	film
ORDER BY
	film_id
LIMIT 5 OFFSET 10;

SELECT film_id, title 
FROM film
ORDER BY title
FETCH FIRST 1 ROWS ONLY

SELECT
    film_id, title
FROM
    film
ORDER BY
    title 
OFFSET 5 ROWS 
FETCH FIRST 5 ROW ONLY; 


SELECT
	customer_id,rental_id, return_date
FROM
	rental
WHERE customer_id NOT IN (1, 2);


SELECT
	customer_id,payment_id,amount, payment_date
FROM
	payment
WHERE
	payment_date BETWEEN '2007-02-07' AND '2007-02-15';


CREATE TABLE contacts(
    id SERIAL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    PRIMARY KEY (id)
);


INSERT INTO contacts(first_name, last_name, email, phone)
VALUES ('John','Doe','john.doe@example.com',NULL),
    ('Lily','Bush','lily.bush@example.com','(408-234-2764)');


SELECT id, first_name, last_name,email, phone
FROM
    contacts
WHERE phone IS NOT NULL;


