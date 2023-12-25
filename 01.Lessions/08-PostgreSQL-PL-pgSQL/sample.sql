do $$ 
<<simple_block>>
declare
  product_count integer := 0;
begin
   -- Đếm số lượng sản phẩm
   select count(*) 
   into product_count --đổ giá trị đếm được vào biến product_count
   from product;
   -- Hiển thị một message
   raise notice 'The number of products is %', product_count;
end simple_block $$;

variable_name data_type [:= expression];

do $$ 
declare
   counter    integer := 1;
   first_name varchar(50) := 'John';
   last_name  varchar(50) := 'Doe';
   payment    numeric(11,2) := 20.5;
begin 
   raise notice '% % % has been paid % USD', 
       counter, 
	   first_name, 
	   last_name, 
	   payment;
end $$;

variable_name table_name.column_name%type;
variable_name variable%type;


do $$ 
declare
   title products.product_name%type;
   title_custom title%type;
begin 
   -- get product_name of the product id 1
   select product_name
   from products
   into title
   where product_id = 1;
   
   -- show the title
   raise notice 'Product name id 1: %s', title;
end; $$



do $$ 
<<outer_block>>
declare
  counter integer := 0;
begin
   counter := counter + 1;
   raise notice 'The current value of the counter is %', counter;
	-- BEGIN SubBlock
   declare
       counter integer := 0;
   begin
       counter := counter + 10;
       raise notice 'Counter in the subblock is %', counter;
       raise notice 'Counter in the outer block is %', outer_block.counter;
   end; -- END SubBlock

   raise notice 'Counter in the outer block is %', counter;
   
end outer_block $$;

select select_list
into variable_name
from table_expression;


row_variable table_name%rowtype;
row_variable view_name%rowtype;

do $$
declare
   single_row categories%rowtype;
begin
   -- select category with id 1   
   select * 
   from categories
   into single_row
   where category_id = 1;

   -- show the number of actor
   raise notice 'The category name is % with ID %',
      single_row.category_name,
      single_row.category_id;
end; $$


do $$ 
declare
   rec record;
begin 
   -- get product_name of the product id 1
   select product_name, price
   from products
   into rec
   where product_id = 1;
   
   -- show the title
   raise notice 'Product name id 1: %s with price: %', 
   rec.product_name, 
   rec.price;
end $$;

variable_name [constant] data_type [:= expression];

do $$ 
begin 
  raise info 'information message %', now() ;
  raise log 'log message %', now();
  raise debug 'debug message %', now();
  raise warning 'warning message %', now();
  raise notice 'notice message %', now();
end $$;


do $$
declare 
   staff_count integer;
begin
   select count(*)
   into staff_count
   from staffs where email = 'abc@bikes.shop';
   -- Kiểm tra xem biến staff_count có lớn > 0 hay không
   -- Nếu không thõa, thì hiển thị message ERROR ở vế sau
   assert staff_count > 0, 'Staff not found, please check the staff email';
end $$;


if condition then
   statements;
end if;

do $$
declare 
   staff_count integer;
begin
   select count(*)
   into staff_count
   from staffs 
   where email = 'fabiola.jackson@bikes.shop';
   
   if staff_count > 0 then
     raise notice 'The staff with this email is exists';
   end if;
end $$;

if condition then
  statements_1;
else
  statements_2;
END if;


do $$
declare 
   staff_count integer;
begin
   select count(*)
   into staff_count
   from staffs 
   where email = 'fabiola.jackson@bikes.shop';
   
   if staff_count > 0 then
     raise notice 'The staff with this email is exists';
   else
   	 raise notice 'The staff is not found';
   end if;
end $$;



if condition_1 then
  statement_1;
elsif condition_2 then
  statement_2
...
elsif condition_n then
  statement_n;
else
  else-statement;
end if;



do $$ 
declare
   rec record;
begin 
   -- get product_name of the product id 195
   select product_name, discount
   from products
   into rec
   where product_id = 195;
   
   if rec.discount > 5 and rec.discount <= 10 then
      	raise notice 'Product name %s having discount level: LOWER', 
   			rec.product_name; 
	elsif rec.discount > 10 and rec.discount <= 20 then
		raise notice 'Product name %s having discount level: MIDDLE', 
   			rec.product_name;
	elsif rec.discount > 20 then
		raise notice 'Product name %s having discount level: HIGHT', 
   			rec.product_name;
	else
		raise notice 'Product name %s having discount level: LITTLE', 
   			rec.product_name;
	end if;
