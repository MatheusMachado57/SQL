-- Aula 10 - Trabalhando com operadores no MySQL

SELECT COUNT(*) FROM log_moto;

SELECT COUNT(*) FROM log_moto WHERE milhas > 200;

SELECT COUNT(*) FROM log_moto WHERE nome = 'João';


SELECT COUNT(*), COUNT(minha_coluna) FROM minha_tabela;

SELECT COUNT(IF(DAYOFWEEK(data_viagem)=7,1,NULL)) AS 'Viagens no sábado', COUNT(IF(DAYOFWEEK(data_viagem)=1,1,NULL)) AS 'Viagens no domingo' FROM log_moto;

SELECT COUNT(IF(DAYOFWEEK(data_viagem) IN (1,7),1,NULL)) AS 'viagens no fim de semana', COUNT(IF(DAYOFWEEK(data_viagem) IN (1,7),NULL,1)) AS 'viagens de segunda a sexta' FROM log_moto;

SELECT MIN(t) AS 'Mais antigo', MAX(t) AS 'Mais recente', MIN(size) AS 'Menor', MAX(size) AS 'Maior' FROM mail;

SELECT SUM(size) AS 'tráfego total', AVG(size) AS 'tamanho médio da mensagem' FROM mail;


SELECT SUM(milhas) AS 'total de milhas', AVG(milhas) AS 'milhas médias/dia' FROM log_moto;

SELECT DISTINCT nome FROM log_moto ORDER BY nome;

SELECT nome FROM log_moto ORDER BY nome;

SELECT COUNT(DISTINCT nome) FROM log_moto;

SELECT DISTINCT srcuser, dstuser FROM mail ORDER BY srcuser, dstuser;

SELECT COUNT(DISTINCT srcuser, dstuser) FROM mail;


CREATE VIEW view_viagem AS SELECT COUNT(IF(DAYOFWEEK(data_viagem) IN (1,7),1,NULL)) AS 'viagens de fim de semana', COUNT(IF(DAYOFWEEK(data_viagem) IN (1,7),NULL,1)) AS 'viagens de segunda a sexta' FROM log_moto;


SELECT * FROM view_viagem;


-- Links de ref:
-- https://dev.mysql.com/doc/refman/8.0/en/create-view.html






































