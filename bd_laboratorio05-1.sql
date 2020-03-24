   
DROP TABLE TB_BUGS
DROP TABLE TB_FUNCIONARIO
DROP TABLE TB_MODULO
DROP TABLE TB_CARGO
DROP TABLE TB_PROJETO

CREATE DATABASE bd_laboratorio051

USE bd_laboratorio051

-- Tabela de Cargo

CREATE TABLE TB_CARGO (
   CD_CARGO INT NOT NULL PRIMARY KEY,
   NM_CARGO VARCHAR(70) NOT NULL
)

INSERT INTO TB_CARGO VALUES (100,'ANALISTA')
INSERT INTO TB_CARGO VALUES (200,'PROGRAMADOR')
INSERT INTO TB_CARGO VALUES (300,'GERENTE')


-- Tabela de FUncionario
CREATE TABLE TB_FUNCIONARIO (
 CD_FUNCIONARIO INT NOT NULL PRIMARY KEY,
 NM_FUNCIONARIO VARCHAR(60) NOT NULL,
 CD_CARGO INT NULL,
 SITUACAO VARCHAR(30) NOT NULL CHECK (SITUACAO IN ('ATIVO','INATIVO'))
)

ALTER TABLE TB_FUNCIONARIO ADD CONSTRAINT FK_CD_CARGO
FOREIGN KEY (CD_CARGO) REFERENCES TB_CARGO (CD_CARGO)

INSERT INTO TB_FUNCIONARIO VALUES(1, 'JOAO', 100, 'ATIVO')
INSERT INTO TB_FUNCIONARIO VALUES(2, 'CARLO', 200, 'ATIVO')
INSERT INTO TB_FUNCIONARIO VALUES(3, 'JOANA', 100, 'INATIVO')
INSERT INTO TB_FUNCIONARIO VALUES(4, 'RAFAEL', 100, 'ATIVO')

-- Tabela de Projeto

CREATE TABLE TB_PROJETO (
   CD_PROJETO INT NOT NULL PRIMARY KEY,
   NM_PROJETO VARCHAR(60) NOT NULL,
   DT_INICIO DATETIME NOT NULL,
   DT_FIM DATETIME NULL
)

INSERT INTO TB_PROJETO VALUES(10, 'MATRICULA ONLINE','20190101', '20190601')
INSERT INTO TB_PROJETO VALUES(20, 'WEB AULA','20190401', '20190531')
INSERT INTO TB_PROJETO VALUES(30, 'BIBLIOTECA ONLINE','20190101', NULL)

-- Tabela de Modulo 

CREATE TABLE TB_MODULO (
   CD_MODULO INT NOT NULL PRIMARY KEY,
   NM_MODULO VARCHAR(60) NOT NULL,
   CD_PROJETO INT NOT NULL
)

ALTER TABLE TB_MODULO ADD CONSTRAINT FK_CD_PROJETO
FOREIGN KEY (CD_PROJETO) REFERENCES TB_PROJETO (CD_PROJETO)

INSERT INTO TB_MODULO VALUES(1, 'CADASTROS', 10)
INSERT INTO TB_MODULO VALUES(2, 'RELATORIOS', 10)

INSERT INTO TB_MODULO VALUES(3, 'MATERIAL', 20)
INSERT INTO TB_MODULO VALUES(4, 'CHAT', 20)

INSERT INTO TB_MODULO VALUES(5, 'PESQUISA', 30)
INSERT INTO TB_MODULO VALUES(6, 'RESERVA', 30)

-- Tabela de Bugs

CREATE TABLE TB_BUGS (
    CD_BUG INT NOT NULL PRIMARY KEY,
    DESCRICAO VARCHAR(80) NOT NULL,
    DT_NOTIFICACAO DATETIME NOT NULL,
    DT_RESOLVIDO DATETIME NULL,
    CD_MODULO INT NOT NULL,   
    CD_FUNCIONARIO INT NOT NULL
)


ALTER TABLE TB_BUGS ADD CONSTRAINT FK_CD_MODULO
FOREIGN KEY (CD_MODULO) REFERENCES TB_MODULO (CD_MODULO)

ALTER TABLE TB_BUGS ADD CONSTRAINT FK_CD_FUNCIONARIO
FOREIGN KEY (CD_FUNCIONARIO) REFERENCES TB_FUNCIONARIO(CD_FUNCIONARIO)

INSERT INTO TB_BUGS (CD_BUG, DESCRICAO, DT_NOTIFICACAO, DT_RESOLVIDO, CD_MODULO, CD_FUNCIONARIO)
VALUES (1, 'CAMPO PEQUENO PARA VALOR', '20190201',NULL,1, 1)

