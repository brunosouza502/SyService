<%-- 
    Document   : reqAtual
    Created on : 05/10/2013, 19:05:03
    Author     : Bruno
--%>

<%@page import="java.util.List"%>
<%@page import="user.sysUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minhas requisições</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:useBean id="dao" class="sysDatabase.ConnectBD" scope="session"/>
        <%
            sysUser u = (sysUser) request.getSession().getAttribute("user");
            sysUser ureq = (sysUser) request.getSession().getAttribute("requsr");
            List<sysUser> usrs = dao.req(u, u.getLogin());
            if(u!=null){
        %>
        <h1><%=u.getPrestador()%> requisições </h1><br/>
        <p><%=u.getCliente()%> requisita seu serviço</p>
        <p><%=u.getDesc_pedido()%></p><br />
        <%
            }else{
        %>
        <p>Sem requisições</p><br/>
        <%
            }
        %>
        

        <a href="welcome.jsp">Voltar</a>
    </body>
</html>
