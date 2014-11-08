SELECT * FROM services.user
SELECT * FROM services.servico
SELECT * FROM services.trab_em
INSERT INTO services.trab_em(prest_login, nome_serv, nome_categ_serv) VALUES('ze','zelador','limpeza')
INSERT INTO services.trab_em(prest_login, nome_serv, nome_categ_serv) VALUES('marcio','limpador de tubos','limpeza')
INSERT INTO services.servico(nome, id_serv) VALUES('informatica', 2)
INSERT INTO services.servico(nome, sub_cat, id_serv) VALUES('Construcao','obras', 4)

CREATE TABLE services.sub
(
	pai_categ VARCHAR(50),
	nome_serv_sub VARCHAR(50),
	id_nome_sub INTEGER,
	CONSTRAINT fk_pai_categ FOREIGN KEY (pai_categ)
		REFERENCES services.servico(nome),
	CONSTRAINT fk_sub_categ  FOREIGN KEY (nome_serv_sub)
		REFERENCES services.trab_em(nome_serv)
)

DROP TABLE services.sub
DELETE FROM services.servico where nome = 'Computadores'
ALTER TABLE services.servico DROP COLUMN sub_cat

SELECT * FROM syservice.TRAB_CATEG