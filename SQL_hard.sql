show databases;
create database shazam;
use shazam;

create table table_1 (
id       int           not null,
nome     varchar(50)   not null,
estado   varchar(50)   not null,
idade    int,
sexo     varchar(50),
peso     decimal(5,2),
contr    date,
primary key (id));

desc table_1;

INSERT INTO table_1 VALUES
(152,   'Andre', 'MG', 23, "M", 23.50, '2018-01-22'),
(222, 'Barbara', 'SP', 45, "F", 34.34, '2018-05-15'),
(451,  'Carlos', 'MG', 12, "M", 65.76, '2017-02-05'),
(754, 'Eduardo', 'SP', 21, "M", 87.12, '2018-04-10'),
(897, 'Juliana', 'RJ', 98, "F", 12.87, '2017-03-01'),
(852,   'Maria', 'RJ', 66, "F", 54.34, '2018-05-30'),
(997, 'Ricardo', 'MG', 42, "M", 34.28, '2018-05-25'),
(535, 'Vanessa', 'SP', 37, "F", 76.09, '2017-04-30'),
(234,    'Alex', 'ES', 21, "M", 25.87, '2016-03-04');

select * 
from table_1;

select nome, estado, idade, peso
from table_1
where sexo = 'M'
and not estado = "SP"
or peso > 40
and idade between 20 and 50 
and nome is not null
order by peso, idade asc
limit 2;

update table_1 
set nome = 'Gilberto'
where id = 152;

select * from table_1;

# delete from table_1;
delete from table_1 
where id = 152;

select * from table_1;

select min(idade) 
from table_1;

select max(idade) as maior_idade
from table_1;

select count(peso)
from table_1
where idade > 40;

select avg(peso)
from table_1
where idade > 40;

select sum(peso)
from table_1
where idade > 40;

# Finds any values that start with "a"
select *
from table_1
where nome
like 'a%';

# Finds any values that end with "a"
select *
from table_1
where nome
like '%a';

# Finds any values that have "or" in any position
select *
from table_1
where nome
like '%a%';

# Finds any values that have "a" in the second position
select *
from table_1
where nome
like '_a%';

# Finds any values that start with "a" and are at least 2 characters in length
select *
from table_1
where nome
like 'a__%';

# Finds any values that start with "a" and ends with "x"
select *
from table_1
where nome
like 'a%x';

# Finds any values that start with "a", "b" or "j"
select *
from table_1
where idade
like '[abj]%';

# Finds any values that not start with "a", "b" or "j"
select *
from table_1
where idade
like '[!abj]%';

select *
from table_1
where idade
not like 'abj%';

# selects all customers that are named as "Barbara" or "Carlos"
select * 
from table_1
where nome 
in ('Barbara', 'Carlos');

# selects all customers that are not named as "Barbara" or "Carlos"
select * 
from table_1
where nome 
not in ('Barbara', 'Carlos');

# ??
select * 
from table_1
where nome 
in (select estado from suppliers);

# Chamando a variável por outro nome;
select nome
as Nome, 
idade
as Idade, 
peso
as Peso
from table_1;

select nome, 
peso + ', ' + idade 
as Address
from table_1;
 
SELECT nome, 
CONCAT(id,', ', sexo,', ', Estado) 
as Address
from table_1;

create table table_2 (
id       int           not null,
nome     varchar(50)   not null,
estado   varchar(50)   not null,
idade    int,
sexo     varchar(50),
peso     decimal(5,2),
contr    date,
primary key (id)
);

desc table_2;

INSERT INTO table_2 VALUES
(152,   'Andre', 'MG', 23, "M", 23.50, '2018-01-22'),
(222, 'Barbara', 'SP', 45, "F", 34.34, '2018-05-15'),
(451,  'Carlos', 'MG', 12, "M", 65.76, '2017-02-05'),
(555, 'Matheus', 'SP', 29, "M", 95.12, '2018-03-10'),
(229,  'Angela', 'RJ', 90, "F", 23.76, '2015-06-03');

select * 
from table_2;

select table_1.id, table_1.nome, table_2.peso
from table_1
inner join table_2
on table_1.id = table_2.id;

select table_1.id, table_1.nome, table_2.peso
from table_1
left join table_2
on table_1.id = table_2.id;

select table_1.id, table_1.nome, table_2.peso
from table_1
right join table_2
on table_1.id = table_2.id;

select id, nome from table_1
union
select id, nome from table_2
order by nome asc;

# having is used to conditions after the group by, and the where is used before
select idade, peso, estado
from table_2
where id > 100
group by estado
having peso > 0
order by nome;

# where exists return a subset
select nome
from table_1
where exists
(select idade 
from table_1 
where idade > 90);

select nome
from table_1
where idade < any
(select nome
from table_1
where idade > 80);
