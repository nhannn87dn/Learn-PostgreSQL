INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);


INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...),
       (value1, value2, value3, ...),
       (value1, value2, value3, ...);


CREATE TABLE promotions (
    promotion_id INT SERIAL PRIMARY KEY ,
    promotion_name VARCHAR (255) NOT NULL,
    discount NUMERIC (4, 2) DEFAULT 0,
    start_date DATE NOT NULL,
    expired_date DATE NOT NULL
);


INSERT INTO promotions (
    promotion_name,
    discount,
    start_date,
    expired_date
)
VALUES
    (
      '2018 Summer Promotion',
      0.15,
      '20180601',
      '20180901'
    );
-- Lưu ý: không cần đưa promotion_id vào vì nó sẽ tự tăng


INSERT INTO dbo.promotions (
    promotion_name,
    discount,
    start_date,
    expired_date
)
VALUES
    (
      '2018 Summer Promotion',
      0.15,
      '20180601',
      '20180901'
    ),
     (
      '2018 Chrismats Promotion',
      2,
      '20181201',
      '20181230'
    );


---UNICODE

INSERT INTO my_table (unicode_column) 
    VALUES (E'Unicode string');

INSERT INTO links (url, name)
    VALUES('oreilly.com','O''Reilly Media');

INSERT 0 1

INSERT INTO table_name(column1, column2, …)
VALUES (value1, value2, …)
RETURNING id;


UPDATE table_name
SET column1 = value1,
    column2 = value2,
    ...
WHERE condition
RETURNING * | output_expression AS output_name;


DROP TABLE IF EXISTS courses;

CREATE TABLE courses(
	course_id serial primary key,
	course_name VARCHAR(255) NOT NULL,
	description VARCHAR(500),
	published_date date
);

INSERT INTO 
	courses(course_name, description, published_date)
VALUES
	('PostgreSQL for Developers','A complete PostgreSQL for Developers','2020-07-13'),
	('PostgreSQL Admininstration','A PostgreSQL Guide for DBA',NULL),
	('PostgreSQL High Performance',NULL,NULL),
	('PostgreSQL Bootcamp','Learn PostgreSQL via Bootcamp','2013-07-11'),
	('Mastering PostgreSQL','Mastering PostgreSQL in 21 Days','2012-06-30');


UPDATE courses
SET published_date = '2020-08-01' 
WHERE course_id = 3;

UPDATE courses
SET published_date = '2020-07-01'
WHERE course_id = 2
RETURNING *;

-----------------
CREATE TABLE product_segment (
    id SERIAL PRIMARY KEY,
    segment VARCHAR NOT NULL,
    discount NUMERIC (4, 2)
);


INSERT INTO 
    product_segment (segment, discount)
VALUES
    ('Grand Luxury', 0.05),
    ('Luxury', 0.06),
    ('Mass', 0.1);



CREATE TABLE product(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    price NUMERIC(10,2),
    net_price NUMERIC(10,2),
    segment_id INT NOT NULL,
    FOREIGN KEY(segment_id) REFERENCES product_segment(id)
);


INSERT INTO 
    product (name, price, segment_id) 
VALUES 
    ('diam', 804.89, 1),
    ('vestibulum aliquet', 228.55, 3),
    ('lacinia erat', 366.45, 2),
    ('scelerisque quam turpis', 145.33, 3),
    ('justo lacinia', 551.77, 2),
    ('ultrices mattis odio', 261.58, 3),
    ('hendrerit', 519.62, 2),
    ('in hac habitasse', 843.31, 1),
    ('orci eget orci', 254.18, 3),
    ('pellentesque', 427.78, 2),
    ('sit amet nunc', 936.29, 1),
    ('sed vestibulum', 910.34, 1),
    ('turpis eget', 208.33, 3),
    ('cursus vestibulum', 985.45, 1),
    ('orci nullam', 841.26, 1),
    ('est quam pharetra', 896.38, 1),
    ('posuere', 575.74, 2),
    ('ligula', 530.64, 2),
    ('convallis', 892.43, 1),
    ('nulla elit ac', 161.71, 3);


UPDATE 
    product AS p
SET 
    net_price = price - price * discount
FROM 
    product_segment AS ps
WHERE 
    p.segment_id = ps.id;



---//////ELETE

DELETE FROM table_name
WHERE condition
RETURNING (select_list | *)




DROP TABLE IF EXISTS links;

CREATE TABLE links (
    id serial PRIMARY KEY,
    url varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(255),
    rel varchar(10),
    last_update date DEFAULT now()
);

INSERT INTO  
   links 
VALUES 
   ('1', 'https://www.postgresqltutorial.com', 'PostgreSQL Tutorial', 'Learn PostgreSQL fast and easy', 'follow', '2013-06-02'),
   ('2', 'http://www.oreilly.com', 'O''Reilly Media', 'O''Reilly Media', 'nofollow', '2013-06-02'),
   ('3', 'http://www.google.com', 'Google', 'Google', 'nofollow', '2013-06-02'),
   ('4', 'http://www.yahoo.com', 'Yahoo', 'Yahoo', 'nofollow', '2013-06-02'),
   ('5', 'http://www.bing.com', 'Bing', 'Bing', 'nofollow', '2013-06-02'),
   ('6', 'http://www.facebook.com', 'Facebook', 'Facebook', 'nofollow', '2013-06-01'),
   ('7', 'https://www.tumblr.com/', 'Tumblr', 'Tumblr', 'nofollow', '2013-06-02'),
   ('8', 'http://www.postgresql.org', 'PostgreSQL', 'PostgreSQL', 'nofollow', '2013-06-02');


DELETE FROM links
WHERE id = 8
RETURNING *;

DELETE FROM links
WHERE id IN (6,5)
RETURNING *;

DELETE FROM links
WHERE id = 6 AND id = 5
RETURNING *;



DELETE FROM links;



SELECT *
FROM customers
WHERE phone LIKE '%478'