
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  department_id INT
);

CREATE TABLE departments (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

-- Chèn dữ liệu vào bảng employees
INSERT INTO employees (name, department_id) VALUES ('Alice', 1);
INSERT INTO employees (name, department_id) VALUES ('Bob', 2);

SELECT *
FROM employees


CREATE VIEW view_A AS
SELECT *
FROM employees
WHERE department_id = 1;

-- Hiển thị dữ liệu từ view_A
SELECT * FROM view_A;

--Chèn Dữ liệu
INSERT INTO 