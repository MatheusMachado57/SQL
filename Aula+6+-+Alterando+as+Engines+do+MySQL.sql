-- Aula 6 - Alterando as Engines do MySQL

SHOW ENGINES\G

SHOW TABLE STATUS LIKE 'mail'\G

SHOW CREATE TABLE mail\G

ALTER TABLE mail ENGINE = MyISAM;

SHOW TABLE STATUS LIKE 'mail'\G

-- Links de referencia:
https://dev.mysql.com/doc/refman/8.0/en/storage-engines.html
https://dev.mysql.com/doc/refman/8.0/en/innodb-storage-engine.html
https://dev.mysql.com/doc/refman/8.0/en/myisam-storage-engine.html







