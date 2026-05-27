USE bdEstoque

-- descrição do produto ao lado do nome do fabricante

SELECT descricaoProduto AS 'Descrição do Produto', nomeFabricante AS 'Nome do Fabricante' FROM tbProduto 
	INNER JOIN tbFabricante 
		ON tbProduto.codFabricante = tbFabricante.codFabricante;

-- descrição do produto ao lado do nome do fornecedor

SELECT descricaoProduto AS 'Descrição do Produto', nomeFornecedor AS 'Nome do Fornecedor' FROM tbProduto
	INNER JOIN tbFornecedor
		ON tbProduto.codFornecedor = tbFornecedor.codFornecedor;

-- soma das quantidades dos produtos agrupadas pelo nome do fabricante

SELECT SUM (quantidadeProduto) AS 'Quantidade', nomeFabricante AS 'Nome do Fabricante' FROM tbProduto
	INNER JOIN tbFabricante 
		ON tbProduto.codFabricante = tbFabricante.codFabricante
			GROUP BY tbFabricante.nomeFabricante;

-- total das vendas ao lado do nome do cliente

SELECT SUM (valorTotalVenda) AS 'Valor Total das Vendas', nomeCliente AS 'Nome do Cliente' FROM tbVenda
	INNER JOIN tbCliente
		ON tbVenda.codCliente = tbCliente.codCliente
			GROUP BY nomeCliente;

-- média dos preços dos produtos agrupados pelo nome do fornecedor

SELECT nomeFornecedor AS 'Nome do Fornecedor', AVG (valorProduto) AS 'Média do Valor dos Produtos' FROM tbFornecedor
	INNER JOIN tbProduto	
		ON tbProduto.codFornecedor = tbFornecedor.codFornecedor	
			GROUP BY nomeFornecedor;

-- soma das vendas agrupadas pelo nome do cliente em ordem alfabética

SELECT SUM (valorTotalVenda) AS 'Valor Total das Vendas', nomeCliente AS 'Nome do Cliente' FROM tbVenda
	INNER JOIN tbCliente
		ON tbVenda.codCliente = tbCliente.codCliente
			GROUP BY nomeCliente 
			ORDER BY nomeCliente ASC;

-- soma dos preços dos produtos agrupados pelo nome do fabricante

SELECT nomeFabricante AS 'Nome do Fabricante', SUM (valorProduto) AS 'Soma do Valor dos Produtos' FROM tbFabricante
	INNER JOIN tbProduto
		ON tbProduto.codFabricante = tbFabricante.codFabricante
			GROUP BY nomeFabricante;

-- média dos preços dos produtos agrupados pelo nome do fornecedor

SELECT nomeFornecedor AS 'Nome do Fornecedor', AVG (valorProduto) AS 'Média do Valor dos Produtos' FROM tbFornecedor
	INNER JOIN tbProduto	
		ON tbProduto.codFornecedor = tbFornecedor.codFornecedor
			GROUP BY nomeFornecedor;

-- soma das vendas agrupadas pelo nome do produto

SELECT descricaoProduto AS 'Nome do Produto', SUM (subTotalItemVenda) AS 'Soma das Vendas' FROM tbProduto
	INNER JOIN tbItemVenda
		ON tbProduto.codProduto = tbItemVenda.codProduto
			GROUP BY descricaoProduto;

-- soma das vendas pelo nome do cliente, somente vendas realizadas em fevereiro de 2014

SELECT nomeCliente AS 'Nome do Cliente', SUM (valorTotalVenda) AS 'Soma das Vendas' FROM tbCliente
	INNER JOIN tbVenda
		ON tbCliente.codCliente = tbVenda.codCliente
			WHERE MONTH (dataVenda) = 2
			AND YEAR (dataVenda) = 2014
				GROUP BY nomeCliente;
