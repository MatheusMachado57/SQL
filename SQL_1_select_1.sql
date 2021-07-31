show databases;
create database shazam_0;
# drop database shazam_0;
use shazam_0;

create table table_0 (nothing int);
drop   table table_0;

create table table_1 (
id       int           not null,     -- caso não queira permitir que seja inserido uma nova linha sem tal informação;
nome     varchar(50)   not null,
estado   varchar(50)   not null,
idade    int,
sexo     varchar(50),
peso     decimal(5,2),
contr    date, -- usa o comando date;
primary key (id));

desc table_1;

INSERT INTO table_1 VALUES
(152,   'Andre', 'MG',   23, "M", 23.50, '2018-01-22'),
(222, 'Barbara', 'SP',   45, "F", 34.34, '2018-05-15'),
(451,  'Carlos', 'MG',   12, "M", 65.76, '2017-02-05'),
(754, 'Eduardo', 'SP',   21, "M", 87.12, '2018-04-10'),
(897, 'Juliana', 'RJ',   98, "F", 12.87, '2017-03-01'),
(852,   'Maria', 'RJ',   66, "F", 54.34, '2018-05-30'),
(997, 'Ricardo', 'MG',   42, "M", 34.28, '2018-05-25'),
(535, 'Vanessa', 'SP',   37, "F", 76.09, '2017-04-30'),
(234,    'Alex', 'ES', NULL, "M",  NULL, '2016-03-04');

select * from table_1;

select nome, estado, idade, peso      -- colunas chamadas
from table_1                          -- tabela chamada
where sexo = 'M'                      -- condição 1      
and not estado = "SP"                 -- e condição 2
or peso > 40                          -- ou condição 3
and idade between 20 and 50           -- e condição 4
and nome is not null                  -- e condição 5
order by peso, idade asc              -- ordenado por
limit 2;                              -- limite de linhas chamadas

select * from table_1;

update table_1 set nome = 'Gilberto' where id = 152;

select * from table_1;

# delete from table_1;
delete from table_1 where id = 152;
select * from table_1;

select min(idade) as menor_idade, max(idade) as maior_idade from table_1;
select count(peso) from table_1 where idade > 40;
select avg(peso) from table_1 where idade > 40;
select sum(peso) from table_1 where idade > 40;

# Finds any values that start with "a"
select * from table_1 where nome like 'a%';

# Finds any values that end with "a"
select * from table_1 where nome like '%a';

# Finds any values that have "or" in any position
select * from table_1 where nome like '%a%';

# Finds any values that have "a" in the second position
select * from table_1 where nome like '_a%';

# Finds any values that start with "a" and are at least 2 characters in length
select * from table_1 where nome like 'a__%';

# Finds any values that start with "a" and ends with "x"
select * from table_1 where nome like 'a%x';

# Finds any values that start with "a", "b" or "j"
select * from table_1 where idade like '[abj]%';

# Finds any values that not start with "a", "b" or "j"
select * from table_1 where idade like '[!abj]%';
select * from table_1 where idade not like 'abj%';

# selects all customers that are named as "Barbara" or "Carlos"
select * from table_1 where nome in ('Barbara', 'Carlos');

# selects all customers that are not named as "Barbara" or "Carlos"
select * from table_1 where nome not in ('Barbara', 'Carlos');

# ??
select * from table_1 where nome in (select estado from suppliers);

# Chamando a variável por outro nome;
select nome as Nome, idade as Idade, peso as Peso from table_1;
select nome, peso + idade as Address from table_1;
select nome as Nome , concat(id,', ', sexo,', ', Estado) as Info, idade as Idade from table_1;
