USE dblojagames;

/*Buscando um jogo por ID*/
DELIMITER $$ 
CREATE PROCEDURE spBuscaGamePorId(
	IN ProdId INT 
)
BEGIN 
	SELECT * 
    FROM Produtos 
    WHERE IdProduto = ProdId;
END $$
DELIMITER ;

/*Busca o jogo por ID*/
CALL spBuscaGamePorId(3);

/*Buscando um jogo pelo Nome*/
DELIMITER $$ 
CREATE PROCEDURE spBuscaGamePorNome(
	IN ProdName VARCHAR(15) 
)
BEGIN 
	SELECT * 
    FROM Produtos 
    WHERE Produto LIKE concat('%', ProdName, '%'); 
END $$
DELIMITER ;

/*Busca o jogo por Nome*/
CALL spBuscaGamePorNome('of');

/*Buscando um jogo pela Categoria*/
DELIMITER $$ 
CREATE PROCEDURE spBuscaGamePorCategoria(
	IN CategId VARCHAR(15) 
)
BEGIN 
	SELECT C.IdCategoria, P.IdProduto, P.Produto
    FROM CategoriasProdutos C 
		INNER JOIN Produtos P on P.IdProduto = C.IdProduto
    WHERE C.IdCategoria = CategId;
END $$
DELIMITER ;

/*Busca o jogo por Categoria*/
CALL spBuscaGamePorCategoria(6);

/*Buscando um jogo pela Categoria 2*/
DELIMITER $$ 
CREATE PROCEDURE spBuscaGamePorCategoria2(
	IN CategId INT
)
BEGIN 
	SELECT C.IdCategoria, CT.Categoria, P.IdProduto, P.Produto
    FROM CategoriasProdutos C 
		INNER JOIN Produtos P on P.IdProduto = C.IdProduto
        INNER JOIN Categorias CT on CT.IdCategoria = C.IdCategoria
    WHERE C.IdCategoria = CategId;
END $$
DELIMITER ;

/*Busca o jogo por Categoria 2*/
CALL spBuscaGamePorCategoria2(6);

/*Buscando um jogo Quantidade*/
DELIMITER $$ 
CREATE PROCEDURE spQtdGamesPorCategoria(
	IN CategId INT
)
BEGIN 
	SELECT count(P.IdProduto) AS Quantidade
    FROM CategoriasProdutos C 
		INNER JOIN Produtos P on P.IdProduto = C.IdProduto
    WHERE C.IdCategoria = CategId;
END $$
DELIMITER ;

/*Busca o jogo por Quantidade*/
CALL spQtdGamesPorCategoria(6);

/*Quantidade de games por plataforma*/
USE	 dblojagames;

/*Buscando um jogo por ID*/
DELIMITER $$ 
CREATE PROCEDURE spBuscaGamePorId(
	IN ProdId INT 
)
BEGIN 
	SELECT * 
    FROM Produtos 
    WHERE IdProduto = ProdId;
END $$
DELIMITER ;

/*Busca o jogo por ID*/
CALL spBuscaGamePorId(3);

/*Buscando um jogo pelo Nome*/
DELIMITER $$ 
CREATE PROCEDURE spBuscaGamePorNome(
	IN ProdName VARCHAR(15) 
)
BEGIN 
	SELECT * 
    FROM Produtos 
    WHERE Produto LIKE concat('%', ProdName, '%'); 
END $$
DELIMITER ;

/*Busca o jogo por Nome*/
CALL spBuscaGamePorNome('of');

/*Buscando um jogo pela Categoria*/
DELIMITER $$ 
CREATE PROCEDURE spBuscaGamePorCategoria(
	IN CategId VARCHAR(15) 
)
BEGIN 
	SELECT C.IdCategoria, P.IdProduto, P.Produto
    FROM CategoriasProdutos C 
		INNER JOIN Produtos P on P.IdProduto = C.IdProduto
    WHERE C.IdCategoria = CategId;
END $$
DELIMITER ;

/*Busca o jogo por Categoria*/
CALL spBuscaGamePorCategoria(6);

