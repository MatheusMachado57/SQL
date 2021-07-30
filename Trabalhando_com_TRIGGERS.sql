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

#################################################################

create table typed_number (
id             tinyint, 
float_values   float, 
decimal_values decimal(3,2));

insert into typed_number values
(1, 1.1, 1.1),
(2, 1.1, 1.1),
(3, 1.1, 1.1);

select 	* 
from typed_number;

select 
sum(float_values), 
sum(decimal_values) 
from typed_number;

create table temp ( 
id    int,
coll  double,
col2  double);

insert temp values 
(1,   5.30,   2.30),
(1,  -3.00,   0.00),
(2,   0.10, -10.00),
(2, -15.20,   4.00),
(2,   0.00,  -7.10),
(3,   0.00,   2.30),
(3,   0.00,   0.00);

select * from temp;

select id, 
sum(coll) as v1, 
sum(col2) as v2
from temp
group by id
having v1 <> v2;

