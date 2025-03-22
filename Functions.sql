-- MATH FUNCTIONS
SELECT ROUND(3.123,2); -- ROUND FUNCTION IS USED TO 2 DECIMAL PLACES
SELECT ROUND(3.5,0) -- OUTPUT IS 4
SELECT TRUNCATE (4.234,2); -- OUTPUT IS 4.23
-- CEILING,ABS,FLOOR,RAND -- THESE ARE FUNCTIONS MYSQL NUMERIC FUNCTIONS
SELECT LENGTH('HELLO');
SELECT LOWER('HELLO');
SELECT UPPER('hello');
-- STRING FUNCTIONS
SELECT RTRIM(" HELLO "); -- REMOVE FROM RIGHT 
SELECT LTRIM(" HELLO "); -- REMOVE FROM LEFT --CHECK USING LENGTH FUNCTION
SELECT TRIM(" HELLO "); -- REMOVE FROM BOTH LEFT AND RIGHT 
SELECT LEFT("HELLO",3); -- GET 3 LENGTH SUBSTRING FROM LEFT 
SELECT RIGHT("HELLO",3);-- SUBSTRING FROM RIGHT
SELECT SUBSTRING("HELLO",2,3)-- SUBSTRING STARTING POS AND NUMBER OF CHARACTERS
SELECT LOCATE("I","I AM MOHIT HELLO") -- ARG 1) SUBSTRING THAT WE WANT TO FIND 2) SUBSTRING INDEX STARTING FROM 1 IF FOUND ELSE RETURN 0 FIND ANY SUBSTRING
SELECT REPLACE("STRING ","STRING THAT WE WANT TO REPLACE","WITH WHICH WE WANT TO REPLACE");
SELECT REPLACE("STRING ","STR","STRING");-- REPLACE STR WITH STRING
SELECT CONCAT("LEFT ","STRING ","RIGHT")-- CONCATINATE N STRINGS
-- EX->
SELECT concat(address," ",city," ",state)as address
from customers;
-- DATE 
SELECT NOW() AS `CURRENT_DATE`; -- GET DATE AND TIME

SELECT NOW(),curdate(),CURTIME(),year(curdate()),month(current_date()),monthname(CURDATE()),current_date(),day(now()),hour(curtime()),minute(curtime()),second(curtime()),dayname(now()),dayofmonth(now());       
-- DATE CURDATE()===CURRENT_DATE(),YEAR(CURDATE()),MONTH,DAY,MONTHNAME
-- TIME HOUR(),MINUTE,SECOND
-- GET DATE IN DIFFERENT FORM
SELECT date_format(NOW(),'%Y'); -- "get year 2025"
SELECT date_format(NOW(),'%M'); -- "get month as march"
SELECT date_format(NOW(),'%D'); -- "get day as 22nd"
SELECT date_format(NOW(),'%y'); -- "get year 25"
SELECT date_format(NOW(),'%m'); -- "get month 03"
SELECT date_format(NOW(),'%d'); -- "get day as 22"
SELECT date_format(NOW(),'%D %M %Y');

--TIME FORMAT

SELECT TIME_FORMAT(NOW(),'%h:%i:%p'); -- hour minutes am/pm
select date_add(now(),interval 1 year); -- increase the year by one 
select date_sub(now(),interval 1 year);-- deacrease the year by one
select datediff(now(),'2025-03-01'); -- get difference bw dates

--  return first not null value as output
select coalesce(shipper_id,comments,"not assigned")
from orders;

select order_id,
		  if(year(order_date)+8>year(now()),'new orders','old orders') as order_history -- returns first value else return second value
          from orders;
-- Nested if statements

select order_id,
		  if(year(order_date)+8>year(now()),if(status=1,'pending','new orders'),'old orders') as order_history
          from orders;
-- USING IF AND GROUPBY
select name,sum(quantity) as total ,product_id,if(sum(quantity)>4,'large','small')
from order_items
join products using (product_id)
group by (product_id)

-- WE CAN ADD ANY NUMBER OF WHEN CLAUSE IN CASE STATEMENT AND ADD END STATEMENT AT LAST ***** TO CLOSE THE CASE
SELECT PRODUCT_ID,
				CASE
                WHEN UNIT_PRICE>2 THEN 'LARGE'
				WHEN UNIT_PRICE>1 AND UNIT_PRICE<=2 THEN 'MIDDLE'
                ELSE 'SMALL'
                END AS OUTPUT
FROM PRODUCTS;