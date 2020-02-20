CREATE DATABASE bd_laboratorio02

USE bd_laboratorio02

CREATE TABLE TB_FUNCIONARIO(
	matricula      INT          NOT NULL,
	nm_funcionario VARCHAR(50)  NOT NULL,
	cpf            VARCHAR(50)  NOT NULL,
	dt_admissao    DATETIME     NOT NULL
)


CREATE TABLE TB_ATRIBUTO(
	cd_produto  INT           NOT NULL,
	ds_produto  VARCHAR(50)   NOT NULL,
	categoria VARCHAR(20)     NOT NULL,
	valor_atual NUMERIC(10,2) NOT NULL
)

ALTER TABLE TB_ATRIBUTO ADD CONSTRAINT CK_CATEGORIA CHECK(categoria IN('Alimento', 'Perfumaria', 'Brinquedo'))

CREATE TABLE TB_VENDAS(
	matricula      INT           NOT NULL,
	cd_produto     INT           NOT NULL,
	quantidade     INT           NOT NULL,
	valor_unitario NUMERIC(10,2) NOT NULL,
	dt_venda       DATETIME      NOT NULL
) 

INSERT INTO TB_FUNCIONARIO(matricula, nm_funcionario, cpf, dt_admissao)
VALUES (1, 'LILIANE', '123', '20200214'),
       (2, 'ALESSANDRA', '234', '20200114'),
       (3, 'JESSICA', '345', '20200115')
       
INSERT INTO TB_ATRIBUTO(cd_produto, ds_produto, categoria, valor_atual)
VALUES (1, 'ARROZ 1KG', 'ALIMENTO', 2.34),
       (2, 'SABONETE LIQUIDO', 'PERFUMARIA', 4.55),
       (3, 'BONECA ESTRELA', 'BRINQUEDO', 32.91),
       (4, 'FEIJAO', 'ALIMENTO', 12.99)
       
       DROP TABLE TB_VENDAS
       
INSERT INTO TB_VENDAS(matricula, cd_produto, quantidade, valor_unitario, dt_venda) 
VALUES(100, 1, 10, 5.32, '20200217'),
	  (200, 2, 10, 7.52, '20200216'),
	  (300, 2, 10, 6.25, '20200215')

--Selecionar a matrícula, o nome e data de admissão dos funcionários (A coluna matrícula deve aparecer como “Registro do Funcionário”
SELECT 'Registro do Funcionário' AS registro, nm_funcionario, dt_admissao
FROM TB_FUNCIONARIO

--Selecionar os funcionários cuja data de admissão é maior ou igual a 01/03/2010
SELECT * FROM TB_FUNCIONARIO WHERE dt_admissao >= '20100301'

--Selecionar as diferentes categorias existentes na Tabela de Produtos
SELECT DISTINCT categoria FROM TB_ATRIBUTO

--Selecionar os produtos cuja descrição contenha a palavra “chocolate”
SELECT * FROM TB_ATRIBUTO WHERE ds_produto LIKE '%chocolate%'

--Selecionar todas as vendas ordenadas em ordem decrescente pela data da venda.
SELECT * FROM TB_VENDAS ORDER BY dt_venda DESC

--Selecionar todas as vendas apresentando o valor total de cada venda (valor unitário * quantidade)
SELECT (valor_unitario*quantidade) AS total FROM TB_VENDAS

--Selecionar todas as vendas efetuadas pelos funcionários de matrícula 1 e 2 (Utilize o operador IN)
SELECT * FROM TB_VENDAS 


