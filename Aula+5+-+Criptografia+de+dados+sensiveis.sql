-- Aula 5 - Criptografia de dados sensiveis

CREATE TABLE `usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Hash MD5

INSERT INTO `usuarios` (`email`, `senha`) VALUES ('usuario1@teste.com.br', MD5('senha123'));

SELECT `senha` FROM `usuarios` WHERE `email` = 'usuario1@teste.com.br';

-- SHA1

INSERT INTO `usuarios` (`email`, `senha`) VALUES ('usuario2@teste.com.br', SHA1('senha123'));

SELECT `senha` FROM `usuarios` WHERE `email` = 'usuario2@teste.com.br';

-- SHA2

INSERT INTO `usuarios` (`email`, `senha`) VALUES ('usuario3@teste.com.br', SHA2('senha123', 512));

SELECT `senha` FROM `usuarios` WHERE `email` = 'usuario3@teste.com.br';

-- Função ENCRYPT()

INSERT INTO `usuarios` (`email`, `senha`) VALUES ('usuario4@teste.com.br', ENCRYPT('senha123'));

SELECT `senha` FROM `usuarios` WHERE `email` = 'usuario4@teste.com.br';

-- Um comparativo entre as senhas:

SELECT `senha` FROM `usuarios`;


CREATE TABLE `usuario2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `senhas` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ENCODE

INSERT INTO `usuario2` (`email`, `senhas`) VALUES ('usuario1@binario.com.br', ENCODE('senha123', 'segredo'));

SELECT `senhas` FROM `usuario2` WHERE `email` = 'usuario1@binario.com.br';
 
SELECT DECODE(`senhas`, 'segredo') AS `senhas` FROM `usuario2` WHERE `email` = 'usuario1@binario.com.br';

-- AES_ENCRYPT

INSERT INTO `usuario2` (`email`, `senhas`) VALUES ('usuario2@binario.com.br', AES_ENCRYPT('senha123', 'segredo'));

SELECT AES_DECRYPT(`senhas`, 'segredo') AS `senhas` FROM `usuario2` WHERE `email` = 'usuario2@binario.com.br';

-- DES_ENCRYPT

INSERT INTO `usuario2` (`email`, `senhas`) VALUES ('usuario3@binario.com.br', DES_ENCRYPT('senha123', 'segredo'));

SELECT DES_DECRYPT(`senhas`, 'segredo') AS `senhas` FROM `usuario2` WHERE `email` = 'usuario3@binario.com.br';


-- Links de ref:
-- https://dev.mysql.com/doc/refman/8.0/en/encryption-functions.html









