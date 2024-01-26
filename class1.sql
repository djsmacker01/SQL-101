SELECT customer_id, payment_id, amount FROM payment

SELECT title, release_year,rating FROM film



-- REMOVING DUPLICATE RECORDS
-- To remove


SELECT * FROM film

SELECT rating FROM film

SELECT DISTINCT rating FROM film

-- what is the release year from the film table

SELECT release_year from film

SELECT DISTINCT release_year FROM
film

Select * from customer
where first_name ='Jamie'


Select * from customer
where first_name ='Jamie' AND last_name ='Rice';


Select customer_id, amount
from payment
where amount > 10

Select phone
from address 
where address = '259 Ipoh Drive'

Select * from payment

Select customer_id, amount
from payment
Where amount not between 8 and 10;

--IN: it is used to replace = sign

--For Example
-- Get all info of customers with IDas 361,362 and 363.


--with multiple = sign 

SELECT * FROM customer
where customer_id = 361 OR customer_id = 362 OR customer_id = 363;

SELECT * FROM customer
where customer_id IN (261,361,362,363,1000)

--using NOT IN (This means it wont fetch the assign variable)
SELECT * FROM customer
where customer_id IN (261,361,362,363,1000)

--- Fitering Records by pattern
-- we will use like and Ilike ro filter records by pattern

--LIKE
--its is use for pattern filtering
-- and works with two symbols and called wildcards:% ===> as many characters as possible
-- The other symbol is is the underscore_. it implies one character at a time

-- For example
--we want onfo of customer with firstname starting with 'Jen'

SELECT * FROM CUSTOMER
WHERE first_name like 'Jen%'

--Find the name of customers that end s with 'is'
SELECT * FROM CUSTOMER
WHERE last_name like '%is'


--ILIKE
-- To remove the sensivity, we use ILIKE

--FOR EXAMPLE
SELECT * FROM CUSTOMER
WHERE first_name ilike 'jEn%'


-- UNDERSCORE
--GET ALL THE CUSTOMERS INFO WHOSE FIRSTNAME STARTS WITH J AND HAS A TOTAL OF FIVE CHARACTERS.

SELECT * FROM CUSTOMER
WHERE first_name ilike 'J__'


-- Fetch all customers whose email ends with '.org' and has exactly 8 characters before the domain

SELECT first_name,last_name,email FROM CUSTOMER
WHERE email like '________@sakilacustomer.org';


--'_r%' ===> Find the vaslues tht have 'r ' in the second position
--'r_%' ====> find the values that start with 'r' and are at least 2 chatacterd in lenght

--Fetch all customers with firstname that have 's' in the second position

SELECT first_name,last_name
FROM CUSTOMER
WHERE first_name like '_s%'

-- Fetch all customers with a lastname that start with 'A' and are at least 2 characters in length

SELECT first_name,last_name
FROM CUSTOMER
WHERE first_name like 'A_%'


--sORTING
--ORDER BY: It is used to sort or arrange records.
-- we can sort by
--Ascending===> from lowest to highest,and the symbol is ASS
--Descending order===> From highest to lowest, and the symbol is DESC

--Eamples

SELECT first_name, last_name
FROM customer
ORDER BY first_name ASC




SELECT first_name, last_name
FROM customer
ORDER BY first_name DESC


SELECT customer_id, amount
from payment
ORDER BY amount desc
LIMIT  20


--CHALLENEGE 5
-- get the customer_id for the top 10 highest amount
SELECT customer_id, amount
from payment
ORDER BY amount desc
LIMIT  10

--Aliases: They are used to rename a column or a table, and it uses the 'AS' Keyword

SELECT first_name, last_name AS SURNAME
FROM customer

--AGGREGATES FUMCTIONS
-- they are used to perform simple statistical operations. They operste on a column at a time.
--They change column to themselves. Usually, the coulmn to be aggregated must be within a bracket()
-- and are used after the select statement

--- The aggregate functions include: MIN,MAX SUM, COUNT,AND AVG

--MIN: it returns minimum value in a column
-- Find the minimun amount paid into the company
SELECT MIN(amount)AS Mini_amount
from payment


--Max: it returns minimum value in a column
-- Find the maximun amount paid into the company
SELECT Max(amount)AS Max_amount
from payment


--AVG: It returns the average mean of values in a column
---- Find the Average amount paid into the company
SELECT AVG(amount)AS AVG_amount
from payment


--SUM: It returns the Total values in a column
---- Find the Sum amount paid into the company

SELECT SUM(amount)AS SUM
from payment

--COUNT: It returns the FREQUESNCY values in a column
---- Find the Sum amount paid into the compan

SELECT COUNT(amount)AS COUNT
from payment

--NOTE: Count(column name) doesn't count the null values, so to count null values, we use count(*)

--Grouping records
-- The group by function is used to group records. it works well with aggregate functions
-- for example:
-- we want to know the total amount spent by each customer

