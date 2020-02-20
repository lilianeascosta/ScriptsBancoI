CREATE DATABASE bd_aula03

USE bd_aula03

SELECT db_name()

CREATE TABLE TB_DEPARTAMENTO(
	cod_departamento  INT        NOT NULL PRIMARY KEY,
	nome_departamento VARCHAR(50) NULL
)

INSERT INTO TB_DEPARTAMENTO
VALUES (1, 'RH'),
	   (2, 'TI'),
	   (3, 'FI')
	   
SELECT * FROM TB_DEPARTAMENTO

CREATE TABLE TB_FUNCIONARIO(
	matricula        INT           NOT NULL PRIMARY KEY,
	nome             VARCHAR(50)   NOT NULL,
	salario          NUMERIC(10,2) NOT NULL,
	cod_departamento INT           NULL
)

DELETE FROM TB_FUNCIONARIO
INSERT INTO TB_FUNCIONARIO
VALUES (10, 'JOAO RICARDO', 2000.00, 1),
       (20, 'DANIEL DOS SANTOS', 2500.00, 1),
       (30, 'ROBERTA SILVA', 2000.00, 2),
       (40, 'JULIANA TRINDADE', 3000.00, 2),
       (50, 'LUIZ ANTONIO', 1800.00, NULL)
       
SELECT * FROM TB_FUNCIONARIO

--a função UPPER deixa o atributo caixa alta, e o LIKE pega oq foi definido, o % significa qualquer coisa
SELECT * FROM TB_FUNCIONARIO WHERE UPPER(nome) LIKE 'JOAO%'

SELECT * FROM TB_FUNCIONARIO WHERE LIKE 'J%'

SELECT * FROM TB_FUNCIONARIO WHERE LIKE 'joao%'

SELECT * FROM TB_FUNCIONARIO WHERE LIKE '%SILVA%'

-- 1 underline significa 1 caractere
SELECT * FROM TB_FUNCIONARIO WHERE LIKE '__N%'

SELECT matricula, nome FROM TB_FUNCIONARIO 

--dando um apelido para essa seleção de TB_FUNCIONARIO
SELECT F.matricula, F.nome FROM TB_FUNCIONARIO F

--outra forma de dar um apelido para essa seleção de TB_FUNCIONARIO
SELECT F.matricula, F.nome FROM TB_FUNCIONARIO AS F

SELECT F.matricula, F.nome, D.nome_departamento
FROM TB_FUNCIONARIO F INNER JOIN TB_DEPARTAMENTO D
ON (F.cod_departamento = D.cod_departamento)
WHERE D.nome_departamento = 'TI'

SELECT F.matricula, F.nome, D.cod_departamento
FROM TB_FUNCIONARIO F, TB_DEPARTAMENTO D, TB_CARGO C
WHERE (F.cod_departamento = D.cod_departamento) AND (F.cod_cargo = C.cod_cargo)

SELECT F.matricula, F.nome, D.nome_departamento, C.descricao
FROM TB_FUNCIONARIO F INNER JOIN TB_DEPARTAMENTO D
ON (F.cod_departamento = D.cod_departamento ) INNER JOIN TB_CARGO C
ON (F.cod_cargo = C.cod_cargo)


--FILTROS
SELECT F.matricula, F.nome, D.nome_departamento
FROM TB_FUNCIONARIO F INNER JOIN TB_DEPARTAMENTO D
ON (F.cod_departamento = D.cod_departamento )
WHERE D.cod_departamento  = 1

SELECT F.matricula, F.nome, D.nome_departamento
FROM TB_FUNCIONARIO F, TB_DEPARTAMENTO D
WHERE (F.cod_departamento = D.cod_departamento ) AND D.cod_departamento  = 1 

--OUTER JOIN (seleciona todos os atributos da direita ou esquerda, inclusive os NULL)
SELECT * FROM TB_FUNCIONARIO

SELECT F.matricula, F.nome, D.nome_departamento
FROM TB_FUNCIONARIO F INNER JOIN TB_DEPARTAMENTO D
ON (F.cod_departamento = D.cod_departamento)

--LEFT OUTER JOIN
SELECT F.matricula, F.nome, D.nome_departamento
FROM TB_FUNCIONARIO F LEFT OUTER JOIN TB_DEPARTAMENTO D
ON (F.cod_departamento =D.cod_departamento)

--nomeando os atributos nulos do lado esquerdo como 'SEM DEPARTAMENTO'
SELECT F.matricula, F.nome, ISNULL (D.nome_departamento, 'SEM DEPARTAMENTO')
FROM TB_FUNCIONARIO F LEFT OUTER JOIN TB_DEPARTAMENTO D
ON (F.cod_departamento = D.cod_departamento )

--RIGHT OUTER JOIN
SELECT F.matricula, F.nome, D.nome_departamento
FROM TB_DEPARTAMENTO D RIGHT OUTER JOIN TB_FUNCIONARIO F
ON (F.cod_departamento = D.cod_departamento )

SELECT F.matricula, F.nome, D.nome_departamento
FROM TB_FUNCIONARIO F RIGHT OUTER JOIN TB_DEPARTAMENTO D
ON (F.cod_departamento = D.cod_departamento )

--FULL OUTER JOIN (é a junção do RIGHT OUTER JOIN com o LEFT OUTER JOIN ao mesmo tempo)
SELECT F.matricula, F.nome, D.nome_departamento
FROM TB_FUNCIONARIO F FULL OUTER JOIN TB_DEPARTAMENTO D
ON(F.cod_departamento = D.cod_departamento )