/*-------------------------------------------------------------
Obtenha os dados das tabulas Produtos, Categorias e Plataformar
-------------------------------------------------------------*/
SELECT * FROM PRODUTOS;

SELECT * FROM CATEGORIAS;

SELECT * FROM PLATAFORMAS;

/*-------------------------------------------------------------
Obtenha os dados das tabulas Produtos, ordenados por
	a) Nome do produto
    b) Nome do studio e nome do produto
-------------------------------------------------------------*/
SELECT * FROM PRODUTOS
ORDER BY PRODUTO;

SELECT * FROM PRODUTOS
ORDER BY STUDIO, PRODUTO;

/*-------------------------------------------------------------
Obtenha todos os jogos que contenham 'Of' no nome do produto
-------------------------------------------------------------*/
SELECT * FROM PRODUTOS 
WHERE UPPER(PRODUTO) LIKE '%OF%';

/*-------------------------------------------------------------
Obtenha todos os jogos por ordem decrescente de idProduto
-------------------------------------------------------------*/
SELECT * FROM PRODUTOS 
ORDER BY IDPRODUTO DESC;

/*-------------------------------------------------------------
Obtenha todos os jogos lançados em 2019 pela NaughtyDog
-------------------------------------------------------------*/
SELECT * FROM PRODUTOS 
WHERE ANOLANCAMENTO = 2019
AND STUDIO = 'NAUGHTYDOG';

/*-------------------------------------------------------------
Obtenha todos os jogos lançados pela NaughtyDog ou pela Sony
-------------------------------------------------------------*/
SELECT * FROM PRODUTOS 
WHERE STUDIO = 'NAUGHTYDOG'
OR STUDIO = 'SONY';

SELECT * FROM PRODUTOS 
WHERE STUDIO
IN ('NAUGHTYDOG', 'SONY');

/*-------------------------------------------------------------
Obtenha todos os jogos da categoria 'Tiro'
-------------------------------------------------------------*/
SELECT C.IDCATEGORIA, P.IDPRODUTO, P.PRODUTO 
FROM CATEGORIASPRODUTOS C
INNER JOIN PRODUTOS P ON P.IDPRODUTO = C.IDPRODUTO
WHERE C.IDCATEGORIA = 5;