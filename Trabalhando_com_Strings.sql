###########################################################
-- Aula 8 - Trabalhando com Strings

CREATE TABLE temp_char 
(data CHAR(3));

INSERT INTO temp_char(data)  
VALUES('abc'), (' a ');

SELECT data,  
LENGTH(data) 
FROM temp_char;

CREATE TABLE temp_varchar 
(data VARCHAR(255));

INSERT INTO temp_varchar(data) 
VALUES('abc'), (' a ');

SELECT data, 
LENGTH(data) 
FROM temp_varchar;

CREATE TABLE assuntos 
(nome VARCHAR(40), 
 corrente ENUM('arte', 'comercio', 'ciencia'));

INSERT INTO assuntos (nome, corrente) VALUES 
('biologia','ciencia'), 
('estatisticas','comercio'), 
('historia','arte');

SELECT nome, corrente 
FROM assuntos 
WHERE corrente = 'comercio';

UPDATE assuntos 
SET corrente = 'ciencia' 
WHERE corrente = 'comercio';

SELECT * 
FROM assuntos;

CREATE TABLE usuarios
(id_usuario INT UNSIGNED NOT NULL, 
 preferencias JSON NOT NULL);

INSERT INTO usuarios(id_usuario, preferencias) 
VALUES(1, '{"pag_tamanho": 10, "gostos": {"esportes": 1}}');

SELECT preferencias 
FROM usuarios;

INSERT INTO usuarios(id_usuario, preferencias) 
VALUES(2, 
JSON_OBJECT("pag_tam", 1, "network", 
 JSON_ARRAY("GSM", "CDMA", "WIFI")));

SELECT preferencias 
FROM usuarios;

#########################################################

create table temp2(hobbies set('travel', 'sport', 'fine dining', 'dancing'));
insert into temp2 (hobbies) values (9);
select hobbies from temp2;

create table events2(
id int auto_increment primary key,
event_name varchar(255),
visitor varchar(255),
properties json,
browser json);

insert into events2(event_name, visitor, properties, browser)
values(
'pageview',
'l',
'{"page":"/"}',
'{ "name": "Safari", "os": "Mac", "resolution": {"x": 1920, "y": 1080}}');

select * from events2;

# select id, event_name 
# where '$.name' != browser 
# from events2;