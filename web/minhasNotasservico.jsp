<%-- 
    Document   : minhasNotasservico
    Created on : 06/11/2013, 17:18:01
    Author     : Bruno
--%>

<%@page import="java.util.List"%>
<%@page import="user.sysUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minhas avaliações</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:useBean id="dao" class="sysDatabase.ConnectBD" scope="session"/>
        <%
            sysUser u = (sysUser) request.getSession().getAttribute("user");
            List<sysUser> avaliacao = (List<sysUser>) request.getAttribute("minhaavaliacao");
        %>
        <a href="welcome.jsp"><h1><%=u.getLogin()%></h1></a><br/>
        <h1>Minhas notas de serviço</h1><br/>
        <%
            for(sysUser us : avaliacao){
        %>
            <p><%=us.getHoraAvaliacao()%> <%=us.getCliente()%> fez uma avaliação sua
            <table border="1">
                <tr>
                    <th>Preco cobrado</th>
                    <th>Respeito ao prazo</th>
                    <th>Qualidade do serviçoo</th>
                    <th>Qualidade do atendimento</th>
                </tr>
                <tr>
                    <td><%=us.getNotaPreco()%></td>
                    <td><%=us.getNotaRespeitoprazo()%></td>
                    <td><%=us.getNotaQualidadeservico()%></td>
                    <td><%=us.getNotaQualidadeatendimento()%></td>
                </tr>
            </table>
            
            Comentários:
            <%=us.getTextolivre()%><br/>
            
            <br/><a href="avaliacaoFinal?action=avaliarcliente&prest=<%=u.getLogin()%>&client=<%=us.getCliente()%>">Avaliar <%=us.getCliente()%></a>
        <%
            }
        %>

    </body>
</html>
