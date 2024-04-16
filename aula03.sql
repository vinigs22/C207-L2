DROP DATABASE IF EXISTS aula3;
CREATE DATABASE aula3;
USE aula3;

#COMANDO PARA DESATIVAR O SAFE MODE
SET SQL_SAFE_UPDATES = 0;

#QUESTAO 1

# Ela garante que cada linha em uma tabela seja única, não podendo haver duas linhas com o mesmo valor na coluna da chave primária.
# Tambem garante uma maneira única de identificar cada registro na tabela, facilitando operações de pesquisa e relacionamento de tabelas

#QUESTAO 2
CREATE TABLE IF NOT EXISTS pessoa(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    cargo VARCHAR(45)
);

#RESPOSNDA A QUESTÂO 2 AQUI

SELECT id, nome, endereco, cargo FROM pessoa;

#a)
UPDATE pessoa SET nome = 'Gabriel' WHERE id = 1;

#b)
SELECT nome, endereco FROM pessoa;

#c)
DELETE FROM pessoa ORDER BY id DESC LIMIT 1;

#d)
INSERT INTO pessoa (nome, endereco, cargo) VALUES ('Pedro', 'Endereco1', 'Cargo1'), ('João', 'Endereco2', 'Cargo2'), ('Maria Isadora', 'Endereco3', 'Cargo3');


#QUESTAO 3
CREATE TABLE IF NOT EXISTS empresa(
	matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(45),
    cargo VARCHAR(45),
    nProjetos INT
);

#RESPOSNDA A QUESTÂO 3 AQUI
# a) Faça a inserção dos dados na tabela. 

insert into empresa(matricula,nome,cpf,cargo,nProjetos) values (1, "Junior", "000.000.000-00", "GP", 2);
insert into empresa(matricula,nome,cpf,cargo,nProjetos) values (2, "Maria", "111.111.111-11", "Desenvolvedor", 3);
insert into empresa(matricula,nome,cpf,cargo,nProjetos) values (3, "Carlos", "222.222.222-22", "Tester", 4);
insert into empresa(matricula,nome,cpf,cargo,nProjetos) values (4, "Julia", "333.333.333-33", "Desenvolvedor", 5);

SELECT * FROM empresa;
# b) Busque quantos funcionários tem 4 ou mais projetos.

SELECT matricula,nome, cpf, cargo, nProjetos FROM empresa WHERE nProjetos >= 4;

# c) Busque a média aritmética do número de projetos dos funcionários que não são do cargo Gerente de Projetos

SELECT AVG(nProjetos) AS media_projetos FROM empresa WHERE cargo <> 'GP';

# d) Busque uma lista dos cargos da empresa, sem repeti-los. 

SELECT DISTINCT cargo FROM empresa;

# e) Busque nome, CPF e número de projetos apenas dos desenvolvedores

SELECT nome, cpf, nProjetos FROM empresa WHERE cargo = 'Desenvolvedor';

#QUESTAO 4
CREATE TABLE IF NOT EXISTS aluno(
	matricula INT NOT NULL PRIMARY KEY,
    nome VARCHAR(45),
    endereco VARCHAR(45),
    ano_nasc INT,
    curso VARCHAR(45)
);

#RESPOSNDA A QUESTÂO 4 e 5 AQUI

#INSERT CORRIGIDO
INSERT INTO aluno(matricula, nome, endereco, ano_nasc, curso) VALUES (123, "Janaina", "Rua 1", 1998, "GEB");
INSERT INTO aluno(matricula,nome, endereco, ano_nasc, curso) VALUES (321, "Pedro", "Rua 2", 2000, "GES");
INSERT INTO aluno(matricula,nome, endereco, ano_nasc, curso) VALUES (213,"Jander", "Rua 3", 1999, "GEC");
INSERT INTO aluno(matricula,nome, endereco, ano_nasc, curso) VALUES (456, "Lucca", "Rua 4", 1998, "GEB");
INSERT INTO aluno(matricula,nome, endereco, ano_nasc, curso) VALUES (789, "Laura", "Rua 5", 1998, "GEP");

SELECT nome, matricula, endereco, ano_nasc, curso FROM aluno;

#5 - a)
SELECT nome, matricula, curso FROM aluno WHERE nome LIKE 'Jan%' AND LENGTH(nome) >= 7;

# b) 
SELECT nome, curso FROM aluno WHERE nome LIKE 'L%A';

#c) 
SELECT DISTINCT ano_nasc, curso FROM aluno;

#d)
SELECT nome, ano_nasc, curso FROM aluno WHERE ano_nasc <= 1998;

#e)
SELECT *FROM aluno LIMIT 3;

#f)
UPDATE aluno SET endereco = "Rep. Poligamia" WHERE curso = "GEB";

#g)
DELETE FROM aluno WHERE curso = "GEB";