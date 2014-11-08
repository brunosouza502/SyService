ALTER TABLE syservice.categoria DROP CONSTRAINT uk_nome_categoria
SELECT * FROM syservice.categoria
SELECT * FROM syservice.user
SELECT * FROM syservice.trab_categoria
DELETE FROM syservice.trab_categoria where login_prestador = 'jao'
DELETE FROM syservice.categoria where nome_categoria = 'Informatica'
ALTER TABLE syservice.categoria ADD CONSTRAINT uk_nome_categoria ON UPDATE CASCADE ON DELETE CASCADE
DROP TABLE syservice.trab_categoria
DELETE FROM syservice.user where sexo = 'Masculino'
DELETE FROM syservice.user where nome = 'John'
ALTER TABLE syservice.user DROP categoria
ALTER TABLE syservice.user ADD COLUMN snome VARCHAR(50)
ALTER TABLE syservice.user ADD COLUMN telefone VARCHAR(50)
ALTER TABLE syservice.user ADD COLUMN celular VARCHAR(50)
ALTER TABLE syservice.user ADD COLUMN descricao_serv VARCHAR(100)

CREATE TABLE syservice.servico
(
	nome VARCHAR(50),
	id_serv INTEGER,
	CONSTRAINT pk_serv_nome PRIMARY KEY(nome)
)

CREATE TABLE syservice.trab_em
(
	prest_login VARCHAR(50),
	nome_serv VARCHAR(50) NOT NULL,
	nome_categ_pai VARCHAR(50),
	--CONSTRAINT pk_nome_serv PRIMARY KEY (nome_serv),
	CONSTRAINT fk_prest_login FOREIGN KEY (prest_login)
		REFERENCES syservice.user(login),
	CONSTRAINT fk_categ_pai FOREIGN KEY (nome_categ_pai)
		REFERENCES syservice.servico (nome)
)

CREATE TABLE syservice.sub
(
	pai_categ VARCHAR(50),
	sub_nome VARCHAR(50),
	id_nome_sub INTEGER,
	CONSTRAINT fk_pai_categ FOREIGN KEY (pai_categ)
		REFERENCES syservice.servico(nome),
	CONSTRAINT fk_sub_cadastrada FOREIGN KEY (sub_nome)
		REFERENCES syservice.trab_em(nome_serv)
)


INSERT INTO services.servico (nome,id_serv) VALUES('Limpeza', 2);
INSERT INTO services.user (pnome, snome, login, telefone, celular) VALUES('Jose', 'Silva', 'ze', '33215451', '99999999');
INSERT INTO services.trab_em (prest_login, nome_serv, nome_categ_serv) VALUES('ze', 'zelador', 'Limpeza')
delete from services.trab_em where prest_login = 'ze'
delete from syservice.user where login = 'zemau'
delete from syservice.trab_em where nome_categ_pai = 'Limpeza'
delete from services.servico where nome = 'informatica'
SELECT * FROM services.servico
SELECT * FROM services.user
SELECT * FROM services.trab_em

SELECT * FROM syservice.user where login = 'zezao' and senha = 'zezaum'
SELECT * FROM syservice.trab_em where prest_login = 'zezao'
SELECT * FROM syservice.trab_em
SELECT * FROM syservice.user
SELECT * FROM syservice.servico
SELECT * FROM syservice.sub
INSERT INTO syservice.servico(nome, id_serv) VALUES('Limpeza', 1)
INSERT INTO syservice.servico(nome, id_serv) VALUES('Obras', 2)
INSERT INTO syservice.servico(nome, id_serv) VALUES('Pintura', 3)
INSERT INTO syservice.servico(nome, id_serv) VALUES('Eletronica', 4)
ALTER TABLE syservice.sub DROP CONSTRAINT fk_sub_cadastrada
ALTER TABLE syservice.trab_em DROP CONSTRAINT pk_nome_serv
ALTER TABLE syservice.trab_em ALTER nome_serv SET NOT NULL
