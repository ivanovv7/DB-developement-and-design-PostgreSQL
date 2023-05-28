--                                *** ***    1/3   *** ***


-- 1. Calculate “(price + cost) / weight” for all products

SELECT name, (price+cost)/weight as calculation_for_products 
FROM product
ORDER BY calculation_for_products ASC;

-- 2. Get a round number that is higher or equal for the costs and a round number that is lower or equal for the prices for all products.

SELECT CEIL(cost) as cost_higher_or_equal, FLOOR(price) as price_lower_or_equal
FROM product
ORDER BY cost_higher_or_equal;

-- 3.Get all orders and generate a random number between 0 and 100 for every order.

SELECT id,round(random()*100) as random_rounded_integer
FROM "Order"
ORDER BY id;

-- 4. Concatenate the name, region and zipcode from every business entity and add the delimiter ‘; ‘ between them.

SELECT concat( name, ';', region, ';', zipcode) FROM businessentity;

-- 5. Declare temp table that will contain LastName and HireDate columns. The HireDate column must not allow dates after 01.01.2010. Insert 5 rows of dummy data and display every row inserted.

CREATE TEMPORARY TABLE temporaryTable (
lastname varchar(20) NOT NULL,
hireDate date CHECK(hireDate < '2010.01.01') NOT NULL -- "CHECK" returns true or false from the statement in the brackets in front of it.
);


-- Hit error scenario where "hireDate" is after '01.01.2010' - > ERROR
INSERT INTO temporaryTable (lastname, hireDate)
VALUES('Ivanov','2011.09.25');

-- VALID SCENARIO, add 5 records in the temporary table with multiple adding syntax - > OK
INSERT INTO temporaryTable (lastname, hireDate)
VALUES('Ivanov','2005.09.25'),
('Dimitrov', '2009.05.21'),
('Stankovska', '2003.11.29'),
('Jones', '2008.01.25'),
('Olivera', '2002.01.08'),
('Ibrahimovic', '2007.02.25');

-- read from table - > DONE OK
SELECT * FROM temporaryTable;

