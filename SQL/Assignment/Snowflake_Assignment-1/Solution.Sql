CREATE WAREHOUSE Sales WITH WAREHOUSE_SIZE = 'SMALL' 
WAREHOUSE_TYPE = 'STANDARD' AUTO_SUSPEND = 600 AUTO_RESUME = TRUE;
USE WAREHOUSE Sales;

CREATE DATABASE Sales;
USE DATABASE Sales;

//1. Load the given dataset into snowflake with a primary key to Order Date column.
CREATE OR REPLACE TABLE Sales 
(order_id VARCHAR(30),
 order_date DATE PRIMARY KEY,
 ship_date DATE,
 ship_mode VARCHAR(40),
 customer_name VARCHAR(100),
 segment VARCHAR(50),
 state VARCHAR(100),
 country VARCHAR(100),
 market VARCHAR(30),
 region VARCHAR(50),
 product_id VARCHAR(50),
 category VARCHAR(50),
 sub_category VARCHAR(100),
 product_name STRING,
 sales INT,
 quantity INT,
 discount FLOAT,
 profit FLOAT,
 shipping_cost FLOAT,
 order_priority VARCHAR(25),
 year NUMBER(4,0)
);

ALTER SESSION SET timezone = 'America/Los_Angeles';
DESCRIBE TABLE Sales;
SELECT * FROM Sales;

//2. Change the Primary key to Order Id Column.
ALTER TABLE Sales DROP PRIMARY KEY;
ALTER TABLE Sales ADD CONSTRAINT PK_SALES_ORDER_ID PRIMARY KEY(order_id);

//3. Check the data type for Order date and Ship date and mention in what data type it should be?
SELECT *,TO_VARCHAR(order_date, 'DD-MMMM-YYYY') AS ODFF,
TO_VARCHAR(ship_date, 'DD-MMMM-YYYY') AS SDFF FROM Sales;  -- Date Like 01-Jaunary-2011


//4. Create a new column called order_extract and extract the number after the last ‘–‘from Order ID column.
SELECT *,SPLIT_PART(order_id,'-',-1) AS order_extract  FROM Sales;

//5. Create a new column called Discount Flag and categorize it based on discount.Use ‘Yes’ if the discount is greater than zero else ‘No’.
SELECT *,CASE
            WHEN discount > 0 THEN 'YES'
            ELSE 'NO'
         END AS discount_flag
FROM Sales;


//6. FIND OUT HOW MUCH DAYS TAKEN FOR EACH ORDER TO PROCESS FOR THE SHIPMENT FOR EVERY ORDER ID.
SELECT *, DATEDIFF(day,order_date,ship_date) AS process_day FROM Sales;

//7. FLAG THE PROCESS DAY AS BY RATING IF IT TAKES LESS OR EQUAL 3  DAYS MAKE 5,LESS OR EQUAL THAN 6 DAYS 
//   BUT MORE THAN 3 MAKE 4,LESS THAN 10 BUT MORE THAN 6 MAKE 3,MORE THAN 10 MAKE IT 2 FOR EVERY ORDER ID.
WITH cpd as (SELECT *, DATEDIFF(day,order_date,ship_date) AS process_day FROM Sales)
SELECT *,CASE 
            WHEN process_day > 10 THEN 2
            WHEN process_day > 6 THEN 3
            WHEN process_day > 3 THEN 4
            ELSE 5
          END AS rating
FROM cpd;




