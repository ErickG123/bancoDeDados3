USE dblojagames;

/*-------------------------------------------------------------
Criar um stored procedure para trazer todos os registros da 
tabela produtos
-------------------------------------------------------------*/
DELIMITER $$
CREATE PROCEDURE SPLISTAPRODUTO()
BEGIN
	SELECT * 
    FROM PRODUTOS;
END $$
DELIMITER ;

/*Chamando a stored procedure*/
CALL SPLISTAPRODUTO();

/*-------------------------------------------------------------
Criar um stored procedure para trazer todos os registros da 
tabela produtos ordenados por nome do game ordem ascendente
-------------------------------------------------------------*/
DELIMITER $$
CREATE PROCEDURE SPLISTAPRODUTOORDEMNOME()
BEGIN
	SELECT * 
    FROM PRODUTOS
    ORDER BY PRODUTO;
END $$
DELIMITER ;

CALL SPLISTAPRODUTOORDEMNOME();

/*-------------------------------------------------------------
Criar um stored procedure que receba uma frase e retorne essa
frase
-------------------------------------------------------------*/
DELIMITER $$
CREATE PROCEDURE SPPAPAGAIO(
	IN FRASE VARCHAR(50)
)
BEGIN
	SELECT FRASE AS 'Minha frase';
END $$
DELIMITER ;

CALL SPPAPAGAIO('Olá Mundo');