USE shazam;

CREATE TABLE funcionarios(
cod_func            int,
nome        varchar(30),
cod_depto           int,
salário         decimal,
dt_admissão        date,
dt_nascto          date,
hr_nascto          time,
cod_banco           int);

INSERT INTO funcionarios VALUES
(1, 'João Anastácio',       1,  500.00, '1995-01-01', '1975-01-02', '15:12:13',    1),
(2, 'Pedro Brasona',        2,  800.00, '2001-02-05', '1980-12-01', '17:12:14',    2),
(3, 'Manoel da R. Pizzolo', 3, 1500.00, '1990-05-02', '1930-10-08', '12:00:00',    3),
(4, 'João Malha',           4,  189.00, '1999-04-10', '1988-04-04', '13:00:00',    4),
(5, 'Antônio Nascimento',   3,  200.00, '1985-01-10', '1967-01-10', '13:00:00', NULL),
(6, 'Maria de Jesus',       4,  180.00, '1985-02-11', '1967-02-11', '13:00:00', NULL),
(7, 'Raimundo Pizzolo',     4,  180.00, '1985-02-11', '1967-02-11', '14:00:00', NULL);

SELECT * FROM funcionarios;

CREATE TABLE DEPARTAMENTOS(
cod_depto             int, 
Nome           varchar(20)
);

INSERT INTO DEPARTAMENTOS VALUES
(1, 'Recursos Humanos'),
(2, 'Desenvolvimento'),
(3, 'Financeiro'),
(4, 'Editoração');

SELECT * FROM DEPARTAMENTOS;

CREATE TABLE BANCOS(
cod_banco                int,
Nome             varchar(20),
agência          varchar(10),
número_banco     varchar(10));

INSERT INTO BANCOS VALUES
(1, 'Banco do Brasil', '0407-3',  '6620-6'),
(2, 'Bradesco',         '500-4', '1246-88'),
(3, 'Bradesco',         '345-1',  '1232-2'),
(4, 'Itaú',           '2323-24',   '34534');

SELECT * FROM BANCOS;

#########################################################
#########################################################
#########################################################

SELECT funcionarios.cod_func, funcionarios.nome, funcionarios.cod_depto, funcionarios.salário, funcionarios.dt_admissão, funcionarios.dt_nascto, funcionarios.cod_banco FROM funcionarios;

SELECT fu.cod_func, fu.nome, fu.cod_depto, fu.salário, fu.dt_admissão, fu.dt_nascto, fu.cod_banco FROM funcionarios AS fu ;

SELECT * FROM funcionarios;

#############
SELECT cod_func AS codigo, nome AS descricao FROM funcionarios;
SELECT codigo = cod_func, descricao = nome FROM funcionarios;
SELECT * FROM funcionarios ORDER BY cod_func DESC;
SELECT * FROM funcionarios ORDER BY nome ASC;
SELECT * FROM funcionarios ORDER BY nome ASC, dt_admissão ASC;
SELECT * FROM funcionarios WHERE cod_func = 5;
SELECT cod_func, nome, cod_depto, dt_admissão FROM funcionarios WHERE cod_func = 5;
#
SELECT * FROM funcionarios WHERE dt_admissão  > '1990/05/02';
SELECT * FROM funcionarios WHERE dt_admissão  < '1990/05/02';
SELECT * FROM funcionarios WHERE dt_admissão >= '1990/05/02';
SELECT * FROM funcionarios WHERE dt_admissão <= '1990/05/02';
SELECT * FROM funcionarios WHERE cod_depto <> 4;
#
SELECT * FROM funcionarios WHERE nome LIKE'Joao%';
SELECT * FROM funcionarios WHERE nome LIKE'%Pizzolo';
SELECT * FROM funcionarios WHERE nome LIKE'%de%';
SELECT * FROM funcionarios WHERE nome LIKE'M%ri%';
#
SELECT * FROM funcionarios WHERE cod_depto = 4 AND dt_admissão = '1985/02/11';
SELECT * FROM funcionarios WHERE cod_banco = 2 OR cod_banco = 4;
SELECT * FROM funcionarios WHERE cod_depto = 4 AND dt_admissão = '1985/02/11' OR dt_admissão = '1985/01/10';
SELECT * FROM funcionarios WHERE cod_depto = 4 AND (dt_admissão = '1985/02/11' OR dt_admissão = '1985/01/10');
SELECT * FROM funcionarios WHERE cod_func = 2 AND cod_func = 3 AND cod_func = 7;
SELECT * FROM funcionarios WHERE cod_func = 2 OR cod_func = 3 OR cod_func = 7;
SELECT * FROM funcionarios WHERE cod_func IN (2,3,7);
SELECT * FROM funcionarios WHERE cod_func >= 2 AND cod_func <= 6;
SELECT * FROM funcionarios WHERE cod_func BETWEEN 2 AND 6;
#
SELECT distinct salário FROM funcionarios;
#
SELECT cod_depto, sum(salário) FROM funcionarios group by cod_depto;
# SELECT cod_depto, count()      FROM funcionarios group by cod_depto;
SELECT * FROM funcionarios WHERE cod_banco is null;
SELECT cod_func, nome, isnull(cod_banco, 0) FROM funcionarios;
SELECT * FROM funcionarios WHERE cod_func in (2,7);
SELECT * FROM funcionarios WHERE cod_func <> 2 AND cod_func <> 7;
SELECT * FROM funcionarios WHERE cod_func NOT in (2,7);
SELECT * FROM funcionarios WHERE cod_banco is not null;
SELECT * FROM funcionarios WHERE not cod_depto = 4;

# SELECT cod_depto,nome, total_funcs = (SELECT count() FROM funcionarios WHERE funcionarios.cod_depto = deptos.cod_depto) FROM deptos;

SELECT cod_func, nome, agencia= (SELECT agencia FROM bancos WHERE bancos.cod_banco = funcionarios. cod_banco), conta_bancaria = 
(SELECT numero_banco FROM bancos WHERE bancos.cod_banco = funcionarios.cod_banco) FROM funcionarios;
