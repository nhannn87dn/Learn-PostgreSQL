--First, create a view that returns all cities with the name starting with the letter A.
CREATE VIEW city_a AS SELECT
	city_id,
	city,
	country_id
FROM
	city
WHERE
	city LIKE 'A%';

SELECT * FROM city_a
--The city_a view does not have the WITH CHECK OPTION clause.
INSERT INTO city_a (city, country_id)
VALUES
	('Houston', 103);

SELECT * FROM city

	
CREATE
OR REPLACE VIEW city_a_usa AS SELECT
	city_id,
	city,
	country_id
FROM
	city_a --View khác
WHERE
	country_id = 103 
WITH CASCADED CHECK OPTION;
-- The city_a_usa view has the WITH CASCADED CHECK OPTION clause.


INSERT INTO city_a_usa (city, country_id)
VALUES
	('Houston', 103);
	
	

CREATE OR REPLACE VIEW city_a_usa AS SELECT
	city_id,
	city,
	country_id
FROM
	city_a
WHERE
	country_id = 103 
WITH LOCAL CHECK OPTION;


SELECT * FROM city_a_usa


