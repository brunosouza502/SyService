<%-- 
    Document   : reqServico
    Created on : 30/10/2013, 17:37:51
    Author     : Bruno
--%>
<%@page import="user.sysUser"%>
<%@page import="sysDatabase.UserData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Requisitar Servico</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            sysUser u = (sysUser)request.getSession().getAttribute("visiter");
            sysUser us = (sysUser) request.getSession().getAttribute("user");
        %>
        <a href="welcome.jsp"><h1><%=us.getLogin()%> </h1></a><br/>
        <h1>Requisitar servico de <%=u.getLogin()%></h1>
        <form method="post" action="requisitaServico">
            <input type="hidden" name="cliente" value="<%=us.getLogin()%>">
            <input type="hidden" name="prestador" value="<%=u.getLogin()%>">
            Descrição do pedido <br/><textarea  name="descricao" rows="5" cols="50"> </textarea><br/>
            <input type="submit" value="Ok" class="button">
            <input type="reset" value="Limpar" class="button">
        </form>
        <a href="user?action=update&login=<%=u.getLogin()%>">Voltar</a>
    </body>
</html>
