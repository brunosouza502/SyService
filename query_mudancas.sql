SELECT * FROM syservice.user
SELECT * FROM syservice.trab_categoria
DELETE FROM syservice.trab_categoria WHERE login_prestador = 'zekao'
ALTER TABLE syservice.trab_categoria
ADD CONSTRAINT fk_login_prestador FOREIGN KEY(login_prestador)
REFERENCES syservice.user(login)
ADD COLUMN sub_categ VARCHAR(50)

ALTER TABLE syservice.user
ADD CONSTRAINT uk_login UNIQUE (login)

INSERT INTO syservice.trab_categoria(sub_categ, categ_nome, login_prestador) VALUES('zelador','limpezasaduhad','kleb')