INSERT INTO TB_BUGS (CD_BUG, DESCRICAO, DT_NOTIFICACAO, DT_RESOLVIDO, CD_MODULO, CD_FUNCIONARIO)
VALUES (2, 'EXCECAO NAO TRATADA', '20190301',NULL,2, 2)

INSERT INTO TB_BUGS (CD_BUG, DESCRICAO, DT_NOTIFICACAO, DT_RESOLVIDO, CD_MODULO, CD_FUNCIONARIO)
VALUES (3, 'SQL INCORRETO', '20190410',NULL,4, 3)

INSERT INTO TB_BUGS (CD_BUG, DESCRICAO, DT_NOTIFICACAO, DT_RESOLVIDO, CD_MODULO, CD_FUNCIONARIO)
VALUES (4, 'SQL INCORRETO', '20190410',NULL,4, 2)

INSERT INTO TB_BUGS (CD_BUG, DESCRICAO, DT_NOTIFICACAO, DT_RESOLVIDO, CD_MODULO, CD_FUNCIONARIO)
VALUES (5, 'ERRO DE ACESSO A DADOS', '20190510', '20190511',5, 3)
	
	
--Selecionar todos os Projetos e a Descrição dos Bugs encontrados. O resultado da
--consulta deve apresentar o Nome do Projeto, o Nome do Módulo do Projeto, a
--Descrição do Bug e a Data de Notificação do Bug
SELECT P.nm_projeto AS "NOME PROJETO", M.nm_modulo AS "NOME MODULO", B.descricao AS "DESCRICAO", B.dt_notificacao AS "DT NOTIFICACAO"
FROM TB_PROJETO P INNER JOIN TB_MODULO M
ON(P.cd_projeto = M.cd_projeto)
	INNER JOIN TB_BUGS B
	ON (M.cd_modulo = B.cd_modulo)

	
---Selecionar a quantidade de bugs encontrados ou registrados por funcionário. O
---resultado da consulta deve apresentar o Nome do Funcionário, o Nome do Cargo do
---Funcionário e Quantidade de Bugs.
SELECT COUNT(B.CD_BUG), F.nm_funcionario, C.nm_cargo
FROM TB_BUGS B INNER JOIN TB_FUNCIONARIO F
ON(B.cd_funcionario = F.cd_funcionario)
	INNER JOIN TB_CARGO C
	ON(F.cd_cargo = C.cd_cargo)
	GROUP BY B.cd_bug, F.nm_funcionario, C.nm_cargo
	

---Selecionar a quantidade de bugs encontrados ou registrados por funcionário. O
---resultado da consulta deve apresentar o Nome do Funcionário, o Nome do Cargo do
---Funcionário e Quantidade de Bugs. Somente os Funcionários Ativos devem ser apresentados.
SELECT COUNT(B.cd_bug), F.nm_funcionario, C.nm_cargo
FROM TB_BUGS B INNER JOIN TB_FUNCIONARIO F
ON (B.cd_funcionario = F.cd_funcionario)
	INNER JOIN TB_CARGO C
	ON(C.cd_cargo = F.cd_cargo)
	WHERE F.situacao = 'ATIVO'
	GROUP BY B.cd_bug, F.nm_funcionario, C.nm_cargo
	
	
---Selecionar a quantidade de bugs encontrados por Projeto. O resultado da consulta deve
---apresentar o Nome do Projeto, a Data de Inicio do Projeto e a Quantidade de Bugs.
---Todos os Projetos devem ser apresentados.
SELECT P.nm_projeto, P.dt_inicio, COUNT(B.cd_bug)
FROM TB_BUGS B INNER JOIN TB_MODULO M
ON (B.cd_modulo = M.cd_modulo)
	INNER JOIN TB_PROJETO P
	ON(P.cd_projeto = M.cd_projeto)
	GROUP BY P.nm_projeto, P.dt_inicio, B.cd_bug
	
	
---Selecionar a quantidade de bugs encontrados por Projeto. O resultado da consulta deve
---apresentar o Nome do Projeto, a Data de Inicio do Projeto e a Quantidade de Bugs.
---Somente os Projetos com Quantidade de Bugs maior que 1 e menor que 10 devem ser apresentados.
SELECT P.nm_projeto, P.dt_inicio, COUNT(B.cd_bug)
FROM TB_BUGS B INNER JOIN TB_MODULO M
ON(B.cd_modulo = M.cd_modulo)
	INNER JOIN TB_PROJETO P
	ON(M.cd_projeto = P.cd_projeto)
	GROUP BY P.nm_projeto, P.dt_inicio, B.cd_bug
	HAVING COUNT(B.cd_bug) > 1 AND COUNT(B.cd_bug) < 10
	
	