/*Buscando um jogo pela Categoria 2*/
DELIMITER $$ 
CREATE PROCEDURE spBuscaGamePorCategoria2(
	IN CategId INT
)
BEGIN 
	SELECT C.IdCategoria, CT.Categoria, P.IdProduto, P.Produto
    FROM CategoriasProdutos C 
		INNER JOIN Produtos P on P.IdProduto = C.IdProduto
        INNER JOIN Categorias CT on CT.IdCategoria = C.IdCategoria
    WHERE C.IdCategoria = CategId;
END $$
DELIMITER ;

/*Busca o jogo por Categoria 2*/
CALL spBuscaGamePorCategoria2(6);

/*Buscando um jogo Quantidade*/
DELIMITER $$ 
CREATE PROCEDURE spQtdGamesPorCategoria(
	IN CategId INT
)
BEGIN 
	SELECT count(P.IdProduto) AS Quantidade
    FROM CategoriasProdutos C 
		INNER JOIN Produtos P on P.IdProduto = C.IdProduto
    WHERE C.IdCategoria = CategId;
END $$
DELIMITER ;

/*Busca o jogo por Quantidade*/
CALL spQtdGamesPorCategoria(6);

/*Quantidade de jogos por plataforma*/
DELIMITER $$ 
CREATE PROCEDURE  spQtdGamesPlataforma(
	IN IdPlat INT
)
BEGIN 
	DECLARE auxQtd INT DEFAULT 0;
	SET auxQtd = (
		SELECT COUNT(IdProduto)
		FROM PlataformasProdutos
		WHERE IdPlataforma = IdPlat
    );
    
    SELECT CONCAT('Existem ', auxQtd, ' games compativeis') AS 'Qtd. Games';

END $$
DELIMITER ;

/*Busca a quantidade de games*/
CALL spQtdGamesPlataforma(2);

/*Calculo de idade*/
DELIMITER $$
CREATE PROCEDURE spCalculoIdade(
	IN DataIni TIMESTAMP
)
BEGIN
	SELECT TIMESTAMPDIFF(YEAR, DataIni, CURDATE()) AS Idade;
END $$
DELIMITER ; 

/*Calculo idade*/
CALL spCalculoIdade('2010-05-12');

/*Formatando a data*/
DELIMITER $$
CREATE PROCEDURE spFormataData(
	IN DataIni TIMESTAMP
)
BEGIN
	SELECT DATE_FORMAT(DataIni, '%d/%m/%Y') AS DataFormatada;
END $$
DELIMITER ; 

/*Data formatada*/
CALL spFormataData('2020-05-12');

/*Formatando o dinheiro*/
DELIMITER $$
CREATE PROCEDURE spFormataDinheiro(
	IN Valor DECIMAL(8,2)
)
BEGIN
	SELECT CONCAT('R$ ', FORMAT(Valor, 2, 'de_DE')) AS ValorFormatado;
END $$
DELIMITER ; 

/*Data formatada*/
CALL spFormataDinheiro(1658.32);

/*Lista de preços*/
DELIMITER $$
CREATE PROCEDURE spListaPreco(
	IN Desconto INT
)
BEGIN
	SELECT PP.IdProduto, P.IdProduto, PP.IdPlataforma, PT.Plataforma, 
    CONCAT('R$ ', FORMAT(PP.Preco, 2, 'de_DE'))	As Preco,
    CONCAT('R$ ', FORMAT(PP.Preco*(100-Desconto)/100, 2, 'de_DE'))	As PrecoDesconto
    FROM PlataformasProdutos PP
		INNER JOIN Produtos P ON P.IdProduto = PP.IdProduto
        INNER JOIN Plataformas PT ON PT.IdPlataforma = PP.IdPlataforma
    ORDER BY PP.IdPlataforma, PP.Preco DESC;
END $$
DELIMITER ; 

/*Listando preços*/
CALL spListaPreco(50);

