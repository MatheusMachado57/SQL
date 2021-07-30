show databases;
use shazam_0;

create table table_3(
nome      varchar(30)   not null,
t         datetime      not null, 
size      bigint,
cor       enum('azul', 'vermelho', 'amarelo'),
comida     set('pizza', 'burger', 'japa', 'salada', 'churrasco'),
primary key (t)    
);

insert into table_3 values
('Ze',  '1991-10-10 06:06:06', 12345678,     'azul',             'pizza,burger'),
('MM',  '1995-04-28 04:08:12', 98765432, 'vermelho',  'burger,churrasco,salada'),
('SZ',  '1999-12-12 12:12:12',     NULL,  'amarelo',                     'japa');

select * from table_3;
select * from table_3 limit 2;
select * from table_3 where size is null;
select * from table_3 where size is not null;
select t, if (size is null, 'valor desconhecido', size) as size from table_3;
select count(*) from table_3;

# clones de tabelas
create table xablau like table_3; -- copia só a estrutura;
select * from xablau;

insert into xablau select * from table_3 where size > 0;
select * from xablau;

# tabela temporária
create temporary table table_new like xablau;
select * from table_new;

drop table xablau;

select connection_id();
