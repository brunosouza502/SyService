<%-- 
    Document   : minhasRequisicoes
    Created on : 05/11/2013, 12:36:06
    Author     : Bruno
--%>

<%@page import="java.util.List"%>
<%@page import="user.sysUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quem eu requisitei</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:useBean id="dao" class="sysDatabase.ConnectBD" scope="session"/>
        <%
            sysUser u = (sysUser) request.getSession().getAttribute("user");
            List<sysUser> myreq = (List<sysUser>) request.getAttribute("minhasrequisicoes");
        %>
        <a href="welcome.jsp"><h1><%=u.getLogin()%></h1></a>
        <h1>Quem eu requisitei</h1>
        <%
            for(sysUser my : myreq){
        %>
        <p><%=my.getDt_inicio()%> <%=my.getPrestador()%><br/> <%=my.getDesc_pedido()%></p> <br/>
        <%
            }
        %>
        
    </body>
</html>