/*Atividade 01*/
DELIMITER $$ 
CREATE PROCEDURE  spPlatCompativel(
	IN IdPlat INT
)
BEGIN 
		SELECT P.IdProduto, P.Produto, CONCAT('R$ ', FORMAT(PP.Preco, 2, 'de_DE')) As Preco
		FROM PlataformasProdutos PP
			INNER JOIN Produtos P ON P.IdProduto = PP.IdProduto
			INNER JOIN Plataformas PT ON PT.IdPlataforma = PP.IdPlataforma
		WHERE PP.IdPlataforma = IdPlat;
END $$
DELIMITER ;

CALL spPlatCompativel(1);

/*Cadastrando produtos na tabela*/
DELIMITER $$  
CREATE PROCEDURE  spCadastraProduto(
	IN IdProd INT,
    IN NomProd VARCHAR(80),
    IN StudioProd VARCHAR(50),
    IN LancProd SMALLINT
)
BEGIN 
	INSERT INTO Produtos (IdProduto, Produto, Studio, AnoLancamento)
    VALUES (IdProd, NomProd, StudioProd, LancProd);
END $$
DELIMITER ;

CALL spCadastraProduto(5, 'TitanFall 2', 'EIDOS', 2017);

/*Alterar informações do produto*/
DELIMITER $$  
CREATE PROCEDURE  spAlteraProduto(
	IN IdProd INT,
    IN NomProd VARCHAR(80),
    IN StudioProd VARCHAR(50),
    IN LancProd SMALLINT
)
BEGIN 
	UPDATE Produtos
    SET Produto = NomProd,
		Studio = StudioProd,
		AnoLancamento = LancProd
	WHERE IdProduto = IdProd;
END $$
DELIMITER ; 

CALL spAlteraProduto(5, 'TitanFall 2', 'EA Games', 2017);

/*Cadastra um jogo em uma determinada categoria e retorna a qtd. de games que já existe na categoria*/
DELIMITER $$  
CREATE PROCEDURE  spCadastraProdCategoria(
	IN IdProd INT,
    IN IdCateg INT,
    OUT Qtd INT
)
BEGIN 
	/*Inserindo o game na categoria*/
	INSERT INTO CategoriasProdutos (IdProduto, IdCategoria)
    VALUES (IdProd, IdCateg);
    
    /*Qtd. games na categoria*/
	SET Qtd = (
		SELECT count(IdProduto)
        FROM CategoriasProdutos
        WHERE IdCategoria = IdCateg
    );
END $$
DELIMITER ;

SET @qtd = 0;
CALL spCadastraProdCategoria(5, 6, @qtd);
Select @qtd;

/*Tratando exceções*/
DELIMITER $$  
CREATE PROCEDURE  spCadastrarProdutoException(
	IN IdProd INT,
    IN NomProd VARCHAR(80),
    IN StudioProd VARCHAR(50),
    IN LancProd SMALLINT
)
BEGIN 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		SHOW ERRORS;
	END;

	INSERT INTO Produtos (IdProduto, Produto, Studio, AnoLancamento)
    VALUES (IdProd, NomProd, StudioProd, LancProd);
END $$
DELIMITER ; 

CALL spCadastrarProdutoException(6, 'Doom Eternal', 'XPTO Games', 2019);
CALL spCadastrarProdutoException(6, 'Minecraft', 'XPTO Games', 2019);

/*Trocando de categoria*/
DELIMITER $$  
CREATE PROCEDURE spTrocaCategoria(
	IN IdProd INT,
    IN IdCategOld INT,
    IN IdCategNew INT
)
BEGIN 
	UPDATE CategoriasProdutos
    SET IdCategoria = IdCategNew
	WHERE IdProduto = IdProd AND IdCategoria = IdCategOld;
END $$
DELIMITER ; 

select * from CategoriasProdutos;

CALL spTrocaCategoria(5, 5, 6);

