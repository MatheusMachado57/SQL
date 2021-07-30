-- Aula 12 - Index

CREATE TABLE livros (
isbn char(13) NOT NULL,
autor varchar(64) default NULL,
título varchar(64) NOT NULL,
PRIMARY KEY (isbn)
) ENGINE=InnoDB;

ALTER TABLE livros ADD INDEX IDX_autor(autor), ADD INDEX IDX_título(título);


SHOW INDEXES FROM livros;

ALTER TABLE livros DROP INDEX IDX_autor;

SHOW INDEXES FROM livros;

ALTER TABLE livros DROP INDEX IDX_autor, DROP INDEX IDX_título;

SHOW INDEXES FROM livros;


-- Links de ref
-- https://dev.mysql.com/doc/refman/8.0/en/mysql-indexes.html
-- https://pt.stackoverflow.com/a/193305/24678








