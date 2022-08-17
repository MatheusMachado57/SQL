# SQL Lesson 7: OUTER JOINs
# Depending on how you want to analyze the data, 
# the INNER JOIN we used last lesson might not be sufficient because the
# resulting table only contains data that belongs in both of the tables.

# If the two tables have asymmetric data, which can easily happen when data is 
# entered in different stages, then we would have to use a LEFT JOIN, RIGHT JOIN or 
# FULL JOIN instead to ensure that the data you need is not left out of the results.

# Select query with LEFT/RIGHT/FULL JOINs on multiple tables
# SELECT column, another_column, …
# FROM mytable
# INNER/LEFT/RIGHT/FULL JOIN another_table 
#     ON mytable.id = another_table.matching_id
# WHERE condition(s)
# ORDER BY column, … ASC/DESC
# LIMIT num_limit OFFSET num_offset;
# Like the INNER JOIN these three new joins have to specify which column to join the data on.
# When joining table A to table B, a LEFT JOIN simply includes rows from A regardless of 
# whether a matching row is found in B. The RIGHT JOIN is the same, but reversed, 
# keeping rows in B regardless of whether a match is found in A. 
# Finally, a FULL JOIN simply means that rows from both tables are kept, 
# regardless of whether a matching row exists in the other table.

# When using any of these new joins, you will likely have to write additional logic to 
# deal with NULLs in the result and constraints (more on this in the next lesson).

# Did you know?
# You might see queries with these joins written as LEFT OUTER JOIN, RIGHT OUTER JOIN, 
# or FULL OUTER JOIN, but the OUTER keyword is really kept for SQL-92 compatibility and 
# these queries are simply equivalent to LEFT JOIN, RIGHT JOIN, and FULL JOIN respectively.

# Exercise
# In this exercise, you are going to be working with a new table which stores fictional 
# data about Employees in the film studio and their assigned office Buildings. 
# Some of the buildings are new, so they don't have any employees in them yet, 
# but we need to find some information about them regardless.

# Since our browser SQL database is somewhat limited, 
# only the LEFT JOIN is supported in the exercise below.

use bolt;

create table Buildings(
Building_name	varchar(2),
Capacity        int);

INSERT INTO Buildings VALUES
('1e',	24),
('1w',	32),
('2e',	16),
('2w',	20);

select * from Buildings;

create table Employees(
Role             varchar(50),	
Name	         varchar(50),
Building	     varchar(2),
Years_employed   int); 

INSERT INTO Employees VALUES
('Engineer',	'Becky A.',	'1e',	4),
('Engineer',	'Dan B.',	'1e',	2),
('Engineer',	'Sharon F.',	'1e',	6),
('Engineer',	'Dan M.',	'1e',	4),
('Engineer',	'Malcom S.',	'1e',	1),
('Artist',	'Tylar S.',	'2w',	2),
('Artist',	'Sherman D.',	'2w',	8),
('Artist',	'Jakob J.',	'2w',	6),
('Artist',	'Lillia A.',	'2w',	7),
('Artist',	'Brandon J.',	'2w',	7),
('Manager',	'Scott K.',	'1e',	9),
('Manager',	'Shirlee M.',	'1e',	3),
('Manager',	'Daria O.',	'2w',	6);

select * from Employees;

# Exercise 7 — Tasks
# Find the list of all buildings that have employees
select * from Employees left join Buildings on Building = Building_name;

# Find the list of all buildings and their capacity
select distinct Building, Capacity from employees left join Buildings on Building = Building_name;

# List all buildings and the distinct employee roles in each building (including empty buildings)
select * from Buildings left join employees on Building = Building_name;