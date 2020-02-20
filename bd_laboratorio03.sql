CREATE DATABASE bd_laboratorio03

USE bd_laboratorio03

CREATE TABLE TB_DVD(
	codigo         INT         NOT NULL,
	titulo         VARCHAR(50) NOT NULL,
	ano_lancamento INT         NOT NULL,
	categoria      VARCHAR(50) NOT NULL,
	
	CONSTRAINT pk_DVD PRIMARY KEY(codigo)
)

CREATE TABLE TB_CLIENTE(
	matricula   INT         NOT NULL,
	nome        VARCHAR(50) NOT NULL,
	cpf         VARCHAR(13) NOT NULL,
	telefone    VARCHAR(15) NULL,
	dt_cadastro DATETIME    NOT NULL DEFAULT(GETDATE()),
	
	CONSTRAINT pk_CLIENTE PRIMARY KEY(matricula)
)

CREATE TABLE TB_TELEFONE_CLIENTE(
	matricula INT         NOT NULL,
	telefone  VARCHAR(20) NOT NULL,
	
	CONSTRAINT pk_TEL_CLIENTE PRIMARY KEY(matricula, telefone),
	CONSTRAINT fk_TEL_CLIENTE FOREIGN KEY(matricula) REFERENCES TB_CLIENTE(matricula)
)

--inserindo 3 DVDs
INSERT INTO TB_DVD(codigo, titulo, ano_lancamento, categoria)
VALUES(1, 'STAR WARS', 2019, 'FICÇÃO CIENTIFICA'),
	  (2,'VELOZES E FURIOSOS', 2020, 'AÇÃO'),
	  (3, 'SE EU NÃO TIVESSE TE CONHECIDO', 2018,  'ROMANCE')
	  (4, 'CORINGA', 2019, 'SUSPENSE')
	  
INSERT INTO TB_DVD(codigo, titulo, ano_lancamento, categoria)
VALUES(5, 'FROZEN 2', 2020, 'AVENTURA'),
	  (6,'JUMANJI', 2020, 'AVENTURA'),
	  (7, 'OS AERONAUTAS', 2018,  'AVENTURA')
	  
INSERT INTO TB_DVD(codigo, titulo, ano_lancamento, categoria)
VALUES(8, 'JARDIM DAS AFLIÇÕES', 2017, 'DOCUMENTÁRIO'),
	  (9,'FOR SAMA', 2019, 'DOCUMENTÁRIO'),
	  (10, 'AMY', 2015,  'DOCUMENTÁRIO')	  
	  
--inserindo 2 clientes 
INSERT INTO TB_CLIENTE (matricula, nome, cpf, telefone, dt_cadastro)
VALUES(202001, 'LILIANE', '1234', '9999', '20200218'),
	  (202002, 'ALESSANDRA', '2344', '8888','20200118')

--inserindo 1 cliente sem telefone
INSERT INTO TB_CLIENTE(matricula, nome, cpf, dt_cadastro)
VALUES(202003, 'JESSICA', '3456', '20200219')

INSERT INTO TB_CLIENTE(matricula, nome, cpf, dt_cadastro)
VALUES(2025, 'PABLO', '4341', '20200119')

--selecionando todas as informações de todos os DVDs
SELECT * FROM TB_DVD

--selecionando os dvds lançados em 1997
SELECT * FROM TB_DVD WHERE ano_lancamento = 1997

--Selecionar todos os DVDs com Ano de Lançamento igual a 2005 e Categoria igual a SUSPENSE
SELECT * FROM TB_DVD WHERE ano_lancamento = 2005 AND categoria = 'SUSPENSE'

--Selecionar somente o Código e o Título dos DVDs.
SELECT codigo, titulo FROM TB_DVD

--Selecionar todos os Clientes ordenados pelo Nome;
SELECT * FROM TB_CLIENTE ORDER BY nome ASC

--Selecionar todos os DVDs ordenados pelo Ano de Lançamento de forma decrescente
SELECT * FROM TB_DVD ORDER BY ano_lancamento DESC

-- Selecionar todos os Clientes que possuem telefone
SELECT * FROM TB_CLIENTE WHERE telefone IS NOT NULL

--Selecionar todos os DVDs que tenham no seu título a palavra ‘ROCKY’
SELECT * FROM TB_DVD WHERE titulo LIKE '%ROCKY%''

--Atualizar o cliente de matricula 2025 e alterar o seu telefone
UPDATE TB_CLIENTE SET telefone = '7623' WHERE matricula = 2025

--Atualizar todos os DVDs da categoria AVENTURA e modificar a categoria para AÇÃO
UPDATE TB_DVD SET categoria = 'AÇÃO' WHERE categoria = 'AVENTURA'

--Remover todos os DVDs de categoria DOCUMENTÁRIO
DELETE FROM TB_DVD
WHERE categoria = 'DOCUMENTÁRIO'

--Remover todos os Clientes que não possuem telefone
DELETE FROM TB_CLIENTE 
WHERE telefone IS NULL

--TESTES:
DROP TABLE TB_CLIENTE
DROP TABLE TB_TELEFONE_CLIENTE
SELECT * FROM TB_CLIENTE
UPDATE TB_DVD SET ano_lancamento = 2005 WHERE codigo = 4


