create database if not exists aula02bd;
use aula02bd;

create table if not exists Cliente(

cpf varchar(11) primary key,
nome varchar(50),
idade int,
telefone varchar(50),
cidade varchar(50),
totalCompra float
);

#insert
insert into Cliente(cpf, nome, idade, telefone, cidade, totalCompra) values ('123456789', 'João Lucas', 24, 99845-6955, 'Pouso Alegre', 145 );
insert into Cliente(cpf, nome, idade, telefone, cidade, totalCompra) values ('987456321', 'Joana', 45, 99845-7875, 'Santa Rita do Sapucaí', 130.25 );
insert into Cliente(cpf, nome, idade, telefone, cidade, totalCompra) values ('123896789', 'Pedro', 25, 96785-7855, 'Itajuba', 90.5 );
insert into Cliente(cpf, nome, idade, telefone, cidade, totalCompra) values ('123444329', 'Raissa', 21, 99845-6655, 'Varginha', 269 );
insert into Cliente(cpf, nome, idade, telefone, cidade, totalCompra) values ('123345789', 'Maria Isadora', 10 , 99435-6955, 'Campinas', 1100 );
insert into Cliente(cpf, nome, idade, telefone, cidade, totalCompra) values ('127896789', 'Gabriel', 22, 98845-5455, 'São Paulo', 406 );
insert into Cliente(cpf, nome, idade, telefone, cidade, totalCompra) values ('122356789', 'Vinícius', 19, 99845-5408, 'Cambuquira', 209 );

#SELECT DE TODOS OS REGISTROS
select * from Cliente;

#SELECT COM FILTRO
select nome, idade, cidade from CLiente WHERE cidade = "Pouso Alegre";

#SELECT COM OPERADORES LOGICOS
select nome, cidade, totalCompra FROM Cliente WHERE totalCompra >= 200 AND NOT cidade = "Itajuba"

#SELECT COM FUNÇÂO PRONTA
#SELECT max(totalCompra), nome FROM Cliente;

#SELECT COM FILTRO DE TEXTO
SELECT * FROM Cliente nome LIKE "JO_____%";

#SELECT COM NUMERO DE LINHAS
SELECT nome , telefone FROM Cliente LIMIT 3;

#SELECT SEM REPETIÇÕES
SELECT DISTINCT cidade FROM Cliente;
