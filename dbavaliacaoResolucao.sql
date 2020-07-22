USE dbavaliacao1;

/*Index Nome Cliente*/
CREATE INDEX IX_NomeCliente
ON clientes (Nomecliente);

SHOW INDEX FROM Clientes;

/*
Procudere código produto:
	-Total dos produtos: somatório da quantidade * valor unitário
	-Total dos descontos: somatória de todos os descontos
	-Total do pedido: total dos produtos - total dos descontos

*/
DELIMITER $$ 
CREATE PROCEDURE spBuscaPedido(
	IN PedId INT 
)
BEGIN 
		SELECT IP.ValorUnitario,
		 CONCAT('R$ ', COUNT(IP.Quantidade) * IP.ValorUnitario) AS 'TotalPedido'
		FROM ItensPedido IP
			INNER JOIN Pedidos P on P.IdPedido = IP.IdPedido
		WHERE IP.IdPedido = PedId;
END $$
DELIMITER ;

CALL spBuscaPedido(2)