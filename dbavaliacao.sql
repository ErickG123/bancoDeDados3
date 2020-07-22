/*-----------------------------------------------------------------------
  Curso Técnico em Desenvolvimento de Sistemas
  Banco de Dados III - Prof. Sérgio Lacerda
  Script para banco de dados da Avaliação Prática I
 ----------------------------------------------------------------------*/

/*-----------------------------------------------------------------------
  Criação do banco de dados (Schemma)
-----------------------------------------------------------------------*/
CREATE SCHEMA dbavaliacao1;
USE dbavaliacao1;

/*-----------------------------------------------------------------------
  Criação das tabelas
-----------------------------------------------------------------------*/

/* Tabela de produtos */
CREATE TABLE Produtos (
	IdProduto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NomeProduto VARCHAR(50) NOT NULL,
    PrecoUnitario DECIMAL(8,2)
);

/* Tabela de clientes */
CREATE TABLE Clientes (
	IdCliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nomecliente VARCHAR(50) NOT NULL,
    Cpf VARCHAR(15) NOT NULL
);

/* Tabela de pedidos de compra */
CREATE TABLE Pedidos (
	IdPedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DataPedido TIMESTAMP NOT NULL,
    IdCliente INT NOT NULL,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)    
);

/* Tabela de de itens (produtos) do pedido */
CREATE TABLE ItensPedido (
	IdItemPedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IdPedido INT NOT NULL,
    IdProduto INT NOT NULL,
    Quantidade INT NOT NULL,
    ValorUnitario DECIMAL(8,2) NOT NULL,
    Desconto DECIMAL(8,2) NOT NULL DEFAULT 0,
    FOREIGN KEY (IdPedido) REFERENCES Pedidos(IdPedido),
    FOREIGN KEY (IdProduto) REFERENCES Produtos(IdProduto)
);

/*-----------------------------------------------------------------------
  Populando tabelas base com dados para simulação
-----------------------------------------------------------------------*/

INSERT INTO PRODUTOS (NomeProduto, PrecoUnitario) 
VALUES ('Tênis Olympikus Breed 2', 89.99);

INSERT INTO PRODUTOS (NomeProduto, PrecoUnitario) 
VALUES ('Tênis Nike Revolution 5', 229.99);

INSERT INTO PRODUTOS (NomeProduto, PrecoUnitario) 
VALUES ('Tênis Adidas Lite Racer', 159.99);

INSERT INTO PRODUTOS (NomeProduto, PrecoUnitario) 
VALUES ('Tênis Mizuno Falcon 2', 239.80);

INSERT INTO PRODUTOS (NomeProduto, PrecoUnitario) 
VALUES ('Tênis Olympikus Levity', 99.99);

INSERT INTO CLIENTES (NomeCliente, Cpf) 
VALUES ('Epaminondas da Silva', '111.111.111-11');

INSERT INTO CLIENTES (NomeCliente, Cpf) 
VALUES ('Zuleika Machado', '222.222.222-22');

INSERT INTO CLIENTES (NomeCliente, Cpf) 
VALUES ('Eleutério Rocha', '333.333.333-33');

INSERT INTO CLIENTES (NomeCliente, Cpf) 
VALUES ('Pafúncio Lima', '444.444.444-44');

INSERT INTO CLIENTES (NomeCliente, Cpf) 
VALUES ('Ermengarda Leite', '555.555.555-55');

INSERT INTO PEDIDOS (DataPedido, IdCliente) VALUES ('2020-01-09', 5);
INSERT INTO PEDIDOS (DataPedido, IdCliente) VALUES ('2020-01-16', 3);
INSERT INTO PEDIDOS (DataPedido, IdCliente) VALUES ('2020-02-21', 1);
INSERT INTO PEDIDOS (DataPedido, IdCliente) VALUES ('2020-03-14', 5);
INSERT INTO PEDIDOS (DataPedido, IdCliente) VALUES ('2020-03-18', 4);
INSERT INTO PEDIDOS (DataPedido, IdCliente) VALUES ('2020-03-25', 3);
INSERT INTO PEDIDOS (DataPedido, IdCliente) VALUES ('2020-04-28', 5);
INSERT INTO PEDIDOS (DataPedido, IdCliente) VALUES ('2020-04-13', 4);
INSERT INTO PEDIDOS (DataPedido, IdCliente) VALUES ('2020-05-17', 3);
INSERT INTO PEDIDOS (DataPedido, IdCliente) VALUES ('2020-05-03', 4);

INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (1, 3, 1, 159.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (2, 1, 1, 89.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (2, 3, 1, 159.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (2, 5, 2, 99.99, 1);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (3, 2, 1, 229.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (3, 4, 1, 239.80, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (4, 5, 3, 99.99, 3);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (5, 1, 1, 89.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (5, 3, 1, 159.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (6, 1, 1, 89.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (6, 4, 1, 239.80, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (6, 5, 1, 99.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (6, 2, 1, 229.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (7, 2, 3, 229.99, 2.8);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (7, 4, 2, 239.80, 2.3);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (8, 1, 1, 89.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (9, 2, 1, 229.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (10, 2, 1, 229.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (10, 3, 1, 159.99, 0);
INSERT INTO ItensPedido (IdPedido, IdProduto, Quantidade, ValorUnitario, Desconto) VALUES (10, 4, 1, 239.80, 0);

/*Index Nome Cliente*/
CREATE INDEX IX_NomeCliente
ON clientes (Nomecliente);

SHOW INDEX FROM Clientes;

/*Select CPF e Nome*/
SELECT Cpf, Nomecliente
FROM clientes
ORDER BY Nomecliente DESC;

/*Select QtdPedidos*/
SELECT count(IdPedido) AS 'QuantidadePedidos'
FROM pedidos
WHERE DataPedido BETWEEN '2020-03-01' AND '2020-03-31'

/*Procedure Código Pedido*/
DELIMITER $$
CREATE PROCEDURE spCodigoPedido(
	IN IdPed INT
)
BEGIN
	SELECT IP.IdPedido, PE.DataPedido, C.IdCliente, C.NomeCliente, IP.IdProduto, PR.NomeProduto, IP.Quantidade, IP.ValorUnitario, IP.Desconto,
    CONCAT('R$ ', FORMAT((IP.ValorUnitario*IP.Quantidade)-IP.Desconto, 2, 'de_DE'))	As ValorTotal
    FROM itenspedido IP
		INNER JOIN Produtos PR ON PR.IdProduto = IP.IdProduto
        INNER JOIN Pedidos PE ON PE.IdPedido = IP.IdPedido
		INNER JOIN Clientes C ON C.IdCliente = PE.IdCliente
    WHERE IP.IdPedido = IdPed;
END $$
DELIMITER ; 

CALL spCodigoPedido(4);

/*Procedure CPF*/
DELIMITER $$
CREATE PROCEDURE spPedidoCpf(
	IN Cpf VARCHAR(15)
)
BEGIN
	SELECT PE.DataPedido, PE.IdPedido, C.NomeCliente
    FROM Pedidos PE
		INNER JOIN Clientes C ON C.IdCliente = PE.IdCliente
    WHERE C.Cpf = cpf
    ORDER BY PE.DataPedido DESC;
END $$
DELIMITER ; 

CALL spPedidoCpf('444.444.444-44');

/*Procedure Busca Pedido*/
DELIMITER $$ 
CREATE PROCEDURE spBuscaPedido(
	IN PedId INT 
)
BEGIN 
	SELECT 
        CONCAT('R$ ', FORMAT((COUNT(IP.IdProduto) - (SUM(IP.Desconto))), 2, 'de_DE')) AS TotalProdutos,
		SUM(IP.Desconto) AS TotalDesconto,
        CONCAT('R$ ', FORMAT((COUNT(IP.Quantidade) * IP.ValorUnitario), 2, 'de_DE')) AS TotalPedido
	FROM ItensPedido IP
		INNER JOIN Pedidos P on P.IdPedido = IP.IdPedido
	WHERE IP.IdPedido = PedId;
END $$
DELIMITER ;

CALL spBuscaPedido(4);