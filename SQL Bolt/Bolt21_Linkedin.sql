use bolt;

select * from north_american_cities;

SELECT City, Country, Population,
RANK() OVER (ORDER BY City) Population_rank
FROM north_american_cities;

SELECT City, Country, Population,
RANK() OVER (PARTITION BY Country ORDER BY City) Population_rank
FROM north_american_cities;

# In this example:

# First, the PARTITION BY clause breaks the result sets into partitions by Country.
# Then, the ORDER BY clause sorts the City by Population in descending order.