/****************************************************************
			Script para exemplo de crianção de índices			
****************************************************************/
/*CRIANDO O NOVO BANCO*/
CREATE SCHEMA `dbindice`;
USE dbindice;

/*CRIANDO TABELA PARA TESTE*/
CREATE TABLE Clientes(
	CPF INT NOT NULL PRIMARY KEY,
    Nome VARCHAR(80) NOT NULL,
    Email VARCHAR (80) NOT NULL,
    DataNascimento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

/*INSERINDO DADOS NA TABELA*/
INSERT INTO Clientes (CPF, Nome, Email, DataNascimento)
VALUES (111, 'Epaminondas', 'epa@mail.com', '1980-12-03');

INSERT INTO Clientes (CPF, Nome, Email, DataNascimento)
VALUES (222, 'Zuleica', 'zuzu@mail.com', '1990-11-03');

INSERT INTO Clientes (CPF, Nome, Email, DataNascimento)
VALUES (333, 'Gertrudes', 'gerger@mail.com', '1999-11-15');

INSERT INTO Clientes (CPF, Nome, Email, DataNascimento)
VALUES (444, 'Ubiratan', 'ubibi@mail.com', '1972-05-11');

/*select * from Clientes;*/

/*CRIANDO INDICES*/
CREATE INDEX IX_CPF
ON Clientes (CPF);

CREATE INDEX IX_Nome
ON Clientes (Nome);

CREATE INDEX IX_Nascimento
ON Clientes (DataNascimento);

/*APAGANDO INDICES*/
DROP INDEX IX_CPF ON Clientes;

/*MOSTRANDO INDICES*/
SHOW INDEX FROM Clientes;

/*TABELA DE PRODUTOS - INSERT PRODUTOS - INDEX PRODUTOS*/
CREATE TABLE Produtos(
	ID INT NOT NULL PRIMARY KEY,
	Nome VARCHAR(80) NOT NULL,
    Marca VARCHAR(80) NOT NULL
);

INSERT INTO Produtos (ID, Nome, Marca)
VALUES (1, 'Sabonete', 'Limpa Bem');

INSERT INTO Produtos (ID, Nome, Marca)
VALUES (2, 'Batata', 'Campo Verde');

INSERT INTO Produtos (ID, Nome, Marca)
VALUES (3, 'Chocolate', 'Lacta');

INSERT INTO Produtos (ID, Nome, Marca)
VALUES (4, 'Danone', 'ChocoMilk');

INSERT INTO Produtos (ID, Nome, Marca)
VALUES (5, 'Arroz', 'Branco');

select * from Produtos;

CREATE INDEX IX_MARCA 
ON Produtos(Marca);