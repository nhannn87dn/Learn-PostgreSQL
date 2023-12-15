-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-foreign-key/

-- Quan hệ một-một (One-to-One Relationship)
-- https://launchschool.com/books/sql_first_edition/read/multi_tables#designingtables



CREATE TABLE table_example (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
  birthday DATE NULL,
  age INTEGER NULL,
  is_admin BOOLEAN NOT NULL DEFAULT True,
  roles TEXT [],
  uid uuid DEFAULT uuid_generate_v4 (),
	created_on TIMESTAMP NOT NULL,
  last_login TIMESTAMP DEFAULT NOW(),
  price NUMERIC(18,2) NOT NULL DEFAULT 0,
  sort SMALLINT NOT NULL DEFAULT 100
);


CREATE TABLE users (
  id serial,
  username VARCHAR(25) NOT NULL,
  enabled boolean DEFAULT TRUE,
  last_login timestamp NOT NULL DEFAULT NOW(),
  PRIMARY KEY (id)
);



CREATE TABLE addresses (
  user_id int NOT NULL,
  street VARCHAR(30) NOT NULL,
  city VARCHAR(30) NOT NULL,
  state VARCHAR(30) NOT NULL,
  PRIMARY KEY (user_id),
  CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users (id)
);

-- One-to-Many

CREATE TABLE books (
  id serial,
  title VARCHAR(100) NOT NULL,
  author VARCHAR(100) NOT NULL,
  published_date timestamp NOT NULL,
  isbn int,
  PRIMARY KEY (id),
  UNIQUE (isbn)
);

CREATE TABLE reviews (
  id serial,
  book_id int NOT NULL,
  user_id int NOT NULL,
  review_content VARCHAR(255),
  rating int,
  published_date timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);



CREATE TABLE users_books (
  user_id int NOT NULL,
  book_id int NOT NULL,
  checkout_date timestamp,
  return_date timestamp,
  PRIMARY KEY (user_id, book_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE,
  FOREIGN KEY (book_id) REFERENCES books(id) ON UPDATE CASCADE
);

-- ================ CONSTRAINT ========================//


DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
   customer_id INT GENERATED ALWAYS AS IDENTITY,
   customer_name VARCHAR(255) NOT NULL,
   PRIMARY KEY(customer_id)
);

CREATE TABLE contacts(
   contact_id INT GENERATED ALWAYS AS IDENTITY,
   customer_id INT,
   contact_name VARCHAR(255) NOT NULL,
   phone VARCHAR(15),
   email VARCHAR(100),
   PRIMARY KEY(contact_id),
   CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
	  REFERENCES customers(customer_id)
	  ON DELETE SET NULL -- OR:  CASCADE / RESTRICT
);

INSERT INTO customers(customer_name)
VALUES('BlueBird Inc'),
      ('Dolphin LLC');	   
	   
INSERT INTO contacts(customer_id, contact_name, phone, email)
VALUES(1,'John Doe','(408)-111-1234','john.doe@bluebird.dev'),
      (1,'Jane Doe','(408)-111-1235','jane.doe@bluebird.dev'),
      (2,'David Wright','(408)-222-1234','david.wright@dolphin.dev');


DELETE FROM customers WHERE customer_id = 1;



-- ========Add a foreign key constraint to an existing table=========================

ALTER TABLE child_table 
ADD CONSTRAINT constraint_name 
FOREIGN KEY (fk_columns) 
REFERENCES parent_table (parent_key_columns);



ALTER TABLE child_table
DROP CONSTRAINT constraint_fkey;


ALTER TABLE child_table
ADD CONSTRAINT constraint_fk
FOREIGN KEY (fk_columns)
REFERENCES parent_table(parent_key_columns)
ON DELETE CASCADE;


-- ============= check contraint ======

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR (50),
	last_name VARCHAR (50),
	birth_date DATE CHECK (birth_date > '1900-01-01'),
	joined_date DATE CHECK (joined_date > birth_date),
	salary numeric CONSTRAINT positive_salary CHECK(salary > 0) -- Đặt tên cho constraint check salary
);

INSERT INTO employees (first_name, last_name, 
birth_date, joined_date, salary)
VALUES ('John', 'Doe', '1972-01-01',
 '2015-07-01', - 100000);


CREATE TABLE prices_list (
	id serial PRIMARY KEY,
	product_id INT NOT NULL,
	price NUMERIC NOT NULL,
	discount NUMERIC NOT NULL,
	valid_from DATE NOT NULL,
	valid_to DATE NOT NULL
);



ALTER TABLE prices_list 
ADD CONSTRAINT price_discount_check 
CHECK (
	price > 0
	AND discount >= 0
	AND price > discount
);


ALTER TABLE prices_list 
ADD CONSTRAINT valid_range_check 
CHECK (valid_to >= valid_from);


ALTER TABLE employees 
ADD CONSTRAINT positive_salary
CHECK(salary > 0);


-- PostgreSQL UNIQUE constraint example

CREATE TABLE person (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR (50),
	last_name VARCHAR (50),
	email VARCHAR (50) UNIQUE
);

CREATE TABLE person (
	id SERIAL  PRIMARY KEY,
	first_name VARCHAR (50),
	last_name  VARCHAR (50),
	email      VARCHAR (50),
        UNIQUE(email)
);


INSERT INTO person(first_name,last_name,email)
VALUES('john','doe','j.doe@postgresqltutorial.com');

CREATE TABLE table (
    c1 data_type,
    c2 data_type,
    c3 data_type,
    UNIQUE (c2, c3)
);




CREATE TABLE equipment (
	id SERIAL PRIMARY KEY,
	name VARCHAR (50) NOT NULL,
	equip_id VARCHAR (16) NOT NULL
);

CREATE UNIQUE INDEX CONCURRENTLY equipment_equip_id 
ON equipment (equip_id);



ALTER TABLE equipment 
ADD CONSTRAINT unique_equip_id 
UNIQUE USING INDEX equipment_equip_id;

-- Declaring NOT NULL columns

CREATE TABLE invoices(
  id SERIAL PRIMARY KEY,
  product_id INT NOT NULL,
  qty numeric NOT NULL CHECK(qty > 0),
  net_price numeric CHECK(net_price > 0) 
);


ALTER TABLE table_name
ALTER COLUMN column_name_1 SET NOT NULL,
ALTER COLUMN column_name_2 SET NOT NULL,
...;


CREATE TABLE production_orders (
	id SERIAL PRIMARY KEY,
	description VARCHAR (40) NOT NULL,
	material_id VARCHAR (16),
	qty NUMERIC,
	start_date DATE,
	finish_date DATE
);


INSERT INTO production_orders (description)
VALUES('Make for Infosys inc.');


UPDATE production_orders
SET qty = 1;


ALTER TABLE production_orders 
ALTER COLUMN qty
SET NOT NULL;


CREATE TABLE users (
 id serial PRIMARY KEY,
 username VARCHAR (50),
 password VARCHAR (50),
 email VARCHAR (50),
 CONSTRAINT username_email_notnull CHECK (
   NOT (
     ( username IS NULL  OR  username = '' )
     AND
     ( email IS NULL  OR  email = '' )
   )
 )
);

