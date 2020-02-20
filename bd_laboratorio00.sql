--resolução do laboratorio 0

CREATE DATABASE bd_laboratorio00 

CREATE TABLE TB_CLIENTE(
	cd_cliente  INT         NOT NULL,
	nm_cliente  VARCHAR(50) NOT NULL,
	endereco    VARCHAR(60) NOT NULL,
	telefone    VARCHAR(10) NULL,
	rg_cliente  VARCHAR(20) NOT NULL,
	dt_cadastro DATETIME    NOT NULL
)

INSERT INTO TB_CLIENTE(cd_cliente, nm_cliente, endereco, telefone, rg_cliente, dt_cadastro)
VALUES(1, 'JUNIOR', 'RUA MARIA MAR', '7999999999', '9.999.999-99', '20190210'),
	  (2, 'PABLO', 'RUA GIRASSOL', '7988888888', '8.888.888-88', '20190210')

INSERT INTO TB_CLIENTE(cd_cliente, nm_cliente, endereco, telefone, rg_cliente, dt_cadastro)
VALUES(3, 'ALESSANDRA', 'BARRA DOS COQUEIROS', '7977777777', '7.777.777-77', '2019/03/10'),
	  (4, 'JESSICA', 'RIBEIROPOLIS', '7966666666', '6.666.666-66', '2019/03/10')
	  
INSERT INTO TB_CLIENTE(cd_cliente, nm_cliente, endereco, rg_cliente, dt_cadastro)
VALUES(5, 'PAOLA', 'RUA POR DO SOL', '5.555.555-55', '20190315')
	  
SELECT * FROM TB_CLIENTE

SELECT cd_cliente, nm_cliente, rg_cliente
FROM TB_CLIENTE

SELECT * 
FROM TB_CLIENTE
WHERE dt_cadastro < '20100301'

SELECT *
FROM TB_CLIENTE
WHERE telefone IS NULL

UPDATE TB_CLIENTE
SET telefone = '7955555555'
WHERE cd_cliente = 5

UPDATE TB_CLIENTE
SET endereco = 'RUA DOCE DE LEITE', telefone = '7911111111'
WHERE cd_cliente = 3

DELETE FROM TB_CLIENTE 
WHERE cd_cliente  = 2

DELETE FROM TB_CLIENTE 
WHERE cd_cliente = 3

drop table TB_CLIENTE 