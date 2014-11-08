SELECT * FROM syservice.user
ALTER TABLE syservice.userADD CONSTRAINT pk_login PRIMARY KEY (login)

CREATE TABLE syservice.categoria
(
	id_categoria INTEGER,
	nome_categoria VARCHAR(50),
	subcat_servico VARCHAR(50),
	login_prestador VARCHAR(50), 
	pai_categoria VARCHAR(50),
	CONSTRAINT fk_categ_login FOREIGN KEY (login_prestador)
	REFERENCES syservice.user(login) ON UPDATE CASCADE ON DELETE CASCADE
)

ALTER TABLE syservice.categoria
ADD CONSTRAINT fk_servico_subcat FOREIGN KEY (pai_categoria)
REFERENCES syservice.user(categoria)*/

ALTER TABLE syservice.user
ADD COLUMN categoria VARCHAR(50) UNIQUE 
