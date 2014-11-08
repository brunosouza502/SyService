SELECT * FROM syservice.avaliar_prestador
SELECT * FROM syservice.avaliar_prestador ORDER BY datatermino USING <
SELECT * FROM syservice.avaliar_cliente
SELECT * FROM syservice.requisita
SELECT * FROM syservice.trab_em
DELETE FROM syservice.requisita where cliente = 'chrislade'
DELETE FROM syservice.avaliar_prestador where cliente_login = 'brian'
INSERT INTO syservice.avaliar_prestador(cliente_login, prestador_login, textolivre, nota_preco, nota_prazo_cobrado, nota_servico, nota_atendimento, data_hora_avaliacao) VALUES('now')
DELETE FROM syservice.requisita WHERE cliente = '' AND prestador = ''
CREATE TABLE syservice.concluido
(
	idConclusao serial,
	cliente VARCHAR(50),
	prestador VARCHAR(50),
	dtconclusao TIMESTAMP WITH TIME ZONE,
	status VARCHAR(10) default 'Concluido',
	CONSTRAINT fk_cliente FOREIGN KEY(cliente)
		REFERENCES syservice.user(login),
	CONSTRAINT fk_prestador FOREIGN KEY(prestador)
		REFERENCES syservice.trab_em(prest_login)
)
SELECT * FROM syservice.avaliar_prestador ORDER BY datatermino USING >
SELECT * FROM syservice.agendamento

ALTER TABLE syservice.requisita ALTER COLUMN req_servico
ALTER TABLE syservice.requisita ALTER COLUMN descricao set default 'Sem descricao'
ALTER TABLE syservice.trab_em ALTER COLUMN descricao_serv set default 'Sem descricao'
ALTER TABLE syservice.requisita ADD COLUMN status VARCHAR(50) check(status = 'Concluido' OR status = 'Em andamento')
ALTER TABLE syservice.avaliar_prestador ALTER COLUMN textolivre set data type VARCHAR(500)
SELECT * FROM syservice.agendamento
UPDATE syservice.requisita SET status = 'Concluido' where cliente = 'mauro' AND prestador = 'zezao'