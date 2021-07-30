-- Aula 4 - Fazendo as conexões criptografadas

/*

Por padrão, as conexões não são encripgrafadas no MySQL, mas podemos deixar de modo mais seguro.

*/

-- Vamos ver se ele está com a criptgrafia habilitada:

SHOW VARIABLES LIKE '%ssl%';

-- Agora, vamos gerar:

# mysql_ssl_rsa_setup --uid=mysql

-- Agora, vamos achar onde elas estão:

# find /var/lib/mysql -name '*.pem' -ls

# vim /etc/mysql/mysql.conf.d/mysqld.cnf

ssl-ca=/var/lib/mysql/ca.pem
ssl-cert=/var/lib/mysql/server-cert.pem
ssl-key=/var/lib/mysql/server-key.pem
require_secure_transport = ON

-- Agora, vamos habilitar:

systemctl restart mysql

# mysql -u root -p --ssl-mode=REQUIRED

SHOW VARIABLES LIKE '%ssl%';

-- Agora, vamos criar um usuário e forçar ele a se conectar de modo seguro com SSL:

CREATE USER 'testessl'@'%' IDENTIFIED BY '123456' REQUIRE SSL;

CREATE DATABASE exemplo;

GRANT ALL ON exemplo.* TO 'testessl'@'%';

FLUSH PRIVILEGES;

-- Numa máquina cliente:

# mysql -u testessl -p -h 192.168.0.20 -P 3306 --ssl

-- Vamos ver se essa conexão está ou não segura:

\s

-- Liks de Ref:
-- https://dev.mysql.com/doc/refman/8.0/en/encrypted-connection-options.html
-- https://dev.mysql.com/doc/refman/8.0/en/using-encrypted-connections.html






































