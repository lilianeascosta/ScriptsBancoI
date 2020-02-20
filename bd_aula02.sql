CREATE DATABASE db_aula02

--cria tabela TB_LOJA
CREATE TABLE TB_LOJA(
	codigo INT IDENTITY(1,1) NOT NULL, --IDENTITY iniciando de 1 e incrementando 1 a cada novo registro
	nome VARCHAR(50) NOT NULL
)

--Insere dados na TB_LOJA
INSERT INTO TB_LOJA (nome)
VALUES ('loja sul'),
	   ('loja centro sul'),
	   ('loja norte'),
	   ('loja centro')
	   
--altera a TB_LOJA adicionando a coluna estado
ALTER TABLE TB_LOJA ADD estado CHAR(2)

--alterando o tipo da coluna nome da tabela TB_LOJA
ALTER TABLE TB_LOJA ALTER COLUMN nome VARCHAR(100) NOT NULL

--atualizando os estados das lojas de codigo 1 e 2
UPDATE TB_LOJA SET estado = 'SE' WHERE codigo IN (1,2)

--atualizando os estados das lojas de codigo 3
UPDATE TB_LOJA SET estado = 'AL' WHERE codigo IN (3)

--selecionando uma coluna da tabela TB_LOJA para impressao
SELECT estado FROM TB_LOJA

--o distinct não seleciona valores repetidos
SELECT DISTINCT estado FROM TB_LOJA

--ordenando por estado alfabeticamente
SELECT * FROM TB_LOJA ORDER BY estado 

--ordenando pelos codigos 3, 2 em diante
SELECT * FROM TB_LOJA ORDER BY 3, 2

--ordenando os estados em ordem crescente
SELECT * FROM TB_LOJA ORDER BY estado ASC

--ordenando os estados e os nomes em ordem decrescente. OBS: o padrão é ASC
SELECT * FROM TB_LOJA ORDER BY estado DESC, nome DESC 

--seleciona tudo da linha 1 do topo
SELECT TOP 1 * FROM TB_LOJA

--seleciona o nome e estado das 2 linhas do topo
SELECT TOP 2 nome, estado FROM TB_LOJA

--apaga a tabela funcionario
DROP TABLE TB_FUNCIONARIO

--cria uma nova tabela
CREATE TABLE TB_FUNCIONARIO(
	matricula INT NOT NULL,
	nome VARCHAR(50)
)

--inserindo valore spara a TB_FUNCIONARIO de uma nova forma, mas que não será suportado caso haja alteração na tabela
INSERT INTO TB_FUNCIONARIO 
VALUES (1, 'ANDRE'),
	   (2, 'JOAO'),
	   (3, 'RICARDO')

--selecionando tudo da TB_FUNCIONARIO	   
SELECT * FROM TB_FUNCIONARIO

--criação de uma tabela atraves de uma consulta, com isso cria uma tabela igual, geralmente usada para testes
SELECT  * INTO TB_FUNCIONARIO_2 FROM TB_FUNCIONARIO

SELECT * FROM TB_FUNCIONARIO_2

DROP TABLE TB_FUNCIONARIO_2 

--caso queira copiar somente a estrutura da tabela:
SELECT * INTO TB_FUNCIONARIO_2 FROM TB_FUNCIONARIO WHERE 1<>1

INSERT INTO TB_FUNCIONARIO_2 
VALUES (1, 'ANDRE'),
	   (2, 'ROBERTA'),
	   (3, 'PAULA')
	   
--substitui os valores da tabela por 'D'
SELECT 'D' AS flag FROM TB_FUNCIONARIO
	   
CREATE TABLE TB_CADASTRO(
	codigo   INT         NOT NULL PRIMARY KEY,
	nome     VARCHAR(50) NOT NULL,
	telefone VARCHAR(20) NULL
)

INSERT INTO TB_CADASTRO  
VALUES (1, 'JOAO', '3444-4444'),
 	   (2, 'CARLOS', NULL),
 	   (3, 'ROBERTO', NULL)
 	
--seleciona de TB_CADASTRO os codigos, nomes e nomeia 'SEM TELEFONE' os campos em que o telefone é NULL
SELECT codigo, nome, 'SEM TELEFONE' AS pendencia FROM TB_CADASTRO WHERE telefone IS NULL

--une as tabelas TB_FUNCIONARIO e TB_FUNCIONARIO_2
SELECT * FROM TB_FUNCIONARIO UNION SELECT * FROM TB_FUNCIONARIO_2 

--une as tabelas TB_FUNCIONARIO e TB_FUNCIONARIO_2 também com os repetidos
SELECT * FROM TB_FUNCIONARIO  UNION ALL SELECT * FROM TB_FUNCIONARIO_2

-- seleciona o que tem em TB_FUNCIONARIO e nao tem em TB_FUNCIONARIO_2
SELECT * FROM TB_FUNCIONARIO EXCEPT SELECT * FROM TB_FUNCIONARIO_2

-- seleciona a intercessão entre TB_FUNCIONARIO e TB_FUNCIONARIO_2
SELECT * FROM TB_FUNCIONARIO INTERSECT SELECT * FROM TB_FUNCIONARIO_2

