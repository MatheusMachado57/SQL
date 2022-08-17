# SQL Lesson 1: SELECT queries 101
# To retrieve data from a SQL database, we need to write SELECT statements, 
# which are often colloquially refered to as queries. A query in itself is just a 
# statement which declares what data we are looking for, where to find it in the database, 
# and optionally, how to transform it before it is returned. It has a specific syntax though, 
# which is what we are going to learn in the following exercises.

# As we mentioned in the introduction, you can think of a table in SQL as a type of an entity 
# (ie. Dogs), and each row in that table as a specific instance of that type 
# (ie. A pug, a beagle, a different colored pug, etc). This means that the columns would then 
# represent the common properties shared by all instances of that entity 
# (ie. Color of fur, length of tail, etc).

# And given a table of data, the most basic query we could write would be one that selects 
# for a couple columns (properties) of the table with all the rows (instances).

# Select query for a specific columns
# SELECT column, another_column, …
# FROM mytable;
# The result of this query will be a two-dimensional set of rows and columns, 
# effectively a copy of the table, but only with the columns that we requested.

# If we want to retrieve absolutely all the columns of data from a table, 
# we can then use the asterisk (*) shorthand in place of listing all the 
# column names individually.

# Select query for all columns
# SELECT * 
# FROM mytable;
# This query, in particular, is really useful because it's a simple way 
# to inspect a table by dumping all the data at once.

# Exercise
# We will be using a database with data about some of Pixar's classic movies for most of our exercises. 
# This first exercise will only involve the Movies table, and the default query below currently 
# shows all the properties of each movie. To continue onto the next lesson, alter the query to find 
# the exact information we need for each task.

use Bolt;

create table Movies(
Id	              int, 
Title	          varchar(50),
Director	      varchar(50),
Year	          int,
Length_minutes    int);

INSERT INTO Movies VALUES
(1,	 'Toy Story',	'John Lasseter',	1995,	81),
(2,	 'A Bugs Life',	'John Lasseter',	1998,	95),
(3,	 'Toy Story 2',	'John Lasseter',	1999,	93),
(4,	 'Monsters, Inc.',	'Pete Docter',	2001,	92),
(5,	 'Finding Nemo',	'Andrew Stanton',	2003,	107),
(6,	 'The Incredibles',	'Brad Bird',	2004,	116),
(7,	 'Cars',	'John Lasseter',	2006,	117),
(8,	 'Ratatouille',	'Brad Bird',	2007,	115),
(9,	 'WALL-E',	'Andrew Stanton',	2008,	104),
(10, 'Up',	'Pete Docter',	2009,	101),
(11, 'Toy Story 3',	'Lee Unkrich',	2010,	103),
(12, 'Cars 2',	'John Lasseter',	2011,	120),
(13, 'Brave',	'Brenda Chapman',	2012,	102),
(14, 'Monsters University',	'Dan Scanlon',	2013,	110);

select * from Movies;

# Exercise 1 — Tasks

# Find the title of each film
select Title from Movies;

# Find the director of each film
select director from Movies;

# Find the title and director of each film
select Title, director from Movies;

# Find the title and year of each film
select Title, Year from Movies; 

# Find all the information about each film
select * from Movies;

