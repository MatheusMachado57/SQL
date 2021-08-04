-- Aula 1 - Verificando as permissões dos usuários

/*
Uma das coisas mais básicas quando se falamos em segurança é ver as permissões de acesso que cada usuário tem em seu MySQL
Uma das boas práticas é sempre manter o usuário root inacessivel via remoto, 
e criar usuários com restições específicas para cada banco de dados ou tabelas de seu interesse.
*/

-- Primeiro, vamos listar todos os usuários:
SELECT CONCAT(QUOTE(user),'@',QUOTE(host)) UserAccount FROM mysql.user;

-- Depois vamos criar um usuário e dar a eles algumas permissões:
CREATE USER 'teste'@'localhost';

-- Segue sua sintaxe:
GRANT privileges ON scope TO conta;

-- Vamos ver o root:
SHOW GRANTS FOR 'root'@'localhost';

-- Vamos criar um usuário comum:
CREATE USER 'teste'@'localhost' IDENTIFIED BY '123456';
SELECT CONCAT(QUOTE(user),'@',QUOTE(host)) UserAccount FROM mysql.user;
GRANT FILE ON *.* TO 'teste'@'localhost';
SHOW GRANTS FOR 'teste'@'localhost';
GRANT CREATE TEMPORARY TABLES, LOCK TABLES ON *.* TO 'teste'@'localhost';

-- Dar privilegios a um banco de dados em específico e em todas as suas tabelas:
GRANT ALL ON teste.* TO 'teste'@'localhost';

-- Permitir operações na tabela mysql.user
GRANT SELECT ON mysql.user TO 'teste'@'localhost';

-- Ou algo mais específico:
GRANT SELECT(User,Host), UPDATE(password_expired) ON mysql.user TO 'teste'@'localhost';

-- Agora, para tirar as permissões, usamos a palavra REVOKE
REVOKE FILE ON *.* FROM 'teste'@'localhost';
REVOKE CREATE TEMPORARY TABLES, LOCK TABLES ON *.* FROM 'teste'@'localhost';
REVOKE ALL ON teste.* FROM 'teste'@'localhost';
REVOKE SELECT(User,Host), UPDATE(password_expired) ON mysql.user FROM 'teste'@'localhost';
REVOKE SELECT ON mysql.user FROM 'teste'@'localhost';
SHOW GRANTS FOR 'user1'@'localhost';

-- Renomear a conta:
RENAME USER 'teste'@'localhost' TO 'teste2'@'localhost';

-- Para apagar a conta:
DROP USER 'teste'@'localhost';

-- Liks de ref:
-- https://dev.mysql.com/doc/refman/8.0/en/grant.html

