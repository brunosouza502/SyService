<%-- 
    Document   : resultBusca
    Created on : 24/09/2013, 19:44:11
    Author     : Bruno
--%>
<%@page import="user.sysUser"%>
<%@page import="sysDatabase.UserData"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            sysUser u = (sysUser) request.getSession().getAttribute("user");
            sysUser usearch = (sysUser) request.getSession().getAttribute("search");
            if (u != null && usearch != null) {
        %>
        
        <h1>Oi <a href="welcome.jsp"><%=u.getName()%></a>, você está buscando por <%=usearch.getLogin()%> </h1>
        <p><%=usearch.getServico()%> Categoria: <%=usearch.getCategoria()%></p><br/>
        <textarea disabled rows="5" cols="50" ><%=usearch.getDescricao()%></textarea>
    
        <%
            } else {
        %>
                <h1>Não encontrado!</h1>
        <%  
            }
        %>
        
        <a href="requisita.jsp">Requisitar Servico</a> <br/>
    </body>
    
</html>
