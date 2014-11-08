select * from syservice.trab_em where nome_categ_pai = 'Pintura'
SELECT * FROM syservice.requisita
SELECT date_part('day', )

select dt_inicio from syservice.requisita
ALTER TABLE syservice.requisita ALTER COLUMN dt_inicio set default CURRENT_TIMESTAMP
ALTER TABLE syservice.requisita ALTER COLUMN dt_inicio TYPE timestamp with time zone
ALTER TABLE syservice.trab_em ADD CONSTRAINT pk_prest_login PRIMARY KEY(prest_login)

CREATE TABLE syservice.avaliar_prestador(
	cliente_login VARCHAR(50),
	prestador_login VARCHAR(50),
	textolivre VARCHAR(100),
	nota_preco NUMERIC,
	nota_prazo_cobrado NUMERIC,
	nota_servico NUMERIC,
	nota_atendimento NUMERIC,
	data_hora_avaliacao timestamp with time zone,
	CONSTRAINT fk_client_login FOREIGN KEY(cliente_login)
		REFERENCES syservice.user(login),
	CONSTRAINT fk_prestador_login FOREIGN KEY(prestador_login)
		REFERENCES syservice.trab_em(prest_login)
);

CREATE TABLE syservice.avaliar_cliente(
	client_login VARCHAR(50),
	prest_login VARCHAR(50),
	textolivre VARCHAR(50),
	nota_pagamento NUMERIC,
	nota_material_fornecido NUMERIC,
	nota_facilidade_trato_cliente NUMERIC,
	data_hora_avaliacao timestamp with time zone,
	CONSTRAINT fk_client_login FOREIGN KEY(client_login)
		REFERENCES syservice.user(login),
	CONSTRAINT fk_prestador_login FOREIGN KEY(prest_login)
		REFERENCES syservice.user(login)
);

CREATE TABLE syservice.agendamento(
	id_agendamento serial,
	client_login VARCHAR(50),
	prest_login VARCHAR(50),
	dt_inicio timestamp with time zone,
	dt_fim timestamp with time zone,
	preco NUMERIC,
	hora_agendamento timestamp with time zone,
	CONSTRAINT fk_client_login FOREIGN KEY(client_login)
		REFERENCES syservice.user(login),
	CONSTRAINT fk_prestador_login FOREIGN KEY(prest_login)
		REFERENCES syservice.trab_em(prest_login)		
);

CREATE TABLE syservice.recusa(
	client_login VARCHAR(50),
	prest_login VARCHAR(50),
	motivo_recusa VARCHAR(100),
	CONSTRAINT fk_client_login FOREIGN KEY(client_login)
		REFERENCES syservice.user(login),
	CONSTRAINT fk_prestador_login FOREIGN KEY(prest_login)
		REFERENCES syservice.trab_em(prest_login)
)