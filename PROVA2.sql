CREATE TABLE TB_PRODUTO(
    cd_produto INT NOT NULL PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    subcategoria VARCHAR(50) NULL,
    valor NUMERIC(10,2) NOT NULL
)

CREATE TABLE TB_VENDAS(
    cod_venda INT NOT NULL PRIMARY KEY,
    dt_venda DATETIME NOT NULL,
    valor_unitario NUMERIC(10,2) NOT NULL,
    quantidade INT NOT NULL,
    valor_total NUMERIC(10,2) NOT NULL,
    cd_produto INT NOT NULL REFERENCES TB_PRODUTO (cd_produto)
)

SELECT cd_produto, descricao
FROM TB_PRODUTO
WHERE subcategoria IS NULL

SELECT P.cd_produto, P.descricao
FROM TB_PRODUTO P
WHERE P.descricao LIKE '%caneta%'

SELECT V.cod_venda, P.descricao, V.quantidade, V.valor_total
FROM TB_VENDAS V INNER JOIN TB_PRODUTO P
ON(V.cd_produto = P.cd_produto)
WHERE dt_venda >= '20190101' AND dt_venda <= '20191231'

select * from TB_VENDAS 

SELECT P.descricao, V.quantidade
FROM TB_VENDAS V INNER JOIN TB_PRODUTO P
ON(V.cd_produto = P.cd_produto)

SELECT P.categoria, SUM(V.valor_total)
FROM TB_VENDAS V INNER JOIN TB_PRODUTO P
ON(V.cd_produto = P.cd_produto)
GROUP BY P.categoria