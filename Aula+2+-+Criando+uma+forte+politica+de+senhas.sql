-- Aula 2 - Criando uma forte politica de senhas

/*

Nessa aula, vamos criar uma politica forte para a criação de senhas em nosso Banco de dados

*/

-- Primeiro, vamos ver onde ficam os plugins de nosso MySQL e depois habilitar o plugin de verificação de senhas:

SELECT @@plugin_dir;

vim /etc/mysql/mysql.conf.d/mysqld.cnf

[mysqld]
plugin-load-add=validate_password.so
plugin-load-add=adt_null.so

service mysql restart

mysql -u root -p

SHOW VARIABLES LIKE 'validate_password%';

/*

Veja que não temos uma politica forte de senhas, mas vamos criar uma regra que diz que temos que ter:

Deve conter pelo menos 10 caracteres, caracteres maiúsculos e minúsculos, pelo menos dois dígitos
e deve conter pelo menos um caractere especial (não alfanumérico).

*/

vim /etc/mysql/mysql.conf.d/mysqld.cnf

[mysqld]
plugin-load-add=validate_password.so
validate_password_length=10
validate_password_mixed_case_count=1
validate_password_number_count=2
validate_password_special_char_count=1

service mysql restart

mysql -u replication -p

SHOW VARIABLES LIKE 'validate_password%';

-- Agora, vamos tentar mudar a senha de nosso usuário:

-- Vai dar erro:
SET PASSWORD = PASSWORD('weak-password');

-- Vai dar certo!
SET PASSWORD = PASSWORD('Str0ng-Pa33w@rd');

-- Caso queremos dar ou alterar uma senha, mas primeiro verifique se ela não é fraca.

-- valor de 0 (fraco) a 100 (forte)

SELECT VALIDATE_PASSWORD_STRENGTH('abc') ;

SELECT VALIDATE_PASSWORD_STRENGTH('senha-fraca');

SELECT VALIDATE_PASSWORD_STRENGTH('S3nhA-F88r%te');














