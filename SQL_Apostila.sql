show databases;
create database shazam_1;
use shazam_1;

create table table_func(
cod_func    int         not null,
nome        varchar(50) not null, 
cod_dept    varchar(50) not null,
salário     bigint,
dt_admissao date,
dt_nasc     time,
cod_banco   int,
primary key (cod_func));

insert table_func values 
(1, 'João Anástácio', '1', 500.00, '1995-01-01', '1975-01-02 15:12:13', 1),
(2, 'Pedro Brasona', 2, 800.00, '2001-02-05', '1980-12-01 17:12:14', 2),
(3, 'Manoel da R. Pizzolo', 3, 1500.00, '1990-05-02', '1930-10-08 12:00:00', 3),
(4, 'João Malha', 4, 189.00, '1999-04-10', '1988-04-04 13:00:00', 4),
(5, 'Antônio Nascimento', 3, 200.00, '1985-01-10', '1967-01-10 13:00:00', (NULL)),
(6, 'Maria de Jesus', 4, 180.00, '1985-02-11', '1967-02-11 13:00:00', (NULL)),
(7, 'Raimundo Pizzolo', 4, 180.00, '1985-02-11', '1967-02-11 14:00:00', (NULL));

select * from table_func;

create table table_dept(
cod_dep   varchar(50),
nome      varchar(50),
primary key (cod_dep));

insert table_dept values
('1', 'Recursos Humanos'),
('2', 'Desenvolvimento'),
('3', 'Financeiro'),
('4', 'Editoração');

select * from table_dept;

create table table_bancos(
cod_banco    int,
nome         varchar(50),
agência      varchar(50),
número_banco varchar(50),
primary key (cod_banco));

insert table_bancos values
(1, 'Banco do Brasil', '0407-3', '6620-6'),
(2, 'Bradesco', '500-4', '1246-88'),
(3, 'Bradesco', '345-1', '1232-2'),
(4, 'Itaú', '2323-24', '34534');

select * from table_bancos;

SELECT fu.cod_func, fu.nome, fu.cod_dept, fu.salário, fu.dt_admissao, fu.dt_nasc, fu.cod_banco
FROM table_func AS fu;

SELECT * FROM table_func ORDER BY cod_func DESC;
SELECT * FROM table_func WHERE cod_func = 5;
SELECT * FROM table_func WHERE dt_admissao >= '1990/05/02';
SELECT * FROM table_func WHERE cod_dept <> 4;