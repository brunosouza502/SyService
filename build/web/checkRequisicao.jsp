<%-- 
    Document   : checkRequisicao
    Created on : 31/10/2013, 12:32:12
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
            List<sysUser> ureqs = (List<sysUser>) request.getAttribute("requisitions");
        %>
        
        <a href="welcome.jsp"><h1><%=u.getLogin()%></h1></a><br/>
        <h1>Requisições</h1>
        <%
            for(sysUser us : ureqs){
        %>
            <p><%=us.getDt_inicio()%><br/><%=us.getCliente()%> requisita: <br/> <%=us.getDesc_pedido()%></p><br/>
            <p>Agendar</p><br/>
            <form method="post" action="agendaServico">
                <input type="text" name="cliente" value="<%=us.getCliente()%>">
                <input type="text" name="prestador" value="<%=u.getLogin()%>">
                Data de início <input type="text" name="dtinicio">
                Data do Término <input type="text" name="dtfim">
                Preco <input type="text" name="precoservico">
                <input type="submit" value="Agendar">
            </form>
            
            <p>Recusar</p>
            <form method="post" action="recusaServico">
                <input type="hidden" name="clienterec" value="<%=us.getCliente()%>">
                <input type="hidden" name="prestrec" value="<%=u.getLogin()%>">
                Motivo da recusa<br/> <textarea cols="50" rows="5" name="motivorecusa"></textarea><br/>
                <input type="submit" value="Recusar">
            </form>
        <%
            }
        %>
        
    </body>
</html>
