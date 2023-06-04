--                   *** ***   # PART 1 *** ***

--- Create new table actors_logging_table, that will have the following columns: log_id SERIAL, actor_name VARCHARR, insertion_time TIMESTAMP

SELECT * FROM ACTORS;

CREATE TABLE actors_logging_table (
log_id SERIAL,
actor_name VARCHAR,
insertion_time TIMESTAMP
);

SELECT * FROM actors_logging_table;


--- Create new trigger actor_insert_trigger, and bind it to the actors table. Whenever a new actor is inserted, add new record/insertion in the actors_logging_table with the correct data.


-- TRIGER FUNCTION
-- trigger functions do not accept ARGUMENTS !
CREATE OR REPLACE FUNCTION actor_insert_trigger_function()
RETURNS TRIGGER
AS $$

-- logic of trigger function
BEGIN
INSERT INTO actors_logging_table (actor_name)
-- id will be inserted automaticaly since it is of type -> SERIAL
-- and also insertion_time is defined in the CREATE TABLE to be AUTO GENERATED
VALUES (NEW.name);

RETURN NEW;
END;

$$ LANGUAGE plpgsql;


-- TRIGGER
CREATE TRIGGER actor_insert_trigger
AFTER INSERT ON actors
FOR EACH ROW
EXECUTE FUNCTION actor_insert_trigger_function();

-- insert single row data to ACTIVATE the created TRIGGER
INSERT INTO actors(actor_id,name,nationality,birth_year)
VALUES (12,'Ivan Ivanov', 'Macedonian',1995);

-- read the new loggind actors table -- >> OK DONE
SELECT * FROM actors_logging_table;

-- insert multiple rows data to TEST TRIGGER functionality "FOR EACH ROW" --> OK DONE
INSERT INTO actors(actor_id,name,nationality,birth_year)
VALUES 
(13,'Aneta Stankovska', 'Macedonian', 1995),
(14,'George Dimitrov', 'Macedonian',1995);


-- read the new loggind actors table -- >> OK DONE
SELECT * FROM actors_logging_table;





--#                        *** *** PART 2 *** ***

--- Create new trigger actors_delete_trigger and bind it to the table actors. 
---Execute the trigger on DELETE, and whenever a row/record is deleted, RAISE NOTICE with the following message format
---Row with id: some_id, and actor with name: some_actor_name was deleted' -> Example message: "Actor with id: 1, and with name John Doe was deleted."

-- TRIGER FUNCTION
CREATE FUNCTION actors_delete_trigger_function()
RETURNS TRIGGER
AS $$

-- logic of trigger function
BEGIN
-- "%" sign is a place holder in this line of code, and the values are added in order after the coma sign.
RAISE NOTICE 'Row with id: % and with name % was deleted !', OLD.actor_id,OLD.name;

RETURN OLD;
END;

$$ LANGUAGE plpgsql;

-- TRIGER
CREATE OR REPLACE TRIGGER actors_delete_trigger
AFTER DELETE ON actors
FOR EACH ROW
EXECUTE FUNCTION actors_delete_trigger_function();


-- DELETE FROM TABLE TO ACTIVATE TRIGGER -->> OK DONE
DELETE FROM actors
WHERE actor_id = 12;


SELECT * FROM ACTORS;




--#                        *** *** PART 3 *** ***

--- Create a procedure for adding new Actor ( get inspiration from the procedure from the class )