CALL spCadastraProduto(9, 'Fortnite', 'Epic Games', 2017);
CALL spCadastraProduto(10, 'FIFA 20', 'Eletronics Arts (EA)', 2019);
CALL spCadastraProduto(11, 'Gears 5', 'Rod Fergusson', 2019);
CALL spCadastraProdCategoria(11, 1, @Qtd);
CALL spCadastraProdCategoria(9, 1, @Qtd);
CALL spCadastraProdCategoria(9, 2, @Qtd);

select * from produtos;
select * from categoriasprodutos where idproduto in (9, 11);

/*Apagando um produto*/
DELIMITER $$  
CREATE PROCEDURE spApagaProduto(
	In IdProd INT
)
BEGIN 
	DELETE FROM Produtos
    WHERE IdProduto = IdProd;
END $$
DELIMITER ;

CALL spApagaProduto(10);

/*Apagando um produto com dependencia*/
DELIMITER $$  
CREATE PROCEDURE spApagaProdutoDependencial(
	In IdProd INT
)
BEGIN 
	DELETE FROM CategoriasProdutos WHERE IdProduto = IdProd;
	DELETE FROM PlataformasProdutos WHERE IdProduto = IdProd;
	DELETE FROM Produtos WHERE IdProduto = IdProd;
END $$
DELIMITER ;

CALL spApagaProdutoDependencial(11);
select * from categoriasprodutos where idproduto = 11;

/*Nova banco - Para teste de exclsão em cascata*/
CREATE SCHEMA dbcascata;
USE dbcascata;

/*Tabela master*/
CREATE TABLE tblojas (
	IdLoja INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NomeLoja VARCHAR(30) NOT NULL
);

/*Tabela detalhe*/
CREATE TABLE tbunidades(
	IdUnidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NomeUnidade VARCHAR(50) NOT NULL,
    IdLoja INT NOT NULL,
		FOREIGN KEY (IdLoja) REFERENCES tblojas(IdLoja)
        ON DELETE CASCADE
);

INSERT INTO tblojas(nomeLoja) VALUES ('Trufas do pafuncio');  
INSERT INTO tblojas(nomeLoja) VALUES ('Zuleica boleira'); 

INSERT INTO tbunidades(NomeUnidade, IdLoja) VALUES ('Unidade Barra Bonita', 1);
INSERT INTO tbunidades(NomeUnidade, IdLoja) VALUES ('Unidade Jau', 1);
INSERT INTO tbunidades(NomeUnidade, IdLoja) VALUES ('Unidade Pederneiras', 1);

INSERT INTO tbunidades(NomeUnidade, IdLoja) VALUES ('Unidade Barra Bonita', 2);
INSERT INTO tbunidades(NomeUnidade, IdLoja) VALUES ('Unidade Jau', 2);
INSERT INTO tbunidades(NomeUnidade, IdLoja) VALUES ('Unidade Botucatu', 2);
INSERT INTO tbunidades(NomeUnidade, IdLoja) VALUES ('Unidade Bauru', 2);

/*Apagando a loja*/
DELIMITER $$  
CREATE PROCEDURE spApagaLoja(
	IN pLoja INT
)
BEGIN 
	DELETE FROM tbLojas WHERE IdLoja = pLoja;
END $$
DELIMITER ;

CALL spApagaLoja(1);

select * from tblojas;
select * from tbunidades;

/*Função Formata Data*/
DELIMITER $$
CREATE FUNCTION udfFormataData(
	pData TIMESTAMP
)
RETURNS VARCHAR(12)
DETERMINISTIC
BEGIN
	RETURN date_format(pData, '%d/%m/%Y');
END $$
DELIMITER ;

select udfFormataData(curdate());
select udfFormataData('1980-10-03');

/*Função Formata Moeda*/
DELIMITER $$
CREATE FUNCTION udfFormataMoeda(
	pValor DECIMAL(15, 2)
)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	RETURN concat('R$ ', format(pValor, 2, 'de_DE'));
END $$
DELIMITER ;

SELECT P.Produto, PT.Plataforma, PP.Preco, udfFormataMoeda(PP.Preco) AS PrecoFormatado
FROM PlataformasProdutos PP
	INNER JOIN Produtos P ON P.IdProduto = PP.IdProduto
    INNER JOIN Plataformas PT ON PT.IdPlataforma = PP.IdPlataforma
