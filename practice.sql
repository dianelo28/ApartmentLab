\dg -- to show all users;

\dt -- to show tables;

-- show all the data in the owners table
SELECT * FROM owners;

--create table for owners

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	age INTEGER
);

-- create table for properties

CREATE TABLE properties (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	num_units INTEGER,
	owner_id INTEGER REFERENCES owners
);

-- add three owners
INSERT INTO owners  
	(name, age)
	VALUES
	('Donald', 56), ('Elaine', 24), ('Emma', 36);

-- show name of owners
SELECT name FROM owners;

-- show the ages of all the owners in ascending order
SELECT age FROM owners ORDER BY age;

-- show the name of an owner whose name is donald
SELECT * FROM owners 
	WHERE name = 'Donald';

-- show the age of all owners who are older than 30
SELECT * FROM owners
	WHERE age > 30;

-- show the name of all owners whose name starts with an "E"
SELECT * FROM owners
	WHERE name LIKE 'E%';

-- add an owner named John who is 33 and Jane who is 43
INSERT INTO owners
	(name, age)
	VALUES
	('John', 33), ('Jane', 43);

-- change Jane's age to 30
UPDATE owners
	SET age = 30
	WHERE name = 'Jane';

-- change Jane's name to Janet
UPDATE owners 
	SET name = 'Janet'
	WHERE name = 'Jane';

-- delete the owner named Janet
DELETE FROM owners
	WHERE name = 'Janet'
	RETURNING *;

-- add a property named Archstone that has 20 units
INSERT INTO properties
	(name, num_units)
	VALUES
	('Archstone', 20);

-- add two more properties with names and number of units of your choice
INSERT INTO properties
	(name, num_units)
	VALUES
	('Market', 100), ('Soma', 200);

-- show all of the properties in alphabetical order that are not named Archstone
SELECT * FROM properties 
	WHERE name != 'Archstone'
	ORDER BY name;

-- count the total number of rows in the properties table
SELECT COUNT (id) FROM properties;

-- show the highest age of all the owners
SELECT MAX (age) FROM owners;

-- show the names of the first three owners in your owners table
SELECT * FROM owners
	LIMIT 3;

-- use a full outer join to show all of the information from the owners table and properties table
SELECT * FROM owners
FULL OUTER JOIN properties
ON owners.id = properties.owner_id;

-- update at least one of your properties to belong to the owner with id 1
UPDATE properties
	SET owner_id = 1
	WHERE name = 'Archstone';

-- use an inner join to show all of the owners with the associated properties
SELECT * FROM owners
INNER JOIN properties
on owners.id = properties.owner_id;

-- use a cross join to show all possible combinations of owners and properties
SELECT * FROM owners
CROSS JOIN properties
WHERE owners.id = 1;

-- in the properties table, change the name of the column name to property_name
ALTER TABLE properties RENAME COLUMN name to property_name;

-- count the total number of properties where the owner_id is between 1 and 3
SELECT COUNT(property_name) FROM properties WHERE owner_id < 3;








