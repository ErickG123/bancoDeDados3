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

/*Outra forma de fazer o SELECT*/
SELECT C.IDCATEGORIA, P.IDPRODUTO, P.PRODUTO 
FROM CATEGORIASPRODUTOS C,
	 PRODUTOS P
WHERE P.IDPRODUTO = C.IDPRODUTO AND
	  C.IDCATEGORIA = 5;
      
/*-------------------------------------------------------------
Altere a pesquisa anterior para exibir o nome da categoria. 
Além de 'Tiro', mostre também os games da categoria 'Aventura'
-------------------------------------------------------------*/
SELECT C.IDCATEGORIA, CT.CATEGORIA, P.IDPRODUTO, P.PRODUTO 
FROM CATEGORIASPRODUTOS C
	INNER JOIN PRODUTOS P ON P.IDPRODUTO = C.IDPRODUTO
    INNER JOIN CATEGORIAS CT ON CT.IDCATEGORIA = C.IDCATEGORIA
WHERE C.IDCATEGORIA = 5 OR 
	  C.IDCATEGORIA = 6;
      
/*Outra forma de fazer o SELECT*/
SELECT C.IDCATEGORIA, CT.CATEGORIA, P.IDPRODUTO, P.PRODUTO 
FROM CATEGORIASPRODUTOS C
	INNER JOIN PRODUTOS P ON P.IDPRODUTO = C.IDPRODUTO
    INNER JOIN CATEGORIAS CT ON CT.IDCATEGORIA = C.IDCATEGORIA
WHERE C.IDCATEGORIA IN (5, 6);	

/*-------------------------------------------------------------
Exibir todos os games compatíveis com PS4
-------------------------------------------------------------*/
SELECT PP.IDPLATAFORMA, PP.IDPRODUTO, P.PRODUTO
FROM PLATAFORMASPRODUTOS PP
	INNER JOIN PRODUTOS P ON P.IDPRODUTO = PP.IDPRODUTO
WHERE PP.IDPLATAFORMA = 2;

/*-------------------------------------------------------------
Exibir todos os games compatíveis com PS4 e PS3 mostrando o
nome da plataforma
-------------------------------------------------------------*/
SELECT PP.IDPLATAFORMA, PT.PLATAFORMA, PP.IDPRODUTO, P.PRODUTO
FROM PLATAFORMASPRODUTOS PP
	INNER JOIN PRODUTOS P ON P.IDPRODUTO = PP.IDPRODUTO
	INNER JOIN PLATAFORMAS PT ON PT.IDPLATAFORMA = PP.IDPLATAFORMA
WHERE PP.IDPLATAFORMA IN (2, 3);

/*-------------------------------------------------------------
Obtenha a quantidade de games compatíveis com Xbox One
-------------------------------------------------------------*/
SELECT COUNT(PP.IDPRODUTO) AS QTDPRODUTOS
FROM PLATAFORMASPRODUTOS PP 
WHERE PP.IDPLATAFORMA = 1;

/*-------------------------------------------------------------
Obtenha a média dos dos preços jogos, independentemente da 
plataforma
-------------------------------------------------------------*/  
SELECT AVG(PRECO) AS MEDIA 
FROM PLATAFORMASPRODUTOS;

/*-------------------------------------------------------------
Obtenha a média dos dos preços jogos, por plataforma
-------------------------------------------------------------*/ 
SELECT PT.PLATAFORMA, 
	   AVG(PRECO) AS MEDIA 
FROM PLATAFORMASPRODUTOS PP
	INNER JOIN PLATAFORMAS PT ON PT.IDPLATAFORMA = PP.IDPLATAFORMA	
GROUP BY PP.IDPLATAFORMA;