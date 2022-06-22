SELECT
	MIN(Valor)
From
	Pedido_Venda


SELECT
	Max(valor)
From
	Pedido_Venda


Begin transaction

SELECT
	MIN(Data_Adesao)
FROM
	Fidelidade

SELECT *
    From Pedido_Compra

BEGIN transaction

SELECT 
	MAX(valor)
FROM
	Pedido_Venda
WHERE
	Data >= '2021-02-01' and Data <= '2021-02-28'



    SELECT 
	MAX(valor) -- Encontra o valor
FROM
	Pedido_Venda -- Seleciona a tabela
WHERE
	MONTH(data) = 3 -- informa a tabela e a condição para procura


Begin transaction

SELECT
	COUNT(*)
From
	Cliente

Begin transaction

SELECT
	COUNT(*)
From
	Pedido_Compra
WHERE
	Valor >1000


     
SELECT *   
FROM
    Cliente 
WHERE
    Estado = 'SP'


SELECT
	COUNT(*)
From
	Cliente
WHERE
	Estado ='SP'


--Quantas unidades de doces a Candies comprou?

Select
	SUM(Quantidade) --Some a coluna quantidade
From
	Item_Pedido_Compra -- Na tabela Item_Pedido_Compra

Begin TRANSACTION
Select *
From
	Pedido_Venda

Select
	SUM(Valor_imposto) --Some a coluna quantidade
From
	Pedido_Venda -- Na tabela Item_Pedido_Compra


BEGIN TRANSACTION

Select
	SUM(Pontos)
FROM
	Fidelidade

  

--Qual a média de gastos das compras da Candies?
BEGIN TRANSACTION
Select
	AVG(Valor) --Some a coluna quantidade
From
	Pedido_Compra -- Na tabela Item_Pedido_Compra


--Qual é o ticket médio dos clientes da Candies?

Begin TRANSACTION

Select
	AVG(Valor) --Média da coluna valor
From
	Pedido_Venda -- Na tabela Pedido_Venda

-- Qual a quantidade média de doces vendidos na Candies?

BEGIN TRANSACTION

Select
	AVG(Quantidade)
FROM
	Item_Pedido_Venda


Begin TRANSACTION
Select *
From
    Fidelidade


-- Qual o valor das vendas sem o valor do imposto?
SELECT
		valor-valor_imposto
	From
		Pedido_Venda

BEGIN TRANSACTION

SELECT
    
    Valor_Total/Quantidade
FROM
	Item_Pedido_Venda

BEGIN TRANSACTION

Select
	Valor_unitário+Valor_imposto
FROM
	Item_Pedido_Venda


    SELECT
	COUNT(*) AS Qdt_Clientes -- Contou a quantidade de clientes
	
FROM 
	Cliente -- Na tabela clientes
GROUP BY
	 Cidade -- E agrupou por cidade
	 

SELECT
	Tipo,
	COUNT(*) AS Pgto -- Contou a quantidade
	 
FROM 
	Forma_Pagamento -- Da tabela
GROUP BY
	 Tipo -- E agrupou 


SELECT
	Month(Data),
	Sum(Valor) AS Faturamento
FROM
	Pedido_Venda
Group by
	month(Data)


    SELECT
	CASE
		WHEN Estado = 'SP' THEN 'Dentro de São Paulo'
		WHEN Estado = 'RJ' THEN 'Dentro do Rio de Janeiro'
        ELSE 'Fora de São Paulo/Rio'
		END,
		Nome
	FROM
		Cliente
	
    SELECT *
    From Pedido_Venda


SELECT
	CASE
		WHEN Tipo like '%Crédito%' THEN 'Compras com cartão de Crédito'
		WHEN Tipo like '%Débito%' THEN 'Compras com cartão de Débito'
		WHEN Tipo like '%Refeição%' THEN 'Compras com cartão de Refeição'
		ELSE 'Outros Tipos'
		END As 'Forma de Pagamento'
	FROM
		Forma_Pagamento



SELECT
	C.Nome, -- Indica a tabela e o campo utilizado
	C.Logadouro, -- Indica a tabela e o campo utilizado
	F.Pontos, -- Indica a tabela e o campo utilizado
	F.Data_Adesao -- Indica a tabela e o campo utilizado
From
	Cliente AS C --onde vai buscar a informação
	INNER JOIN Fidelidade As F on C.Codigo = F.Codigo_Cliente -- Junção das tabelas
--	A que está com FK 1º depois a outra = Descreva o campo da chave FK



SELECT
	P.Nome,
	SUM(V.quantidade) As Qtde
	
From
	Item_Pedido_Venda as V
	INNER JOIN Produto as P on V.Codigo_Produto = P.Codigo
	GROUP BY
		P.Nome




SELECT
	P.Nome As Produto,
	M.Nome As Marca,
	M.Empresa,
	SUM(V.quantidade) As Qtde
From
	Item_Pedido_Venda as V
	INNER JOIN Produto as P on V.Codigo_Produto = P.Codigo
	INNER JOIN Marca as M on M.Codigo = P.Codigo_Marca
	GROUP BY
		P.Nome,
		M.Nome,
		M.Empresa
	ORDER BY
		SUM(V.quantidade) DESC



SELECT
	C.Nome,
	F.Pontos
FROM
	Cliente as C
	LEFT JOIN Fidelidade as F on C.Codigo = F.Codigo_Cliente


SELECT
	C.Nome,
	C.Logadouro,
	C.CEP,
	C.Cidade,
	C.Estado,
	C.Telefone,
	Case 
		When F.Pontos is Null then 0
		Else F.Pontos
		End as 'Pontos Clientes'
FROM
	Cliente as C
	LEFT JOIN Fidelidade as F on C.Codigo = F.Codigo_Cliente
	ORDER BY
		F.Pontos Desc

SELECT 
	D.Nome_Fantasia,
	CASE
		When Sum(Pedido.Valor) is Null then 0
		Else Sum(Pedido.Valor)
	End as Valor
FROM
	Distribuidor AS D
	LEFT JOIN Pedido_Compra as Pedido on D.Codigo = Pedido.Codigo_Distribuidor
GROUP BY
	D.Nome_Fantasia

ORDER BY
	Sum(Pedido.Valor) DESC
SELECT *
FROM
	Pedido_Compra



SELECT
	C.Nome,
	C.Celular
FROM
	Cliente as C
	LEFT JOIN Fidelidade As F on C.Codigo = F.Codigo_Cliente
Where
	Pontos is NULL


	