ORDER BY P.Produto, PT.Plataforma;

/*Função Games Compativos*/
DELIMITER $$
CREATE FUNCTION udfQtdGamesPlataforma(
	PlatId INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE auxQtd INT DEFAULT 0;
    
    SELECT count(IdProduto)
    INTO auxQtd
    FROM PlataformasProdutos
    WHERE IdPlataforma = PlatId;
    
    RETURN auxQtd;
END $$
DELIMITER ;

select udfQtdGamesPlataforma(1);

SELECT IdPlataforma, Plataforma, udfQtdGamesPlataforma(IdPlataforma) AS 'Qtd. Games'
FROM Plataformas 

/*Função Preço Game Plataform*/
DELIMITER $$
CREATE FUNCTION udfPrecoGamePlataforma(
	ProdId INT,
	PlatId INT
)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
	DECLARE auxPreco DECIMAL(15, 2) DEFAULT 0;

	SELECT Preco
    INTO auxPreco
    FROM PlataformasProdutos
    WHERE IdProduto = ProdId AND IdPlataforma = PlatId;

	RETURN concat('R$ ', format(auxPreco, 2, 'de_DE'));
END $$
DELIMITER ;

select udfPrecoGamePlataforma(1, 3);

/*Criando tabela dedo duro*/
CREATE TABLE tbDedoDuro(
    IdLog INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DataLog TIMESTAMP DEFAULT current_timestamp,
    UserLog VARCHAR(30),
    AcaoLog VARCHAR(100)
);

/*Trigger Before Delete*/
DELIMITER $$ 
CREATE TRIGGER trDedoDuroBeforeDelete
BEFORE DELETE 
ON Produtos FOR EACH ROW
BEGIN
	DECLARE usuario VARCHAR(15) DEFAULT '';
    DECLARE acao VARCHAR(100) DEFAULT '';
    
    SET usuario = USER();
    
    SET acao = CONCAT(
		'Apagou resgrito da tabela Produtos: ID: ',
        OLD.IdProduto,
        ' - ',
        OLD.Produto
    );
    
    INSERT INTO tbDedoDuro(UserLog, AcaoLog)
    VALUES (usuario, acao);
END $$ 
DELIMITER ;

CALL spCadastraProduto(12, 'FarCry New Dawn', 'Ubisoft', 2019); 
CALL spCadastraProduto(13, 'Days Gone', 'Bend Studio', 2019); 
CALL spCadastraProduto(14, 'Resident Evil 3', 'CAPCOM', 2020);
CALL spCadastraProduto(15, 'Red Dead Redemption 2', 'Rockstar Games', 2018);
CALL spCadastraProduto(16, 'Uncharted 4 A Thief`s End', 'Naughty Dog', 2018);
CALL spCadastraProduto(17, 'Horizon Zero Dawn', 'Guerrilla Games', 2017);

DELETE FROM Produtos WHERE idproduto = 15;
DELETE FROM Produtos WHERE idproduto BETWEEN 12 AND 17;
  
 SELECT * FROM tbDedoDuro;
 
 /*Trigger After Insert*/
 DELIMITER $$ 
CREATE TRIGGER trComplementaProdutoAfterInsert
AFTER INSERT 
ON Produtos FOR EACH ROW
BEGIN
	/*Inserindo na categoria 6*/
    INSERT INTO CategoriasProdutos (IdProduto, IdCategoria)
    VALUES(NEW.IdProduto, 6);
    /*Inserindo na plataforma 2*/
    INSERT INTO PlataformasProdutos (IdProduto, IdPlataforma, Preco)
    VALUES(NEW.IdProduto, 2, 0);
END $$ 
DELIMITER ;

CALL spCadastraProduto(12, 'FarCry New Dawn', 'Ubisoft', 2019); 
CALL spCadastraProduto(13, 'Days Gone', 'Bend Studio', 2019); 
CALL spCadastraProduto(14, 'Resident Evil 3', 'CAPCOM', 2020);
CALL spCadastraProduto(15, 'Red Dead Redemption 2', 'Rockstar Games', 2018);
CALL spCadastraProduto(16, 'Uncharted 4 A Thief`s End', 'Naughty Dog', 2018);
CALL spCadastraProduto(17, 'Horizon Zero Dawn', 'Guerrilla Games', 2017);

select * from CategoriasProdutos where IdProduto between 13 and 17;
select * from PlataformasProdutos where IdProduto between 13 and 17;

/*Função de compatibilidade de jogos*/
DELIMITER $$
CREATE FUNCTION udfCompativel(
	ProdId INT,
	PlatId INT
)
RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
	DECLARE auxQtd INT DEFAULT 0;
    DECLARE auxFrase VARCHAR(15) DEFAULT '';
    
    SELECT COUNT(IdProduto)
    INTO auxQtd
    FROM PlataformasProdutos
    WHERE IdProduto = ProdId AND 
	      IdPlataforma = PlatId;
          
	IF (auxQtd = 0) THEN 
		SET auxFrase = 'Não compatível';
	ELSE 
		SET auxFrase = 'Compatível';
	END IF ;
    
    RETURN auxFrase;
END $$
DELIMITER ;

select udfCompativel(1, 4);

/* Função fabricante*/
DELIMITER $$
CREATE FUNCTION udfFabricante(
	PlatId INT
)
RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
    DECLARE auxFrase VARCHAR(15) DEFAULT '';
    
    CASE PlatId
		WHEN 1 THEN SET auxFrase = 'Microsoft';
        WHEN 2 THEN SET auxFrase = 'Sony';
        WHEN 3 THEN SET auxFrase = 'Sony';
        WHEN 4 THEN SET auxFrase = 'Nintendo';
        ELSE SET auxFrase = 'Desconhecido';
	END CASE;
    
    RETURN auxFrase;
END $$
DELIMITER ;

SELECT PP.IdProduto, P.Produto,
	   PP.IdPlataforma, PT.Plataforma,
       udfFabricante(PP.IdPlataforma) AS 'Fabricante'
FROM PlataformasProdutos PP
	INNER JOIN Produtos P ON P.IdProduto = PP.IdProduto
    INNER JOIN Plataformas PT ON  PT.IdPlataforma = PP.IdPlataforma;
    
/*View ProdutoPlataformas*/
CREATE VIEW vwProdutoPlataformas
AS
SELECT PP.IdProduto,
	   P.Produto,
	   PP.IdPlataforma,
       PT.Plataforma,
       PP.Preco
FROM PlataformasProdutos PP
		INNER JOIN Produtos P ON P.IdProduto = PP.IdProduto
        INNER JOIN Plataformas PT ON PT.IdPlataforma = PP.IdPlataforma;
        
Select * from vwProdutoPlataformas;

/*View e Inner Join*/
SELECT PP.*,
	   CP.IdCategoria,
       C.Categoria
FROM vwProdutoPlataformas PP
	INNER JOIN CategoriasProdutos CP ON CP.IdProduto = PP.IdProduto
    INNER JOIN Categorias C ON C.IdCategoria = CP.IdCategoria;
    
/*View Selets*/
CREATE VIEW vwPlataformasCategorias
AS
(
SELECT IdPlataforma AS Id,
	   Plataforma AS Descricao,
       'Plataforma' AS Tipo
FROM Plataformas
)
UNION
(
SELECT IdCategoria AS Id,
	   Categoria AS Descricao,
       'Categoria' AS Tipo
FROM Categorias
)
ORDER BY Tipo, Id;

/*Controlando diretios de acesso*/
CREATE VIEW vwProdutosMenorQueTres
AS
SELECT *
FROM Produtos
WHERE IdProduto <= 3
WITH CHECK OPTION;

Select * from vwProdutosMenorQueTres;

Insert into vwProdutosMenorQueTres (IdProduto, Produto, Studio, AnoLancamento)
Values (20, 'Game Teste', 'Studio Teste', 2000);	
 