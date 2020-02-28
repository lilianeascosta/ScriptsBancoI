CREATE DATABASE bd_aula04
COLLATE Latin1_General_CS_AI

USE bd_aula04

SELECT db_name()

--------------------------------------------

CREATE TABLE TB_ESTADO(
	cod_estado INT NOT NULL,
	estado CHAR(2) NOT NULL UNIQUE,
	
	CONSTRAINT pk_ESTADO PRIMARY KEY (cod_estado)
)

INSERT INTO TB_ESTADO 
VALUES (1, 'SE'),
	   (2, 'AL'),
	   (3, 'PB')
	   
CREATE TABLE TB_CIDADE(
	cod_cidade INT         NOT NULL,
	cidade     VARCHAR(50) NOT NULL,
	cod_estado INT         NOT NULL,
	
	CONSTRAINT pk_CIDADE PRIMARY KEY(cod_cidade),
	CONSTRAINT fk_CIDADE_ESTADO FOREIGN KEY(cod_estado) REFERENCES TB_ESTADO(cod_estado)
)

INSERT INTO TB_CIDADE (cod_cidade, cidade, cod_estado)
VALUES (10, 'ARACAJU', 1),
	   (20, 'ITABAIANA', 1),
	   (30, 'MACEIÓ', 2),
	   (40, 'PENEDO', 2),
	   (50, 'JOÃO PESSOA', 3),
	   (60, 'CAMPINA GRANDE', 3)

CREATE TABLE TB_FUNCIONARIO (
	matricula  INT           NOT NULL IDENTITY(100,1),
	nome       VARCHAR(50)   NOT NULL,
	sexo       CHAR(1)       CHECK (sexo IN ('M', 'F')),
	salario    NUMERIC(10,2) NULL,
	cod_cidade INT NOT NULL,
	
	CONSTRAINT pk_FUNCIONARIO PRIMARY KEY(matricula),
	CONSTRAINT fk_FUNCIONARIO FOREIGN KEY(cod_cidade) REFERENCES TB_CIDADE(cod_cidade)
)

INSERT INTO TB_FUNCIONARIO 
VALUES ('CARINA DOS SANTOS', 'F', 2500.00, 10)

SELECT * FROM TB_FUNCIONARIO

--COUNT() : conta a quantidade de linhas de uma determinada coluna da tabela, nao conta os NULLs

SELECT COUNT(matricula) FROM TB_FUNCIONARIO

SELECT COUNT(nome) FROM TB_FUNCIONARIO WHERE cod_cidade = 10

SELECT COUNT(salario) FROM TB_FUNCIONARIO

--SUM () : soma os valores de todas as linhas de uma determinada coluna da tabela
SELECT SUM(salario) FROM TB_FUNCIONARIO

--AVG () : calcula a média aritmetica dos valores de uma determinada coluna da tabela
SELECT AVG(salario) FROM TB_FUNCIONARIO

-- avg é equivalente a:
SELECT SUM(salario)/COUNT(salario) FROM TB_FUNCIONARIO 

--MAX pega o valor maximo de uma coluna, MIN pega o valor minimo de uma coluna, seja um valor numerico ou cadeia de caracteres
SELECT MAX(salario) FROM TB_FUNCIONARIO 

SELECT MIN(salario) FROM TB_FUNCIONARIO 

SELECT MAX(LEN(NOME)) FROM TB_FUNCIONARIO 

SELECT MIN(LEN(NOME)) FROM TB_FUNCIONARIO 

--datas
SELECT * FROM TB_DATAS

--pega a data mais atual
SELECT MAX(DATA) FROM TB_DATAS

--pega a data mais antiga
SELECT MIN(DATA) FROM TB_DATAS

--GROUP BY: quando queremos agrupar os dados de uma tabela com alguma retstrição
-- Vamos imaginar a necessidade dos seguintes relatórios:
-- a) O Total de Salário pago por Sexo de Funcionário
-- b) O número de funcionários por Sexo

SELECT sexo, SUM(salario) FROM TB_FUNCIONARIO --nao tem como fazer dessa forma

SELECT cod_cidade, sexo, SUM(salario), AVG(salario)
FROM TB_FUNCIONARIO
GROUP BY cod_cidade

SELECT sexo, SUM(salario), AVG(salario)
FROM TB_FUNCIONARIO 
GROUP BY sexo 

SELECT sexo, COUNT(matricula)
FROM TB_FUNCIONARIO 
GROUP BY sexo 

-- c) Qual a média salarial por Cidade ?

SELECT C.cidade, AVG(F.salario)
FROM TB_FUNCIONARIO F INNER JOIN TB_CIDADE C
ON(F.cod_cidade = C.cod_cidade)
GROUP BY C.cidade

-- d) Qual o maior salário pago por Cidade ?
SELECT C.cidade, MAX(F.salario)
FROM TB_FUNCIONARIO F INNER JOIN TB_CIDADE C
ON(F.cod_cidade = C.cod_cidade)
GROUP BY C.cidade

--e) Qual é o Total de Salários Pagos por Estado ?


--testes:
DROP DATABASE bd_aula04

