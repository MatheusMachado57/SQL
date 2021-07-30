create table work_days(
year   int,
week   int,
days   bit(7),
primary key (year, week));

insert into work_days values(2017, 4, b'0111011');
# insert into work_days values(2017, 4, 0111011);
select year, week, days from work_days;
select year, week, bin(days) from work_days;

create table bit_values(val bit(7));
insert into bit_values values(b'1011');
insert into bit_values values(b'1101');
select * from bit_values;

create table boolean_values (value bit);
insert into boolean_values values(b'1');
insert into boolean_values values(b'0');
select * from boolean_values;

########################################################
create table tempo_val(
t1   time,
t2   time);

insert into tempo_val (t1, t2) values
('12:00:00', '15:00:00'), 
('05:01:30', '02:40:20'), 
('12:43:12', '09:05:40');

select * from tempo_val;

########################################################
create table data_val(d date);

insert into data_val (d) values
('1870-03-12'), 
('1995-03-04'), 
('2000-09-09');

select d from data_val;
select d, date_format(d, '%d de %M de %Y') as 'dia por escrito' from data_val;
select d, date_format(d, '%e/%c/%y %r') as 'dia por escrito e detalhes' from data_val;

#########################################################
select curdate(), curtime(), now();

select curdate(), 
date_add(curdate(), interval 3 day) as 'daqui a 3 dias', 
date_sub(curdate(), interval 3 day) as '3 dias atrás'; 

select curdate(), 
date_add(now(), interval 84 hour) as 'daqui a 84 horas';