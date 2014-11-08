SELECT * FROM syservice.user
ALTER TABLE syservice.user
ADD COLUMN sexo CHAR
CHECK (sexo = 'Masculino' OR sexo = 'Feminino')

INSERT INTO syservice.user(nome, login, senha, sexo) VALUES('buck', 'jones', 'jonesy', 'jdjfdjijds')

ALTER TABLE syservice.user
ALTER column sexo TYPE varchar(10)

ALTER TABLE syservice.user
ADD COLUMN cidade varchar(50)

ALTER TABLE syservice.user
ADD COLUMN servico VARCHAR(50)

CREATE TABLE syservice.categoria_servico