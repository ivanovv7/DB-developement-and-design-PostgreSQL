1. --How can you retrieve all the information from the facilities table?

SELECT * FROM facilities;

2. --How can you produce a list of facilities that charge a fee to members? All facilities that are in the bookings.

-- WAY 1
SELECT * FROM FACILITIES
WHERE membercost > 0
ORDER BY membercost  DESC;

-- WAY 2 
SELECT * FROM BOOKINGS
INNER JOIN FACILITIES ON BOOKINGS.facid = FACILITIES.facid;

3.--How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.

SELECT facid, name,membercost, monthlymaintenance FROM FACILITIES
WHERE membercost > 0
AND
membercost < monthlymaintenance/50;


4. --How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
-- without OR operator (as requested)
SELECT * FROM FACILITIES
WHERE facid IN (1,5);

-- with OR operator(as NOT requested)

SELECT * FROM FACILITIES
WHERE facid = 1 OR facid = 5;

5. -- You'd like to get the signup date of your last member. How can you retrieve this information?

SELECT * FROM members
ORDER BY joindate DESC
LIMIT 1;

-- Order the data by the "joindate" column by descending order, in this way the latest joined member
--will be on top of the newly generated table. with LIMIT we limit hte records "RETURNED" to 1 wich is the one who joined the most recent.

6. -- You'd like to get the first and last name of the last member(s) who signed up - not just the date. How can you do that?

-- WAY ONE (using the relation between members and booking)
SELECT members.firstname, members.surname, members.joindate
FROM members
INNER JOIN bookings
ON members.memid = bookings.memid
ORDER BY joindate DESC;

-- WAY TWO (using just the member table since it has the column "joindate" ...)

SELECT surname,firstname,joindate
FROM members 
ORDER BY joindate DESC;

SELECT * FROM BOOKINGS
ORDER BY memid DESC;

7. -- Produce a list of the total number of slots booked per facility. For now, just produce an output table consisting of facility id and slots, sorted by facility id.
SELECT * FROM BOOKINGS
SELECT * FROM FACILITIES

-- WAY ONE -> WRONG
SELECT facid,slots
FROM BOOKINGS;

-- WAY TWO (using the relation) -> WRONG
SELECT BOOKINGS.facid,BOOKINGS.slots,FACILITIES.name
FROM BOOKINGS
INNER JOIN FACILITIES 
ON facilities.facid = bookings.facid
ORDER BY facid;

--WAY THREE (group by) -> OKEY
SELECT facid,SUM(slots) as TotalSlotsPerFacility
FROM bookings
GROUP BY facid
ORDER BY facid;

8. -- Find the total number of members (including guests) who have made at least one booking.

-- Count me the column "memid" but only the distinct values 
--since guests and members are in the same column the requrinment is fullfiled.
-- OUTPUT ->> 30
SELECT COUNT ( DISTINCT memid ) as membersPlusGuests FROM BOOKINGS;