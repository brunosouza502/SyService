CREATE TABLE syservice.agendamento
(
  id_agendamento serial NOT NULL,
  client_login character varying(50),
  prest_login character varying(50),
  dt_inicio timestamp with time zone,
  dt_fim timestamp with time zone,
  preco numeric(8,2),
  hora_agendamento timestamp with time zone,
  CONSTRAINT fk_client_login FOREIGN KEY (client_login)
      REFERENCES syservice."user" (login) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_prestador_login FOREIGN KEY (prest_login)
      REFERENCES syservice.trab_em (prest_login) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)

CREATE TABLE syservice.avaliar_cliente
(
  client_login character varying(50),
  prest_login character varying(50),
  textolivre character varying(500),
  nota_pagamento numeric,
  nota_material_fornecido numeric,
  nota_facilidade_trato_cliente numeric,
  data_hora_avaliacao timestamp with time zone,
  CONSTRAINT fk_client_login FOREIGN KEY (client_login)
      REFERENCES syservice."user" (login) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_prestador_login FOREIGN KEY (prest_login)
      REFERENCES syservice."user" (login) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)

CREATE TABLE syservice.avaliar_prestador
(
  cliente_login character varying(50),
  prestador_login character varying(50),
  textolivre character varying(500),
  nota_preco numeric,
  nota_prazo_cobrado numeric,
  nota_servico numeric,
  nota_atendimento numeric,
  data_hora_avaliacao timestamp with time zone,
  datatermino timestamp with time zone,
  CONSTRAINT fk_client_login FOREIGN KEY (cliente_login)
      REFERENCES syservice."user" (login) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_prestador_login FOREIGN KEY (prestador_login)
      REFERENCES syservice.trab_em (prest_login) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)

CREATE TABLE syservice.concluido
(
  idconclusao serial NOT NULL,
  cliente character varying(50),
  prestador character varying(50),
  dtconclusao timestamp with time zone,
  status character varying(10) DEFAULT 'Concluido'::character varying,
  CONSTRAINT fk_cliente FOREIGN KEY (cliente)
      REFERENCES syservice."user" (login) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_prestador FOREIGN KEY (prestador)
      REFERENCES syservice.trab_em (prest_login) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)

CREATE TABLE syservice.recusa
(
  client_login character varying(50),
  prest_login character varying(50),
  motivo_recusa character varying(100),
  CONSTRAINT fk_client_login FOREIGN KEY (client_login)
      REFERENCES syservice."user" (login) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_prestador_login FOREIGN KEY (prest_login)
      REFERENCES syservice.trab_em (prest_login) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)

CREATE TABLE syservice.servico
(
  nome character varying(50) NOT NULL,
  id_serv integer,
  CONSTRAINT pk_serv_nome PRIMARY KEY (nome)
)

CREATE TABLE syservice.sub
(
  pai_categ character varying(50),
  sub_nome character varying(50),
  id_nome_sub serial NOT NULL,
  CONSTRAINT fk_pai_categ FOREIGN KEY (pai_categ)
      REFERENCES syservice.servico (nome) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)

CREATE TABLE syservice.trab_em
(
  prest_login character varying(50) NOT NULL,
  nome_serv character varying(50) NOT NULL,
  nome_categ_pai character varying(50),
  descricao_serv character varying(200) DEFAULT 'Sem descricao'::character varying,
  dtcadastrocateg timestamp with time zone DEFAULT '2013-11-09 16:04:28.009-02'::timestamp with time zone,
  CONSTRAINT pk_prest_login PRIMARY KEY (prest_login),
  CONSTRAINT fk_categ_pai FOREIGN KEY (nome_categ_pai)
      REFERENCES syservice.servico (nome) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_prest_login FOREIGN KEY (prest_login)
      REFERENCES syservice."user" (login) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)

