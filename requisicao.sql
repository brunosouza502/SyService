SELECT * FROM syservice.user
SELECT * FROM syservice.sub
SELECT * FROM syservice.servico
SELECT * FROM syservice.trab_em

CREATE TABLE syservice.requisita
(
	dt_inicio DATE,
	dt_termino DATE,
	cliente VARCHAR(50),
	prestador VARCHAR(50),
	req_servico VARCHAR(50),
	CONSTRAINT fk_cliente FOREIGN KEY (cliente)
		REFERENCES syservice.user(login),
	CONSTRAINT fk_req_prestador FOREIGN KEY (prestador)
		REFERENCES syservice.user(login)
)

INSERT INTO syservice.requisita(dt_inicio, dt_termino, cliente, prestador, descricao)
VALUES('04/10/2013', '05/11/2013', 'mauro', 'zezao')

INSERT INTO syservice.requisita(cliente, prestador, descricao)
VALUES('zezao', 'marcelo', 'asajsiajsaijs')
INSERT INTO syservice.servico(nome, id_serv)
VALUES('Informatica', '6')
INSERT INTO syservice.servico(nome, id_serv)
VALUES('In', '6')
SELECT * FROM syservice.requisita

ALTER TABLE syservice.requisita
ADD COLUMN descricao VARCHAR(100)