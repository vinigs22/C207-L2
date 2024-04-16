
#1
#Uma chave primária garante que cada registro seja único e não nulo, e é fundamental para indexação e referência cruzada entre tabelas.

#2
CREATE DATABASE IF NOT EXISTS Av1;

CREATE TABLE Alunos (
    matricula INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    cidade VARCHAR(100),
    curso VARCHAR(100)
);

#a)
INSERT INTO Alunos (matricula, nome, idade, cidade, curso) 
VALUES (99, 'Alessandro', 22, 'Pouso Alegre', 'GEC');

INSERT INTO Alunos (matricula, nome, idade, cidade, curso) 
VALUES (2563, 'Bruno', 20, 'Itajubá', 'GES');

INSERT INTO Alunos (matricula, nome, idade, cidade, curso) 
VALUES (665, 'Juliana', 19, 'Santa Rita', 'GEB');

INSERT INTO Alunos (matricula, nome, idade, cidade, curso) 
VALUES (1666, 'Juliette', 23, 'Pouso Alegre', 'GES');

INSERT INTO Alunos (matricula, nome, idade, cidade, curso) 
VALUES (3529, 'Antonio', 24, 'Belo Horizonte', 'GEA');

INSERT INTO Alunos (matricula, nome, idade, cidade, curso) 
VALUES (61, 'João', 20, 'Pouso Alegre', 'GET');

#b)
UPDATE Alunos SET idade = 23 WHERE nome = 'Alessandro';

#c) 
SELECT * FROM Alunos WHERE curso = 'GEB';

#d)
DELETE FROM Alunos WHERE matricula = 3529;

#e)
SELECT cidade FROM Alunos WHERE curso = 'GES';

#f)
SELECT MAX(idade) AS maior_idade FROM Alunos;

#g) 
SELECT nome, idade, curso FROM Alunos WHERE cidade = 'Itajubá';

#h)
SELECT * FROM Alunos LIMIT 3;

#i)
SELECT nome FROM Alunos
WHERE nome LIKE 'J%' AND LENGTH(nome) > 5;

#j)
SELECT COUNT(*) AS total_alunos_pa
FROM Alunos WHERE cidade = 'Pouso Alegre';