CREATE TABLE syservice."user"
(
  nome character varying(50) NOT NULL,
  endereco character varying(50),
  cpf integer,
  id integer,
  login character varying(50) NOT NULL,
  cidade character varying(50),
  senha character varying(50) NOT NULL,
  sexo character varying(10),
  snome character varying(50),
  telefone character varying(50),
  celular character varying(50),
  datacadastro timestamp with time zone DEFAULT '2013-11-08 20:50:09.998-02'::timestamp with time zone,
  CONSTRAINT uk_login UNIQUE (login),
  CONSTRAINT user_sexo_check CHECK (sexo::bpchar = 'Masculino'::bpchar OR sexo::bpchar = 'Feminino'::bpchar)

)


--1 top 1 de cada categoria
SELECT p.prestador_login, p.nota_preco, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t
ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = 'Luthier' ORDER BY nota_preco USING > limit 5

SELECT p.prestador_login, p.nota_preco, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t
ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = 'Limpeza' GROUP BY p.prestador_login, p.nota_preco, t.nome_categ_pai, t.nome_serv

SELECT MAX(p.nota_preco), t.prest_login, p.prestador_login FROM syservice.avaliar_prestador p JOIN syservice.trab_em t
ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = 'Limpeza' group by (t.prest_login = p.prestador_login)

--OS ULTIMOS 5 PRESTADORES CADASTRADOS
SELECT u.login, u.datacadastro, t.nome_serv, t.nome_categ_pai FROM syservice.user u JOIN syservice.trab_em t ON u.login = t.prest_login 
ORDER BY datacadastro using > limit 5

SELECT prest_login, dtcadastrocateg, nome_categ_pai FROM syservice.trab_em ORDER BY dtcadastrocateg USING > limit 10

--Os ultimos 10 prestadores que tiveram alguma prestação contratada
SELECT dt_inicio, cliente, prestador FROM syservice.requisita ORDER BY dt_inicio USING > limit 10

--LISTANDO POR CATEGORIA Nota por preco
SELECT p.prestador_login, p.nota_preco, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t
ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = 'Limpeza' ORDER BY nota_preco USING > limit 5

SELECT p.prestador_login, p.nota_atendimento, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t 
ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = 'Obras' ORDER BY p.nota_atendimento USING > limit 5

SELECT p.prestador_login, p.nota_servico, t.prest_login, t.nome_categ_pai, t.nome_serv FROM syservice.avaliar_prestador p JOIN syservice.trab_em t 
ON(t.prest_login = p.prestador_login) WHERE t.nome_categ_pai = 'Obras' ORDER BY p.nota_servico USING > limit 5
--Ultimos 5 prestadores cadastrados na categoria
SELECT prest_login, dtcadastrocateg, nome_categ_pai FROM syservice.trab_em WHERE nome_categ_pai = 'Luthier' ORDER BY dtcadastrocateg USING > limit 10
--Últimos 10 prestadores contratados na categoria
SELECT r.prestador, r.cliente, r.dtreq, t.nome_categ_pai FROM syservice.requisita r JOIN syservice.trab_em t ON r.prestador = t.prest_login
WHERE t.nome_categ_pai = 'Obras' ORDER BY r.dtreq USING > LIMIT 10
--Combinacao linear dos criterios
SELECT (AVG(nota_preco)+AVG(nota_prazo_cobrado))/2 
FROM syservice.avaliar_prestador WHERE prestador_login = 'brian'

--Combinação linear dos criterios

SELECT  a.nome_categ_pai, 
	b.* 
FROM syservice.trab_em a
	JOIN (SELECT  prestador_login, 
		((AVG(nota_preco)+AVG(nota_prazo_cobrado)+AVG(nota_servico)+AVG(nota_atendimento))/4) AS media
	      FROM syservice.avaliar_prestador
	      GROUP BY prestador_login) AS b
       ON a.prest_login = b.prestador_login WHERE nome_categ_pai = 'Limpeza'
ORDER BY b.media DESC