<%-- 
    Document   : adminCRUD
    Created on : 11/11/2013, 01:04:28
    Author     : Bruno
--%>

<%@page import="user.sysUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:useBean id="dao" class="sysDatabase.ConnectBD" scope="session"/>
        <%
            sysUser u = (sysUser) request.getSession().getAttribute("useradmin");
        %>
        <h2>Administrador <%=u.getName()%></h2>
        <form method="post" action="categoriaCrud" class="form">
            Categoria  <input type="text" name="categoria"> 
            ID de categoria  <input type="text" name="idcateg"><br/>
            <input type="submit" value="Ok" class="button"/>
        </form>
        
        <br/><a href="home.jsp">Voltar</a>
    </body>
</html>
