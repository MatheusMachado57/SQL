# Aula 1 - Fazendo o Backup

mysqldump teste -u root -p > dump.sql


mysqldump -uroot -p --all-databases --result-file=/tmp/dump.sql


mysqldump -uroot -p --lock-tables --databases teste --tables mail > teste-mail.sql

mkdir -p /data/backup/

vim backup.sh

#!/bin/sh
my_user='root'
my_pwd='123456'
db1='teste'
db2='mysql'
date_today=$(date	+%Y-%m-%d)
backup_dir='/data/backup/'
dump_file=$db1-$db2-$date_today'.sql'
/usr/bin/mysqldump	--user=$my_usr	--password=$my_pwd	--lock-tables --databases $db1 $db2	>$backup_dir$dump_file
exit

# Links de ref:
# https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html
# http://www.savepoint.blog.br/2010/05/06/dump-nao-e-backup/








