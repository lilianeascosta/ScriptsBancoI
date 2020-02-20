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
	telefone    VARCHAR(20) NULL,
	dt_cadastro DATETIME    NOT NULL DEFAULT(GETDATE()),
	
	CONSTRAINT pk_CLIENTE PRIMARY KEY(matricula),
	CONSTRAINT fk_TELEFONE FOREIGN KEY(telefone)
)

CREATE TABLE TB_TELEFONE_CLIENTE(
	telefone VARCHAR(20) 
)

