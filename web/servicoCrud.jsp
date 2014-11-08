<%-- 
    Document   : servicoCrud
    Created on : 05/09/2013, 07:51:55
    Author     : Bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Serviço</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Cadastro</h1>
        <form method="post" action="doUserCrud" class="form">
            Servico  <input type="text" name="servico"><br/>
            Categoria <input type="text" name="categoria"><br/>
            <input type="submit" value="Ok" class="button"/>
            <input type="reset" value="Limpar" class="button">
        </form>
        <br/><a href="index.jsp">Voltar</a>
    </body>
</html>
