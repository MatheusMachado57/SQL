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

create table Frag(
ANO	       varchar(4),
MÊS	       varchar(4),
VALOR      int);

insert into Frag values
(2013,	1,	78569400),
(2013,	2,	4658200),
(2013,	3,	21659400),
(2013,	4,	5622300),
(2013,	5,	11254600),
(2013,	6,	120235500),
(2013,	7,	12003600),
(2013,	8,	80466500),
(2013,	9,	60112800),
(2013,	10,	956412200),
(2013,	11,	90006400),
(2013,	12,	48756200);

select * from Frag;

SELECT ANO
         , 1 AS JANEIRO
         , 2 AS FEVEREIRO
         , 3 AS MARÇO
		 , 4 AS ABRIL
         , 5 AS MAIO
         , 6 AS JUNHO
         , 7 AS JULHO
         , 8 AS AGOSTO
         , 9 AS SETEMBRO
         , 10 AS OUTUBRO
         , 11 AS NOVEMBRO
         , 12 AS DEZEMBRO
FROM VENDAANUAIS PIVOT(SUM(VALOR)
FOR MES IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]))P
ORDER BY 1;
