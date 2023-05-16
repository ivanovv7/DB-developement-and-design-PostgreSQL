-- *** *** Requirement 1/6 *** ***
SELECT * FROM EMPLOYEE;

-- 1 Find all Employees with FirstName = Antonio (change Marko) --> DONE
SELECT id,firstname,lastname,dateofbirth,gender,hiredate,nationalidnumber FROM EMPLOYEE
WHERE firstname = 'Marko';

-- 2 Find all Employees with DateOfBirth greater than ‘01.01.1979’ --> DONE

SELECT id,firstname,lastname,dateofbirth,gender,hiredate,nationalidnumber FROM EMPLOYEE
WHERE dateofbirth > '1979.01.01';

-- 3 Find all Male Employees --> DONE
SELECT id,firstname,lastname,dateofbirth,gender,hiredate,nationalidnumber FROM EMPLOYEE
WHERE gender = 'M';

-- 4 Find all Employees with LastName starting With ‘T’ --> DONE
SELECT id,firstname,lastname,dateofbirth,gender,hiredate,nationalidnumber FROM EMPLOYEE
WHERE lastname LIKE 'T%';

-- 5 Find all Employees hired in JUNE/2012 ** "I have changed the requirement there was no hire date like the one requested" --> DONE
SELECT id,firstname,lastname,dateofbirth,gender,hiredate,nationalidnumber FROM EMPLOYEE
WHERE hiredate BETWEEN '2012.06.01' AND '2012.06.30';

-- 6 Find all Employees with LastName starting With ‘T’ hired in January/1988 ** 'I have changed the letter to T' DONE
SELECT id,firstname,lastname,dateofbirth,gender,hiredate,nationalidnumber FROM EMPLOYEE
WHERE lastname LIKE 'T%'
AND
hiredate BETWEEN '2013.06.01' AND '2013.06.30';



-- *** *** Requirement 2/6 *** ***

-- 1 Find all Employees with FirstName = Ana ordered by Last Name "I have changed the name to ANA" DONE

SELECT id,firstname,lastname,dateofbirth,gender,hiredate,nationalidnumber FROM EMPLOYEE
WHERE firstname = 'Ana'
ORDER BY lastname;

-- 2 List all Employees ordered by FirstName DONE
SELECT id,firstname,lastname,dateofbirth,gender,hiredate,nationalidnumber FROM EMPLOYEE
ORDER BY firstname;

-- 3 Find all Male employees ordered by HireDate, starting from the last hired DONE
SELECT id,firstname,lastname,dateofbirth,gender,hiredate,nationalidnumber FROM EMPLOYEE
WHERE gender = 'M'
ORDER BY hiredate DESC;


-- *** *** Requirement 3/6 *** ***

-- 1 List all Business Entity region and Customer region names in single result set WITH duplicates DONE
SELECT region FROM businessentity
UNION ALL
SELECT regionname FROM customer;

-- 2 List all Business Entity region and Customer region names in single result set WITHOUT duplicates
SELECT region FROM businessentity
UNION 
SELECT regionname FROM customer;

-- 3 List all common region names between Business Entities and Customers DONE
SELECT region FROM businessentity
INTERSECT
SELECT regionname FROM customer;


-- *** *** Requirement 4/6 *** ***

-- 1 Provide create table script for the Order table where it won’t allow an orderDate before 01.01.2010

SELECT * FROM "Order";

CREATE TABLE OrderTwo 
(
	id INTEGER PRIMARY KEY NOT NULL,
	orderdate date CHECK(orderdate > '01.01.2010') NOT NULL,
	status smallint NOT NULL,
	businessentityid integer NOT NULL,
	customerid integer NOT NULL,
	employeeid integer NOT NULL,
	totalprice real NOT NULL,
	comment varchar(100) NULL
);

-- table created OK
SELECT * FROM ordertwo;

--try to insert values with 'orderdate' before 01.01.2010

-- TAKE 1 (ERROR)OK
-- ERROR : new row for relation "ordertwo" violates check constraint "ordertwo_orderdate_check" DONE
INSERT INTO ordertwo (id,orderdate,status,businessentityid,customerid,employeeid,totalprice)
VALUES (2,'30.11.2009',2,236,25,879,58.6958);

--TAKE 2 (PASSING THE CONSTRAINT) OK
INSERT INTO ordertwo (id,orderdate,status,businessentityid,customerid,employeeid,totalprice)
VALUES (3,'30.12.2020',2,236,25,879,58.6958);


-- 2 Provide create table script for the Product table where the price will always be AT LEAST 20% higher than the cost

SELECT * FROM product;

CREATE TABLE productTwo
(
	id INTEGER PRIMARY KEY NOT NULL,
	code varchar(50) NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(5000) NOT NULL,
	weight real NOT NULL,
	price real CHECK(price > (cost/100)*20 + cost ) NOT NULL,
	cost real NOT NULL

);

-- ** EXPLANATION FOR FORMULA: (cost/100)*20 + cost 
-- first devide cost with 100 to get 1% of cost, then multiply by 20 to get 20% of cost, lastly add the 20% of cost to cost to get the minimum value for price.
-- if CHECK(price > (cost/100)*20 + cost ) is true it means the price is 20% higher than const and query is EXECUTED !
SELECT * FROM productTwo; --  OK

-- TAKE 1 (ERROR STATE PRICE HIGHER THAN COST BUT NOT HIGHER THAN 20% OF COST) OK
INSERT INTO productTwo(id,code,name,description,weight,price,cost)
VALUES(1,'trklil','burgers','fast delivery','0.5860','99.69','89.3694');


-- TAKE 2 (SUCCESFULL STATE PRICE WELL ABOVE 20% OF COST) OK
INSERT INTO productTwo(id,code,name,description,weight,price,cost)
VALUES(2,'trklil','burgers','fast delivery','0.5860','190.369','89.3694');

SELECT * FROM productTwo; -- DONE !


-- 3 Provide create table script for the Product table where all description values will be UNIQUE



CREATE TABLE productThree
(
	id INTEGER PRIMARY KEY NOT NULL,
	code varchar(50) NOT NULL,
	name varchar(100) NOT NULL,
	description varchar(5000) UNIQUE NOT NULL,
	weight real NOT NULL,
	price real  NOT NULL,
	cost real NOT NULL

);

SELECT * FROM productThree;

-- TAKE 1 (ERROR TRY TO INSERT DATA IN TABLE WHERE FOR DESCRIPTION WE WILL HAVE SAME VALUES)

INSERT INTO productThree (id,code,name,description,weight,price,cost)
VALUES 
(1,'tr','bur','fast delivery','0.5860','99.69','89.3694'),
(2,'testcode','burek','fast delivery', '0.5896','589.5','85.06');


-- TAKE 2 (SUCCESFULL STATE WHERE DESCRIPTION IS DIFFERENT)


INSERT INTO productThree (id,code,name,description,weight,price,cost)
VALUES 
(1,'tr','bur','fast delivery','0.5860','99.69','89.3694'),
(2,'testcode','burek','delivery', '0.5896','589.5','85.06');

SELECT * FROM productThree; -- DONE OK !