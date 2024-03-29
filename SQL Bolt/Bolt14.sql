# SQL Lesson 15: Deleting rows
# When you need to delete data from a table in the database, you can use a DELETE statement, 
# which describes the table to act on, and the rows of the table to delete through the WHERE clause.

# Delete statement with condition
# DELETE FROM mytable
# WHERE condition;
# If you decide to leave out the WHERE constraint, then all rows are removed, 
# which is a quick and easy way to clear out a table completely (if intentional).

# Taking extra care
# Like the UPDATE statement from last lesson, it's recommended that you run 
# the constraint in a SELECT query first to ensure that you are removing the 
# right rows. Without a proper backup or test database, it is downright easy 
# to irrevocably remove data, so always read your DELETE statements twice and execute once.

# Exercise
# The database needs to be cleaned up a little bit, 
# so try and delete a few rows in the tasks below.

use bolt;

# Exercise 15 — Tasks
# This database is getting too big, lets remove all movies that were released before 2005.
DELETE FROM movies where year < 2055;

# Andrew Stanton has also left the studio, so please remove all movies directed by him.
DELETE FROM movies where director = "Andrew Stanton";
