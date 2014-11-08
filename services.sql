CREATE TABLE services.user
(
	pnome VARCHAR(50),
	snome VARCHAR(50),
	login VARCHAR(50),
	email VARCHAR(50),
	telefone INTEGER,
	celular INTEGER,
	serv VARCHAR(50),
	condicao BOOLEAN,
	CONSTRAINT pk_login PRIMARY KEY (login)
)

CREATE TABLE services.servico
(
	nome VARCHAR(50),
	--login_prest VARCHAR(50),
	sub_cat VARCHAR(50),
	id_serv INTEGER,
	CONSTRAINT pk_nome_categ PRIMARY KEY (nome),
	CONSTRAINT fk_login_prest FOREIGN KEY (login_prest)
	REFERENCES services.user(login) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_own_sub FOREIGN KEY (sub_cat)
	REFERENCES services.servico(nome)
	
)

CREATE TABLE services.trab_em
(
	prest_login VARCHAR(50),
	nome_serv VARCHAR(50),
	nome_categ_serv VARCHAR(50),
	CONSTRAINT pk_servico PRIMARY KEY (nome_serv),
	CONSTRAINT fk_categ FOREIGN KEY (nome_categ_serv)
	REFERENCES services.servico(nome),
	CONSTRAINT fk_login_prest FOREIGN KEY(prest_login)
	REFERENCES services.user(login)
)

INSERT INTO services.user(pnome, snome, login, email, serv) VALUES('Jose', 'Ribeiro', 'ze', 'ze@hotmail.com', 'pedreiro')
INSERT INTO services.servico(nome, id_serv) VALUES('limpeza', 1)
INSERT INTO services.servico('limpeza', sub_cat, 1) VALUES('zelador')
INSERT INTO services.trab_em(prest_login, nome_serv, nome_categ_serv) VALUES ()
ALTER TABLE services.servico
DROP column login_prest

CREATE TABLE services.cliente
(
	client VARCHAR(50),
	id_client INTEGER,
	categ_client VARCHAR(50),
	CONSTRAINT fk_categ FOREIGN KEY (client)
	REFERENCES services.cliente(id_client)
)