DROP TABLE IF EXISTS accounts;

CREATE TABLE accounts (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    balance DEC(15,2) NOT NULL,
    PRIMARY KEY(id)
);


-- Bước 1:  start a transaction
BEGIN; -- or BEGIN TRAN

-- Bước 2:  Các câu lênh truy vấn bắt đầu ở đây INSERT, UPDATE, and DELETE

-- =====================
-- Chạy xong các câu lệnh trên thì bạn kết thúc TRANSACTION với 1 trong 2 hình thức.
-- =====================

-- Bước 3 -  1. commit the transaction
-- Để xác nhận thay đổi dữ liệu
COMMIT;

-- Bước 3 - 2. rollback -- Hồi lại những thay đổi trong những câu lệnh truy vấn ở trên. (Hủy ko thực hiện nữa, trả lại trạng thái ban đầu lúc chưa chạy)
ROLLBACK;


DROP TABLE IF EXISTS banks;

CREATE TABLE banks (
    id INT GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    balance DEC(15,2) NOT NULL,
    PRIMARY KEY(id)
);


INSERT INTO banks(name,balance)
VALUES('Bob',10000);

--Example Success

-- start a transaction
BEGIN;

-- insert a new row into the accounts table
INSERT INTO banks(name,balance)
VALUES('Alice',10000);

-- commit the change (or roll it back later)
COMMIT;


-- start a transaction
BEGIN;
-- deduct 1000 from account 1
UPDATE banks 
SET balance = balance - 1000
WHERE id = 1;
-- add 1000 to account 99
UPDATE banks
SET balance = balance + 1000
WHERE id = 99; 
-- commit the transaction
COMMIT;


--Example Fail

-- start a transaction
BEGIN;

-- deduct 1000 from account 1
UPDATE banks 
SET balance = balance - 1000
WHERE id = 1;

-- add 1000 to account 2
UPDATE banks
SET balance = balance + 1000
WHERE id = 99; 

-- select the data from accounts
SELECT id, name, balance
FROM banks;

-- commit the transaction
COMMIT;


-- ROLLBACK Example

-- begin the transaction
BEGIN;

-- deduct the amount from the account 1
UPDATE accounts 
SET balance = balance - 1500
WHERE id = 1;

-- add the amount from the account 3 (instead of 2)
UPDATE accounts
SET balance = balance + 1500
WHERE id = 3; 

-- roll back the transaction
ROLLBACK;