SELECT customer_id, SUM(amount) AS Total_amount
from payment
GROUP BY customer_id
ORDER BY Total_amount desc
Limit 5

--Challenge 6
--Find the total numbers of films we have for each rating

Select * from film

Select rating, count(film_id) as Film_Rating_num
from film
Group by rating
Order by Film_Rating_num desc

select * from payment


--filtering grouped records
-- for us to filter groudped records, we use the keyord 'HAVING' 
-- HAVING is very similar to the the where clause, it can do everything the where clause does.
-- It can be used it operators(<,>,>=) and predicate(Not in, between)

-- diff btw HAVING and WHERE
--1. HAVING is used to filter grouped records, while where is use to filter ungrouped records

--Examples
-- How much has the customers who spent above $200 spent exactly?


SELECT customer_id, sum(amount) AS Total_amt
FROM payment
Group by customer_id
HAVING SUM(amount) > 200
order by Total_amt

-- Find the number of custiomers that have spent above $100 exactly in the company

SELECT customer_id, sum(amount) AS customer_number
FROM payment
Group by customer_id
HAVING sum(amount) > 100
order by customer_number

-- What is the total number of customers who have performed more than 10 or more transaction with the company

SELECT customer_id, count(amount) AS customer_number
FROM payment
Group by customer_id
HAVING count(amount) >= 10
order by customer_number
-- The total number of custoimers that performed more than 10 transactionis 598


--JOINS
-- Join are use to merge tow or more table together.
--The tables are joined based on primary and foreign keys relationship
--Types of join
-- INNER, LEFT RIGHT, N Full join

--STEPS FOR JOINING TABLES
--1. Identify the tables to join
--2. Take note of the relatioship, i.e keys
--3. Take note of columns needed and the tables they belong
--4. put all columns in a single select statement
5.-- Add the first table after the from statement
6.-- state the join type
7.-- Add the second table
8.-- Introduce the joining condition ===> ON, based on the relationships

-- To prevent ambiguous columns, we alise our table name. We use table column name syntax on the ambiguous column
-- This is to specify the tables the column are present.


--Example of INNER JOIN
-- we want to know the name of customers that patronise us

SELECT C.customer_id,first_name,last_name, payment_id,amount
FROM customer AS C
INNER JOIN payment AS P
ON C.customer_id = P.customer_id



SELECT C.customer_id,first_name,last_name, payment_id,amount
FROM customer AS C
INNER JOIN payment AS P
ON C.customer_id = P.customer_id


--SHORT CUT WITH 'USING'

SELECT customer_id,first_name,last_name, payment_id,amount
FROM customer 
INNER JOIN payment 
USING(customer_id)

--Left join
--we want to get the names of all the films and confirm if they are in the inventory table or not

SELECT film_id, title, inventory_id
from film
left join inventory
using(film_id)


-- CREATE: it is used to create an object (database or table)
 
-- To create a database
-- CREATE DATABASE Hotel_Management
-- SELECT first_name,last_name
-- FROM CUSTOMER
-- WHERE first_name like 'A_%'

Select * from payment	
--How many payment transactions were greater than $5.00?
Select customer_id, amount
from payment
where amount>5

select * from actor
-- Quetion 2------------------
--- How many actors have a first name that starts with the letter P?
Select count(*)
From Actor
Where first_name like 'P%'


--- Question 3--------------
--How many unique districts are our customers from?
select * from address
SELECT count(DISTINCT district)
FROM address
---------- Question 4-----------
-- Retrieve the list of names for those distinct districts from the previous question
SELECT distinct district AS List_of_Names
from address
-- Question 5 --------------
--  How many films have the word Truman somewhere in the title?
SELECT * FROM FILM

SELECT count(*) AS num_of_film_with_TRUMAN
from film
where title LIKE '%Truman%'

----- Question 6 --------------
-- Create a table to organize our potential leads! We will have the following information: A
-- customer's first name, last name, email,sign-up date, and number of minutes spent on the dvd
-- rental site. You should also have some sort of id tracker for them. You have free reign on how
-- you want to create this table

----- Question 7 --------------
--What customer has the highest customer ID number whose name starts with an ‘E’ and has
-- an address ID lower than 500?

SELECT first_name, last_name
FROM CUSTOMER
where first_name LIKE 'E%' OR last_name like 'E%'
AND address_id < 500
ORDER BY customer_id
LIMIT 1;

----- Question 8 ------------
--Return the customer IDs of customers who have spent at least $110 with the staff member
-- who has an ID of 2
SELECT customer_id , sum(amount)
from payment
where staff_id = 2
group by customer_id
Having sum(amount)>= 110;


----- Question 9 ------------
--How many films have a rating of R and a replacement cost between $5 and $15?
Select count(*)
from film
where rating = 'R'
AND replacement_cost between  5 and 15;

----- Question 10 ------------
-- What is the maximum payment transaction done by the customer?

SELECT Max(amount) AS Max_payment
from payment