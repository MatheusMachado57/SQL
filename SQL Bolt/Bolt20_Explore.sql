use bolt;

select * from north_american_cities;
select * from employees;

select * from north_american_cities where City like '%R%';
select * from north_american_cities where Population between 3000000 and 9000000;
select * from north_american_cities where Country in ('Canada');

select * from north_american_cities
where Population > (select avg(Population) from north_american_cities);

select City, Population, Population/(SELECT SUM(Population) FROM north_american_cities)*100 as '%Pop' from north_american_cities;

alter table north_american_cities drop column porc;
alter table north_american_cities add column porc double;

create table North_american_cities2(
City	      varchar(50),
Country	      varchar(50),
Population	  int,
Latitude	  float8,
Longitude     float8,
porc          float4);

INSERT INTO north_american_cities2
SELECT *, (Population / (SELECT SUM(Population) FROM north_american_cities)) * 100 as porcentagem
FROM north_american_cities;

select * from bolt.north_american_cities2;
select round(sum(porc),4) from bolt.north_american_cities2;

select * from employees where ucase(Role) = 'Manager';
select lcase(Role) from employees where lcase(Role) = 'Manager';

select * from buildings where building_name in (select building from employees);
select * from buildings where building_name in (select building from employees where Capacity > 20);

select * from employees E, buildings B where B.Building_name = E.Building;
select B.Building_name, E.Building from employees E, buildings B where B.Building_name = E.Building;