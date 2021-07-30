-- Aula 3 - Alterando as permissões de acesso

/*

Nessa aula, vamos fazer as verificações de contas que podem ser acessados de qualquer lugar em qualquer máquina.

*/

-- Vamos verificar se temos usuários assim:

SELECT User, Host FROM mysql.user WHERE Host REGEXP '[%_]';

-- Depois, temos que alterar para que, aquele usuário tenha o acesso apenas o necessário:

RENAME USER 'replication'@'%' TO 'replication'@'192.168.0.%';


-- Ou

RENAME USER 'replication'@'%' TO 'replication'@'hostMASTER.seudominio.com';

-- Ou

RENAME USER 'replication'@'%' TO 'replication'@'%.seudominio.com';













