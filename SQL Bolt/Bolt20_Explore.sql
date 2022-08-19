use bolt;

select * from north_american_cities;

select * 
from north_american_cities
where Population > 
      (select avg(Population) 
	   from north_american_cities);

select City, Population, Population/(SELECT SUM(Population) 
FROM north_american_cities)*100 as '%Pop' from north_american_cities;

alter table north_american_cities drop column porc;
alter table north_american_cities add column porc double;
select sum(Population) from north_american_cities;
update north_american_cities set porc = 38688645;
update north_american_cities set porc = Population/porc;


