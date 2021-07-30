show databases;
use shazam_0;

###### ??????

set @tbl_nome = concat('tmp_tbl_', connection_id());
select @tbl_nome;

set @stmt = concat('drop table if exists', @tbl_nome);
select @stms;

prepare stms from @stms;
execute stms;
deallocate prepare stmt;

set @stms = concat('create table', $tbl_nome, ' (i int) ');

prepare stmt from @stmt;
execute stmt;
deallocate prepare stmt;

show tables;