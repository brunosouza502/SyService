ALTER TABLE syservice.user ADD COLUMN datacadastro TIMESTAMP WITH TIME ZONE default 'now'
ALTER TABLE syservice.requisita alter column dt_inicio set default 'now'
ALTER TABLE syservice.requisita ADD COLUMN dtreq TIMESTAMP WITH TIME ZONE DEFAULT 'now'
ALTER TABLE syservice.requisita drop column dt_inicio
ALTER TABLE syservice.requisita alter column dt_inicio drop default
ALTER TABLE syservice.trab_em ADD COLUMN dtcadastrocateg TIMESTAMP WITH TIME ZONE DEFAULT 'now'
SELECT * FROM syservice.trab_em WHERE nome_categ_pai = 'Limpeza'
SELECT COUNT(prest_login) FROM syservice.trab_em
SELECT * FROM syservice.trab_em ORDER BY dtcadastrocateg USING >
SELECT * FROM syservice.concluido
SELECT * FROM syservice.user
SELECT * FROM syservice.user
SELECT * FROM syservice.avaliar_prestador WHERE prestador_login = 'lagreca'
SELECT * FROM syservice.agendamento
SELECT * FROM syservice.requisita ORDER BY dtreq USING >
SELECT prestador_login, nota_preco FROM syservice.avaliar_prestador ORDER BY nota_preco USING >

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

--COMBINACAO LINEAR
SELECT a.prestador_login, t.prest_login, (AVG(nota_preco)+AVG(nota_prazo_cobrado))/2 AS media
FROM syservice.avaliar_prestador a JOIN (syservice.trab_em t GROUP BY t.prest_login)ON a.prestador_login = t.prest_login
ORDER BY media