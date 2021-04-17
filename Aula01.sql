show databases;
create database titanicDB;
use titanicDB;

CREATE TABLE titanic (
pclass       char(3),
survived     char(1),
name      varchar(100),
sex          char(6),
age          char(11),
sibsp     varchar(16),
parch     varchar(16),
ticket    varchar(20),
fare      varchar(100),
cabin     varchar(16),
embarked  varchar(12),
boat      varchar(50),
body      varchar(32),
home_dest varchar(200)
);

SELECT * FROM titanicdb.titanic;
#################################### Fim da Parte 1

# selecionar Table Data Import Wizard na tabela ao lado para importar a tabela
SELECT * FROM titanicdb.titanic;
