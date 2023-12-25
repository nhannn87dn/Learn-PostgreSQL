create [or replace] procedure procedure_name(parameter_list)
language plpgsql
as $$
declare
-- variable declaration
begin
-- stored procedure body
end; $$


return;

drop table if exists accounts;

create table accounts (
    id int generated by default as identity,
    name varchar(100) not null,
    balance dec(15,2) not null,
    primary key(id)
);

insert into accounts(name,balance)
values('Bob',10000);

insert into accounts(name,balance)
values('Alice',10000);

create or replace procedure transfer(
   sender int,
   receiver int, 
   amount numeric
)
language plpgsql    
as $$
begin
    -- Trừ tiền của người gửi 
    update accounts 
    set balance = balance - amount 
    where id = sender;
    -- Cộng tiền cho người nhận
    update accounts 
    set balance = balance + amount 
    where id = receiver;

    commit; --xác nhận hoàn tất transaction
end;$$


call transfer(1,2,1000);

--Xóa một theo tên
drop procedure insert_actor;
--Xóa nhiều theo tên
drop procedure 
	delete_actor, 
	update_actor;
--Xóa theo tên và kiểu dữ liệu của tham số
drop procedure insert_actor(varchar,varchar);


CREATE FUNCTION trigger_function() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   -- trigger logic
END;
$$

CREATE TRIGGER trigger_name 
   {BEFORE | AFTER} { event } 
   ON table_name
   [FOR [EACH] { ROW | STATEMENT }]
       EXECUTE PROCEDURE trigger_function


CREATE OR REPLACE FUNCTION uft_update_product_stock()
RETURNS TRIGGER AS $$
BEGIN
    -- Cập nhật số lượng trong bảng stocks
    UPDATE stocks
    SET quantity = s.quantity - NEW.quantity
    FROM stocks AS s
    INNER JOIN orders AS o ON o.order_id = NEW.order_id 
        AND o.store_id = s.store_id
    WHERE s.product_id = NEW.product_id;
    
    RETURN NEW; -- Trả về bản ghi mới đã được chèn
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_order_items_update_stock
AFTER INSERT ON order_items
FOR EACH ROW
EXECUTE FUNCTION uft_update_product_stock();
