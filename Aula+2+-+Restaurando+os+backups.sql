-- Aula 2 - Restaurando os backups

# Depois de fazer os backups, agora é hora de fazer as restaurações deles:

mysql --user=root --password --execute	"DROP DATABASE teste;"

mysql --user=root --password --execute="CREATE DATABASE teste;"

mysql --user=root teste --password < teste.sql

mysql -u root -p





