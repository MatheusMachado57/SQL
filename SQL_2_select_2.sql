show databases;
use shazam_0;

create table table_2 (
id       int           not null,
nome     varchar(50)   not null,
idade    int,
sexo     varchar(50),
peso     decimal(5,2),
contr    date,
house    varchar(50),
primary key (id)
);

desc table_2;

insert into table_2 values
(152,   'Andre', 23, "M", 23.50, '2018-01-22',  'Sonserina'),
(222, 'Barbara', 45, "F", 34.34, '2018-05-15', 'Grifinória'),
(451,  'Carlos', 12, "M", 65.76, '2017-02-05',  'Lufa-Lufa'),
(555, 'Matheus', 29, "M", 95.12, '2018-03-10',   'Corvinal'),
(229,  'Angela', 90, "F", 23.76, '2015-06-03',  'Lufa-Lufa');

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

##############################

show table status like 'table_1';
alter table table_1 engine = MyISAM;
show table status like 'table_1';

select * 
from table_1 
where estado = 'MG'
order by field(nome, 'Andre', 'Ricardo', 'Carlos');

select count(if(dayofweek(contr) = 7, 1, null)) as 'sábado', 
       count(if(dayofweek(contr) = 1, 1, null)) as 'domingo' from table_1;

select sum(idade) as 'total_idade', 
       avg(peso)  as 'media_peso' from table_1;
       
select distinct estado from table_1;
select count(distinct(estado)) from table_1;

create view xablau as select count(if(dayofweek(contr) in (1,7),1,null)) as 'dia da semana 1',
						     count(if(dayofweek(contr) in (1,7),null,1)) as 'dia da semana 2' from table_1;

select * from xablau;

select max(idade)
as 'idade máxima',
estado
from table_1
group by estado;

#######################
show table status like 'table_2';
select * from table_2; 

alter table table_2 
add index idx_nome(nome);

show indexes from table_2;

############################
alter table table_1 engine = InnoDB;

select * from table_1;
select * from table_2;