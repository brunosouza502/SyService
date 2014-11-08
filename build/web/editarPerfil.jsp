<%-- 
    Document   : cadastrarServico
    Created on : 12/09/2013, 15:10:13
    Author     : Bruno
--%>
<%@page import="user.sysUser"%>
<%@page import="sysDatabase.UserData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Servico</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%
            sysUser u = (sysUser) request.getSession().getAttribute("user");
            if (u != null) {
        %>
        <h1>Cadastre seu serviço <%=u.getName()%></h1><br/>
        <form method="post" action="EditarCrud">
            Serviço <input type="text" name="serv">
            Categoria <input type="text" name="categ"> <br/>
            Descrição do servico <input type="text" name="descricao"><br/>
            <input type="submit" value="Ok" class="button">
            <input type="reset" value="Limpar" class="button">
        </form>
        <%
            }
        %>
        
        <h1></h1>
    </body>
</html>
