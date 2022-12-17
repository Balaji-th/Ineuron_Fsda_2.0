1. Load the given dataset into snowflake with a primary key to Order Date column.
                 Data:  https://drive.google.com/drive/folders/1YktkyxlphjA1TmIO2GUXL9elUf1s4sfn
2. Change the Primary key to Order Id Column.
3. Check the data type for Order date and Ship date and mention in what data type
it should be?
4. Create a new column called order_extract and extract the number after the last
‘–‘from Order ID column.
5. Create a new column called Discount Flag and categorize it based on discount.
Use ‘Yes’ if the discount is greater than zero else ‘No’.
6. Create a new column called process days and calculate how many days it takes
for each order id to process from the order to its shipment.
7. Create a new column called Rating and then based on the Process dates give
rating like given below.
      a. If process days less than or equal to 3days then rating should be 5
      b. If process days are greater than 3 and less than or equal to 6 then rating
should be 4
      c. If process days are greater than 6 and less than or equal to 10 then rating
should be 3
      d. If process days are greater than 10 then the rating should be 2.
