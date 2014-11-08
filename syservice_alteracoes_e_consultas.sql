SELECT login FROM syservice.user
SELECT * FROM syservice.sub
SELECT * FROM syservice.trab_em where nome_categ_pai = 'Limpeza'
UPDATE syservice.trab_em SET nome_serv = 'limpeza de canos', nome_categ_pai = 'Limpeza', descricao_serv = 'e noiz' WHERE prest_login = 'potter'
UPDATE syservice.trab_em SET descricao_serv = ''
WHERE prest_login  = 'zezao'
ALTER TABLE syservice.user DROP COLUMN descricao_serv
ALTER TABLE syservice.trab_em ADD COLUMN descricao_serv VARCHAR(200)