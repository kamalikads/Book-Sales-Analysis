CREATE DATABASE BOOK;
use book;
select * from orders;

-- CONVERT DATATYPE TEXT TO DATE
UPDATE orders
SET Order_Date = str_to_date(Order_Date, '%d-%m-%Y');

ALTER TABLE orders
MODIFY Order_Date DATE;

desc orders;