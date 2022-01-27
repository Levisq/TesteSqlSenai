--DDL
CREATE DATABASE RpgOnlineBD

USE RpgOnlineBD
--Criando tabela usuário e estabelecendo colunas
CREATE TABLE Usuarios(
	UsuarioID INT PRIMARY KEY IDENTITY
	,Email VARCHAR(100) UNIQUE NOT NULL
	,Senha VARCHAR(255) NOT NULL
)

CREATE TABLE Classes(
	ClasseID INT PRIMARY KEY IDENTITY
	,NomeClasse VARCHAR(50) UNIQUE NOT NULL
	,Descricao VARCHAR(255)
)

CREATE TABLE Personagens(
	PersonagemID INT PRIMARY KEY IDENTITY
	,NomePersonagem VARCHAR(15) UNIQUE NOT NULL
	--Fazendo uso da Foreign key para trazer informações de outra tabela
	,UsuarioID INT UNIQUE FOREIGN KEY REFERENCES Usuarios(UsuarioID)
	,ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
)

CREATE TABLE Habilidades(
	HabilidadeID INT PRIMARY KEY IDENTITY
	,NomeHabilidade VARCHAR(100) UNIQUE NOT NULL
)

CREATE TABLE ClasseHabilidade(
	ClasseID INT FOREIGN KEY REFERENCES Classes(ClasseID)
	,HabilidadeID INT FOREIGN KEY REFERENCES Habilidades(HabilidadeID)
)

--DML

INSERT INTO Usuarios VALUES ('email@email.com', '123457')
INSERT INTO Classes VALUES ('Barbaro','Descrição do bárbaro')
--Para inserir items da mesma coluna só fazer fora dos parênteses
INSERT INTO Habilidades VALUES ('Lança Mortal'), ('Escudo Supremo')
--Colocando o parênteses eu consigo organizar a ordem de inserção dos dados como eu quiser
INSERT INTO Personagens (UsuarioID, NomePersonagem, ClasseID) Values (1, 'DeuBug', 1)
INSERT INTO ClasseHabilidade (ClasseID, HabilidadeID) Values (1, 1), (1, 2)

INSERT INTO Usuarios VALUES ('Email1@email.com', '123457')
INSERT INTO Classes VALUES ('Monge','Descrição do Monge')
INSERT INTO Habilidades VALUES ('Recuperar Vida')
INSERT INTO Personagens (UsuarioID, NomePersonagem, ClasseID) VALUES (2 ,'Danox', 2)
INSERT INTO ClasseHabilidade (ClasseID, HabilidadeID) VALUES (2,2), (2, 3)

--Mudando dados já salvos, lembrar sempre do WHERE para especificar exatamente onde a alteração vai ser feita
UPDATE Usuarios
SET Senha = 754321
WHERE UsuarioID = 1


--DQL
SELECT * FROM Usuarios
SELECT * FROM Personagens
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM ClasseHabilidade
--Fazendo um select usando duas tabelas diferentes
SELECT * FROM Personagens INNER JOIN Classes ON Personagens.ClasseID = Classes.ClasseID

--é possível selecionar exatamente o que vc quer que seja selecionado, posso também usar o AS para encurtar o nome da classe
SELECT P.NomePersonagem, C.NomeClasse, C.Descricao FROM Personagens AS P
INNER JOIN Classes AS C
ON P.ClasseID = C.ClasseID


CREATE LOGIN biriba
WITH PASSWORD = '1234'

CREATE USER biriba FOR LOGIN biriba

GRANT SELECT TO biriba