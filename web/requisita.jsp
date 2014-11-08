<%-- 
    Document   : requisita
    Created on : 05/10/2013, 00:15:30
    Author     : Bruno
--%>

<%@page import="java.util.List"%>
<%@page import="user.sysUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <head>
        <%
            sysUser utitle = (sysUser) request.getSession().getAttribute("user");
            if(utitle != null){
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=utitle.getLogin()%></title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
        <%
            }
        %>
    </head>
    <body>
        <jsp:useBean id="dao" class="sysDatabase.ConnectBD" scope="session"/>
        <%
            sysUser u = (sysUser) request.getSession().getAttribute("user");
            sysUser usearch = (sysUser) request.getSession().getAttribute("search");
            //List<sysUser> ulist = (List<sysUser>) request.getSession().getAttribute("search");
            List<sysUser> ulist = dao.listCategoria();
            if (u != null && usearch != null) {
        %>
        <h1><a href="welcome.jsp"><%=u.getLogin()%></a></h1>
        <h1>Requisitar serviço de <%=usearch.getLogin()%></h1>
        <p> <%=usearch.getServico()%></p>
        <%
            }
        %>
        
        <form method="post" action="requisitaServ">
            Cliente <input type="text" name="cliente" value="<%=u.getLogin()%>"><br/>
            Pedido para: <input type="text" name="prestreq" value="<%=usearch.getLogin()%>"><br/>
            Descrição do pedido <br/><textarea  name="descricao" rows="5" cols="50"> </textarea><br/>
            <input type="submit" value="Ok" class="button">
            <input type="reset" value="Limpar" class="button">
        </form>

            <a href="welcome.jsp">Voltar</a>
    </body>
</html>
