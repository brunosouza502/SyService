<%-- 
    Document   : userProfile
    Created on : 30/10/2013, 14:54:22
    Author     : Bruno
--%>

<%@page import="user.sysUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            sysUser u = (sysUser)request.getAttribute("userpage");
            sysUser visita = (sysUser) request.getSession().getAttribute("user");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=u.getLogin()%></title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <a href="welcome.jsp"><h1><%=visita.getLogin()%></h1></a><br/>
        <h1><%=u.getLogin()%></h1><br/>
        <p>Nome: <%=u.getName()%> <%=u.getSname()%> <br/> Servico: <%=u.getServico()%> Categoria: <%=u.getCategoria()%> <br/> <%=u.getDescricao()%></p>
        
        <a href="reqServico.jsp">Requisitar Servico</a> <br/>
        
    </body>
</html>
