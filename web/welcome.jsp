<%-- 
    Document   : welcome
    Created on : 21/08/2013, 16:06:57
    Author     : Bruno
--%>

<%@page import="user.sysUser"%>
<%@page import="sysDatabase.UserData"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
         <%--<jsp:useBean id="usr" class="user.sysUser" scope="session"/>--%>
         <%
            sysUser u = (sysUser) request.getSession().getAttribute("user");
            sysUser ureq = (sysUser) request.getSession().getAttribute("req");
            if (u != null) {
        %>
        <form method="post" action="busca">
            <input type="text" name="termo">
            <input type="submit" value="Buscar"><br/>
        </form><br/>
        
        <h1>Bem Vindo <a href="welcome.jsp"><%=u.getName()%></a></h1>
        <a href="editarPerfil.jsp">Editar</a><br/>
        <%
            } else {
        %>
                <h1>Login error!</h1><br/>
        <%  
            }
        %>
        
        <%
            if(ureq!=null){
        %>
        <p><%=ureq.getCliente()%></p>
        <p><%=ureq.getDesc_pedido()%></p>
        <%
            }
        %>
        <a href="listCategoria?action=list">Categorias</a> <br/>
        <%--<a href="reqPrest?action=req">Verificar requisições</a> <br/>--%>
        <a href="verificarRequisicao?action=req&prest=<%=u.getLogin()%>">Check requisitions</a> <br/>
        <a href="myRequisitions?action=myreq&user=<%=u.getLogin()%>">Quem eu requisitei</a> <br/>
        <a href="servicosAgendados?action=agendado&prest=<%=u.getLogin()%>">Requisições aceitas</a> <br/>
        <a href="minhasavaliacoesServico?action=myavaliation&prest=<%=u.getLogin()%>">Avaliações dos meus serviços</a> <br/>
        <a href="minhasavaliacoesCliente?action=myClientavaliation&client=<%=u.getLogin()%>">Avaliações de outros prestadores</a> <br/>
        <br/><a href="logout?action=logoff">Sair</a>    
    </body>
</html>

