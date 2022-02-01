# Aprendizado: criando database e tabela
show databases;
create database shazam;
use shazam;

CREATE TABLE base_compras (
Id           int,
Nome         varchar(50),
Sobrenome    varchar(50),
Estado       varchar(2),
Gastos       decimal,
Data_Compra  date
);

DESC base_compras;

INSERT INTO base_compras VALUES
(152,   'Andre',    'Silva', 'MG', 351.00, '2018-01-22'),
(222, 'Barbara',   'Toledo', 'SP', 250.00, '2018-05-15'),
(451,  'Carlos', 'Pinheiro', 'MG', 455.00, '2017-02-05'),
(754, 'Eduardo',    'Silva', 'SP', 390.00, '2018-04-10'),
(897, 'Juliana', 'Oliveira', 'MG', 150.00, '2017-03-01'),
(852,   'Maria',     'Lima', 'MG', 325.00, '2018-05-30'),
(997, 'Ricardo',  'Pereira', 'MG', 332.00, '2018-05-25'),
(535, 'Vanessa',    'Costa', 'SP', 241.00, '2017-04-30'),
(123, 'Ronaldo',  'Lacerda', 'RJ', 907.00, '2016-09-12'),
(321,    'João',  'Azevedo', 'RJ', 870.00, '2015-07-23');

SELECT * FROM shazam.base_compras;
SELECT Id from base_compras;
SELECT Id, Nome, Estado from base_compras;

# Aprendizado: FILTRAGEM

SELECT * from base_compras WHERE Estado = "SP";
SELECT * from base_compras WHERE Estado = 'SP' and Gastos > 300;
SELECT * from base_compras WHERE Estado = 'SP' or Gastos > 300;
SELECT * from base_compras WHERE NOT Estado = 'SP';
select * from base_compras where nome like '%arl%';
select * from base_compras where substring(nome, 1, 2) = "ma";
select * from base_compras where substring(nome, 1, 1) = "j";

# Aprendizado: split_apart

select split_part(Data_Compra, '-', 2);

# Aprendizado: SELECTION

/*cria tabela com novo campo*/
CREATE TABLE base_compras_v2 
AS SELECT *, (Id || Nome || Sobrenome) AS Id_New 
FROM base_compras;

/*exibe elementos da tabela*/
SELECT * FROM base_compras_v2;

/*tira a tabela se a mesma existir*/
# drop table if exists base_compras_v2;

SELECT * from base_compras ORDER BY Id DESC;
SELECT * from base_compras ORDER BY Id ASC ;

/*insere linha com valor nulo*/
INSERT INTO base_compras_v2 
VALUES (645, NULL, 'Ferreira', NULL, 555.57, '2018-05-05', NULL);

/*mostra elementos da tabela*/
SELECT * from base_compras_v2;

SELECT * FROM base_compras_v2 
WHERE Id_New IS NULL;

CREATE TABLE base_Id_NOT_NULL as 
SELECT * FROM base_compras_v2 
WHERE Id_New IS NOT NULL;

SELECT * FROM shazam.base_id_not_null;

SELECT max(Gastos), min(Gastos),
       avg(Gastos), count(Id),
       count(Id) as Contagem_Id
       FROM base_id_not_null;

# Aprendizado: GROUP BY

-- exclui tabela caso ela exista
drop table base_compras;

-- cria os campos da tabela
CREATE TABLE base_compras (
Id int,
Nome varchar(50),
Sobrenome varchar(50),
Estado varchar(2),
Gastos decimal,
Data_Compra date
);

-- insere valores na tabela 
INSERT INTO base_compras
VALUES
(152,   'Andre',    'Silva', 'MG', 351.50, '2018-01-22'),
(222, 'Barbara',   'Toledo', 'SP', 250.10, '2018-05-15'),
(451,  'Carlos', 'Pinheiro', 'MG', 455.00, '2017-02-05'),
(754, 'Eduardo',    'Silva', 'SP', 390.10, '2018-04-10'),
(897, 'Juliana', 'Oliveira', 'MG', 150.50, '2017-03-01'),
(852,   'Maria',     'Lima', 'MG', 325.90, '2018-05-30'),
(997, 'Ricardo',  'Pereira', 'MG', 332.59, '2018-05-25'),
(535, 'Vanessa',    'Costa', 'SP', 241.57, '2017-04-30'),
(123, 'Ronaldo',  'Lacerda', 'RJ', 907.00, '2016-09-12'),
(321,    'João',  'Azevedo', 'RJ', 870.00, '2015-07-23');

-- visualiza tabela
select * from base_compras;

-- sumariza os gastos por Estado
select estado, sum(gastos) as gasto_total, 
               avg(gastos) as media_gastos 
               from base_compras 
               group by estado 
               order by estado;

select year(Data_Compra) as Ano,
       month(Data_Compra) as Mês,
       day(Data_Compra) as Dia 
       from base_compras;

select estado, year(Data_Compra) as Ano, 
			   sum(gastos) as gasto_total, 
               avg(gastos) as media_gastos 
               from base_compras 
               group by 1,2 
               order by 1,2;

# Aprendizado: JOIN 

/*cria a base com identificacao das lojas*/
CREATE TABLE base_lojas (
Id int,
Loja varchar(50),
Data_Compra date
);

INSERT INTO base_lojas
VALUES
(152, 'Loja C', '2018-01-22'),
(222, 'Loja A', '2018-05-15'),
(451, 'Loja C', '2017-02-05'),
(754, 'Loja A', '2018-04-10'),
(897, 'Loja E', '2017-03-01'),
(852, 'Loja E', '2018-05-30'),
(997, 'Loja D', '2018-05-25'),
(535, 'Loja B', '2017-04-30');

SELECT * FROM base_lojas;

/*traz a identificacao da loja*/
CREATE TABLE base_Id_NOT_NULL_v2 
AS SELECT A.*, B.Loja 
FROM base_Id_NOT_NULL 
as A LEFT JOIN base_lojas 
as B on A.Id = B.Id;

/*mostra o resultado do join*/
SELECT * FROM shazam.base_id_not_null_v2;

# Aprendizado: Soma Cumulativa

SELECT *, 
       SUM(Gastos) OVER (PARTITION BY Estado order by Id, Estado) AS cum_amt 
FROM base_compras;

select Gastos,  
       Estado,
       min(Gastos) over(partition by Estado) as Min_do_Estado, 
       max(Gastos) over(partition by Estado) as Max_do_Estado
from base_compras_v2 
order by Estado, Gastos;

select * from base_compras_v2 order by Id;

select t1.Id, t1.Gastos, SUM(t2.Gastos) as sum 
from base_compras t1 
inner join base_compras t2 
on t1.Id >= t2.Id 
group by t1.Id, t1.Gastos 
order by t1.id;



