create database if not exists aula2bd;

use aula2bd;

create table if not exists usuario(
id int not null auto_increment primary key,
nome varchar(50), 
ano_nasc int,
pais varchar(50)
);

#INSERT
INSERT INTO usuario(nome, ano_nasc, pais) VALUES ('Fulano', 2001, 'Brasil');
INSERT INTO usuario() VALUES (default, "Ciclano", 1999, 'Australia');
INSERT INTO usuario(nome, ano_nasc, pais) VALUES ("Beltrano", 1958, 'Italia');

#SELECT

SELECT * FROM usuario;

#UPDATE
UPDATE usuario SET nome = "usuario X" WHERE id = 2;
UPDATE usuario SET ano_nasc = 2002, pais = "Argentina" WHERE id = 1;

#DELETE
DELETE FROM usuario WHERE id = 1;
DELETE FROM usuario WHERE id = 3;


