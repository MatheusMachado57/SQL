-- Aula 4 - Clones e tabelas temporarias

use teste;

show tables;

CREATE TABLE mail2 LIKE mail;


INSERT INTO mail2 SELECT * FROM mail WHERE srcuser = 'gene';

INSERT INTO mail2 SELECT * FROM mail WHERE srcuser = 'teste1';


SELECT * FROM mail2;


CREATE TEMPORARY TABLE mail SELECT * FROM mail;

SELECT COUNT(*) FROM mail;

DELETE FROM mail;

SELECT COUNT(*) FROM mail;

DROP TEMPORARY TABLE mail;

SELECT COUNT(*) FROM mail;

DROP TEMPORARY TABLE IF EXISTS mail;

-- Links de Referência:
https://dev.mysql.com/doc/refman/8.0/en/create-table.html





