end $$;


case search-expression
   when expression_1 then
      statements_1
   when expression_2 then
      statements_2
  [ ... ]
  [else
      else-statements ]
END case;

case
   when boolean-expression-1 then
      statements_1
   when boolean-expression-2 then
      statements_2
   [... ]
  [ else
      statements ]
end case;



<<label>>
loop
   statements;
end loop;


do $$ 
<<loop_block>>
declare
    total integer := 0;
    i integer := 1;
begin
    loop
        --Dừng lại khi i > 10
        exit when i > 10; 
        -- Còn không thì thực hiện lệnh sau
        total := total + i;
        i := i + 1;
    end loop;
   -- In ra giá trị Total
   raise notice 'Total: %', total;
end loop_block $$;


[ <<label>> ]
while condition loop
   statements;
end loop;



do $$
declare 
   counter integer := 0;
begin
   while counter < 5 loop
      raise notice 'Counter %', counter;
	  counter := counter + 1;
   end loop;
end$$;


[ <<label>> ]
for loop_counter in [ reverse ] from.. to [ by step ] loop
    statements
end loop [ label ];



do $$
begin
   for counter in 1..5 loop
	raise notice 'Item: %', counter;
   end loop;
end; $$

do $$
begin 
  for counter in 1..6 by 2 loop
    raise notice 'Item: %', counter;
  end loop;
end; $$




[ <<label>> ]
for target in query loop
    statements
end loop [ label ];


do
$$
declare
    p record;
begin
    for p in select product_name, price 
	       from products 
	       order by product_name, price
	       limit 5 
    loop 
	raise notice '% - Price: %', p.product_name, p.price;
    end loop;
end;
$$

exit [label] [when boolean_expression]


exit when counter > 10;

<<block_label>>
BEGIN
    -- some code
    EXIT [block_label] [WHEN condition];
    -- some more code
END block_label;


continue [loop_label] [when condition]

do
$$
declare
   counter int = 0;
begin
  
  loop
     counter = counter + 1;
	 -- Thoái vòng lặp khi counter > 10
	 exit when counter > 10;
	 -- Nếu gặp số chẳn thì bỏ qua, lặp số tiếp theo
	 continue when mod(counter,2) = 0;
	 -- in ra giá trị số lẻ
	 raise notice '%', counter;
  end loop;
end;
$$


<<label>>
declare
begin
    statements;
exception
    when condition [or condition...] then
       handle_exception;
   [when condition [or condition...] then
       handle_exception;]
   [when others then
       handle_other_exceptions;
   ]
end;




do
$$
declare
    p record;
    --Không tồn tại ID này
    p_id integer := 9999999;
begin
   -- Lệnh truy vấn
   select product_name, price
   into strict  p
   from products 
   where product_id = p_id;
   --Bắt lỗi không tồn tại
	exception 
	   when no_data_found then 
	      raise exception 'Product ID: % not found', 
         p_id;
end;
$$

create [or replace] function function_name(param_list)
   returns return_type 
   language plpgsql
  as
$$
declare 
-- variable declaration
begin
 -- logic
end;
$$

create function get_product_count(bid int, cid int)
returns int
language plpgsql
as
$$
declare
   product_count integer;
begin
   select count(product_id) 
   into product_count
   from products
   where brand_id = bid AND category_id = cid;
   
   return product_count;
end;
$$;

--Sử dụng hàm
select get_product_count(9, 6);
select get_product_count(bid => 9, cid => 6);


create function get_categories()
returns table (
   cat_id integer,
   cat_name varchar,
   cat_desc varchar
)
language plpgsql
as
$$
begin
   return query
      select 
         category_id as cat_id, 
         category_name as cat_name, 
         description as cat_desc
      from categories;
end;
$$;


create function get_product_stat(
    out min_price numeric(18,2),
    out max_price numeric(18,2),
    out avg_len numeric(18,2)) 
language plpgsql
as $$
begin
  
  select min(price),
         max(price),
		 avg(price)::numeric(18,1)
  into min_price, max_price, avg_len
  from products;

end;$$

create or replace function swap(
	inout x int,
	inout y int
) 
language plpgsql	
as $$
begin
   select x,y into y,x;
end; $$;


select * from swap(10,20);

select * 
FROM get_product_stat();

select * 
from get_categories();

drop function [if exists] function_name(argument_list)
[cascade | restrict]

drop function swap;
-- Hoặc mô tả thêm kiểu dữ liệu các tham số
drop function swap(int, int);


