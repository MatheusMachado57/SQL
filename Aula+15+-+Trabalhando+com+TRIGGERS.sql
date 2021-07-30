-- Aula 15 - Trabalhando com TRIGGERS


CREATE TABLE t (porcentagem INT, dt DATETIME);


delimiter $ -- Ao utilizar o DELIMITER, você diz ao mysql, onde seu script tem início, e onde encerra. 
CREATE TRIGGER bi_t BEFORE INSERT ON t
FOR EACH ROW BEGIN
SET NEW.dt = CURRENT_TIMESTAMP;
IF NEW.porcentagem < 0 THEN
SET NEW.porcentagem = 0;
ELSEIF NEW.porcentagem > 100 THEN
SET NEW.porcentagem = 100;
END IF;
END$
delimiter ;


INSERT INTO t (porcentagem) VALUES(-2); DO SLEEP(2);
INSERT INTO t (porcentagem) VALUES(30); DO SLEEP(2);
INSERT INTO t (porcentagem) VALUES(120);

SELECT * FROM t;


-- Links de ref:
-- https://dev.mysql.com/doc/refman/8.0/en/trigger-syntax.html











