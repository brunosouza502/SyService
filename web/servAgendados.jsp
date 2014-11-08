<%-- 
    Document   : agendaServico
    Created on : 01/11/2013, 17:38:26
    Author     : Bruno
--%>

<%@page import="java.util.List"%>
<%@page import="user.sysUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servico Agendados</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            sysUser us = (sysUser) request.getSession().getAttribute("user");
            List<sysUser> uagendado = (List<sysUser>) request.getAttribute("accepted");
            sysUser checkconclusao = (sysUser) request.getAttribute("verificarconclusao");
        %>
        <a href="welcome.jsp"><h1><%=us.getLogin()%></h1></a><br/>
        
        <h1>Requisições aceitas</h1>
        
        <%
            for(sysUser ag : uagendado){
        %>
        <p><%=ag.getPrestador()%> aceitou seu pedido <br/> Detalhes: <br/>
            Início do serviço: <%=ag.getDtInicioagendamento()%> Estimativa de término: <%=ag.getDtFimagendamento()%> <br/>
            Preço: <%=ag.getPrecoEstimado()%>
        </p>
        <a href="concluirServico?action=concluir&client=<%=us.getLogin()%>&prest=<%=ag.getPrestador()%>">Concluir serviço</a><br/>
        
        <%
            }
        %>
    </body>
</html>

