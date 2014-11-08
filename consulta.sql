SELECT * FROM syservice.categoria
SELECT * FROM syservice.user
SELECT u.nome FROM syservice.user u JOIN syservice.categoria c ON u.categoria = c.pai_categoria

DELETE FROM syservice.categoria WHERE nome_categoria = 'Limpeza';

ALTER TABLE syservice.categoria
DROP CONSTRAINT fk_categ_login;

ALTER TABLE syservice.categoria
DROP pai_categoria;

ALTER TABLE syservice.categoria
ADD CONSTRAINT pk_id_categoria PRIMARY KEY (id_categoria);

CREATE TABLE syservice.trab_categoria
(
	id_categ INTEGER,
	categ_nome VARCHAR(50),
	login_prestador VARCHAR(50),
	CONSTRAINT fk_nome_categ FOREIGN KEY(categ_nome)
	REFERENCES syservice.categoria(nome_categoria)
);

CREATE TABLE syservice.sub_categ
(
	pai_categ VARCHAR(50),
	id_pai INTEGER,
	nome_categ VARCHAR(50),
	CONSTRAINT fk_pai_id FOREIGN KEY(id_pai)
	REFERENCES syservice.categoria(id_categoria),
	CONSTRAINT fk_nome_categ FOREIGN KEY(nome_categ)
	REFERENCES syservice.categoria(nome_categoria)
);

CREATE SEQUENCE syservice.id_gen
ALTER TABLE syservice.categoria
ALTER COLUMN id_categoria SET DEFAULT nextval('syservice.id_gen')

ALTER TABLE syservice.categoria
ADD CONSTRAINT uk_nome_categoria UNIQUE(nome_categoria)

INSERT INTO syservice.categoria (nome_categoria) VALUES('limpeza')

ALTER TABLE syservice.trab_categoria
ADD CONSTRAINT fk_id_categoria FOREIGN KEY(id_categ)
REFERENCES syservice.categoria(id_categoria)

INSERT INTO syservice.trab_categoria(id_categ, categ_nome, login_prestador)
SELECT c.id_categoria, c.nome_categoria, u.login FROM syservice.categoria c JOIN syservice.user u ON c.nome_categoria = u.categoria
WHERE c.nome_categoria =  'construcao civil'

INSERT INTO syservice.sub_categ(pai_categ, id_pai, nome_categ)
SELECT categoria, id_categoria,

SELECT * FROM syservice.user
SELECT * FROM syservice.trab_categoria
SELECT * FROM syservice.categoria
ALTER TABLE syservice.sub_categ
drop constraint fk_nome_categ

ALTER TABLE syservice.sub_categ
DROP COLUMN nome_categ

ALTER TABLE syservice.sub_categ
ADD COLUMN nome_sub_categ

INSERT INTO syservice.user(categoria) VALUES('Pintura')
