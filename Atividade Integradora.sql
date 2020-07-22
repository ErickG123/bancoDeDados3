/*
	---------------------------------------
	Atividade Integradora BD-III e PWEB-III
          Grupo - Erick e Ana Beatriz      
	---------------------------------------
*/

use imobiliariaetec;

/*Function que retorne a quantidade de apartamentos com base no Id da Cidade*/
DELIMITER $$
CREATE FUNCTION udfQtdApartamentosIdCidade(
	IdCidade INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE auxQtd INT DEFAULT 0;
    
    SELECT count(E.Id)
    INTO auxQtd
    FROM estabelecimento E
		INNER JOIN tipoestabelecimento TP ON TP.Id = E.TipoEstabelecimentoId
    WHERE E.CidadeId = IdCidade 
    AND E.TipoEstabelecimentoId = 2; 
    
    RETURN auxQtd;
END $$
DELIMITER ;

SELECT udfQtdApartamentosIdCidade(2);

/*Function que retorne a quantidade de casas com base no Id da Cidade*/
DELIMITER $$
CREATE FUNCTION udfQtdCasasIdCidade(
	IdCidade INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE auxQtd INT DEFAULT 0;
    
    SELECT count(E.Id) 
    INTO auxQtd
    FROM estabelecimento E
		INNER JOIN tipoestabelecimento TP ON TP.Id = E.TipoEstabelecimentoId
    WHERE E.CidadeId = IdCidade 
    AND E.TipoEstabelecimentoId = 1; 
    
    RETURN auxQtd;
END $$
DELIMITER ;

SELECT udfQtdCasasIdCidade(2);

/*Function que retorne a quantidade de casas ou apartamentos com base no Id da Cidade*/
DELIMITER $$
CREATE FUNCTION udfQtdCasasApartamentosIdCidade(
	IdCidade INT,
    IdEstabelecimento INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE auxQtd INT DEFAULT 0;
    
    SELECT count(E.Id) 
    INTO auxQtd
    FROM estabelecimento E
		INNER JOIN tipoestabelecimento TP ON TP.Id = E.TipoEstabelecimentoId
    WHERE E.CidadeId = IdCidade 
    AND E.TipoEstabelecimentoId = IdEstabelecimento;
    
    RETURN auxQtd;
END $$
DELIMITER ;

SELECT udfQtdCasasApartamentosIdCidade(2, 1);

/*Stored Procedure que retorne os estabelecimentos dentro de uma faixa de valores*/
DELIMITER $$  
CREATE PROCEDURE spEstabelecimentoValor(
	IN ValorInicial DECIMAL(15, 2),
    IN ValorFinal DECIMAL(15, 2)
)
BEGIN 
	SELECT * 
    FROM estabelecimento
    WHERE Valor BETWEEN ValorInicial AND ValorFinal;
END $$
DELIMITER ;

CALL spEstabelecimentoValor(100000, 800000);

/*Stored Procedure que retorne os estabelecimentos com quantidade de quartos e banheiros informados pelo usuário*/
DELIMITER $$  
CREATE PROCEDURE spQtdQuartosBanheiro(
	IN QtdQuartos INT,
    IN QtdBanheiro INT
)
BEGIN 
	SELECT * 
    FROM estabelecimento
    WHERE NumQuartos = QtdQuartos
    AND NumBanheiros = QtdBanheiro;
END $$
DELIMITER ;

CALL spQtdQuartosBanheiro(5, 2);