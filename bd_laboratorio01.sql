CREATE DATABASE bd_laboratorio01

USE bd_laboratorio01

CREATE TABLE TB_FUNCIONARIO(
	matricula_funcionario INT         NOT NULL,
	nome                  VARCHAR(40) NOT NULL,
	cpf                   VARCHAR(15) NOT NULL UNIQUE,
	cd_departamento       INT         NOT NULL,
	CONSTRAINT pk_funcionario PRIMARY KEY (matricula_funcionario),
	CONSTRAINT fk_funcionario FOREIGN KEY (cd_departamento) REFERENCES TB_DEPARTAMENTO(cd_departamento)
)

SELECT * FROM TB_FUNCIONARIO

CREATE TABLE TB_TELEFONE_FUNCIONARIO(
	matricula_funcionario INT         NOT NULL,
	telefone  VARCHAR(15) NOT NULL, 
	CONSTRAINT pk_telefone PRIMARY KEY (matricula_funcionario, telefone),
	CONSTRAINT fk_telefone FOREIGN KEY (matricula_funcionario) REFERENCES TB_FUNCIONARIO(matricula_funcionario)
)

CREATE TABLE TB_DEPARTAMENTO(
	cd_departamento INT         NOT NULL,
	nm_departamento VARCHAR(20) NOT NULL,
	CONSTRAINT pk_departamento PRIMARY KEY (cd_departamento)
) 

CREATE TABLE TB_FAZ_SOLICITACAO(
	matricula_funcionario INT         NOT NULL,
	cd_categoria          INT         NOT NULL,
	status                VARCHAR(50) NOT NULL DEFAULT ('Em Aberto'),
	dt_abertura           DATETIME    NOT NULL,
	dt_fechamento         DATETIME    NULL,
	ds_problema           VARCHAR(50) NOT NULL,
	CONSTRAINT pk_solicitacao PRIMARY KEY (matricula_funcionario, cd_categoria, dt_abertura),
	CONSTRAINT fk_solicitacao_funcionario FOREIGN KEY (matricula_funcionario) REFERENCES TB_FUNCIONARIO(matricula_funcionario),
	CONSTRAINT fk_solicitacao_categoria FOREIGN KEY (cd_categoria) REFERENCES TB_CATEGORIA_PROBLEMA (cd_categoria)
)

--quando houver uma atribuição na tabela FAZ_SOLICITACAO essa restrição será testada:
ALTER TABLE TB_FAZ_SOLICITACAO
ADD CONSTRAINT CK_STATUS CHECK (status IN('Em aberto', 'Fechado', 'Cancelado')) 

--restrição de que o status só pode ser fechado ou cancelado quando a dt_fechamento nao for nula
ALTER TABLE TB_FAZ_SOLICITACAO 
ADD CONSTRAINT CK_STATUS_DATA
CHECK ((status = 'Em Aberto' AND dt_fechamento IS NULL) OR (status IN ('Fechado', 'Cancelado') AND dt_fechamento IS NOT NULL))

CREATE TABLE TB_CATEGORIA_PROBLEMA(
	cd_categoria INT         NOT NULL,
	descricao    VARCHAR(50) NOT NULL,
	CONSTRAINT pk_categoria PRIMARY KEY (cd_categoria)
)

CREATE TABLE TB_TERCEIRIZADO(
	matricula_terceirizado INT         NOT NULL,
	nome                   VARCHAR(40) NOT NULL,
	CONSTRAINT pk_terceirizado PRIMARY KEY (matricula_terceirizado)
)

CREATE TABLE TB_ATENDE(
	cd_categoria           INT  NOT NULL,
	matricula_terceirizado INT  NOT NULL,
	CONSTRAINT pk_atende PRIMARY KEY (cd_categoria, matricula_terceirizado),
	CONSTRAINT fk_atende_categoria FOREIGN KEY (cd_categoria) REFERENCES TB_CATEGORIA_PROBLEMA (cd_categoria),
	CONSTRAINT fk_atende_terceirizado FOREIGN KEY(matricula_terceirizado) REFERENCES TB_TERCEIRIZADO (matricula_terceirizado)
)

 







--teste
INSERT INTO TB_FAZ_SOLICITACAO(matricula_funcionario , cd_categoria , status ,dt_abertura, ds_problema )
VALUES(1, 10, 'EM ABERTO', '20200214', 'testando')