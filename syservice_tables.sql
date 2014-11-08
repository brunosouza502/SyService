CREATE TABLE syservice."user"
(
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(50),
  cpf INTEGER,
  id INTEGER,
  login VARCHAR(50) NOT NULL,
  cidade VARCHAR(50),
  senha VARCHAR(50) NOT NULL,
  sexo VARCHAR(10),
  servico VARCHAR(50),
  categoria VARCHAR(50),
  CONSTRAINT pk_login PRIMARY KEY (login),
  CONSTRAINT user_categoria_key UNIQUE (categoria),
  CONSTRAINT user_sexo_check CHECK (sexo::bpchar = 'Masculino'::bpchar OR sexo::bpchar = 'Feminino'::bpchar)
)

CREATE TABLE syservice.categoria
(
  id_categoria INTEGER NOT NULL DEFAULT nextval('syservice.id_gen'::regclass),
  nome_categoria VARCHAR(50),
  subcat_servico VARCHAR(50),
  login_prestador VARCHAR(50),
  CONSTRAINT pk_id_categoria PRIMARY KEY (id_categoria),
  CONSTRAINT uk_nome_categoria UNIQUE (nome_categoria)
)

CREATE TABLE syservice.sub_categ
(
  pai_categ VARCHAR(50),
  id_pai INTEGER,
  CONSTRAINT fk_pai_id FOREIGN KEY (id_pai)
      REFERENCES syservice.categoria (id_categoria) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)


CREATE TABLE syservice.trab_categoria
(
  id_categ INTEGER,
  categ_nome VARCHAR(50),
  login_prestador VARCHAR(50),
  CONSTRAINT fk_id_categoria FOREIGN KEY (id_categ)
      REFERENCES syservice.categoria (id_categoria)
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_nome_categ FOREIGN KEY (categ_nome)
      REFERENCES syservice.categoria (nome_categoria)
      ON UPDATE NO ACTION ON DELETE NO ACTION
)

CREATE SEQUENCE syservice.id_gen
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 6
  CACHE 1;
ALTER TABLE syservice.id_gen

