<%-- 
    Document   : minhasNotascliente
    Created on : 08/11/2013, 17:19:30
    Author     : Bruno
--%>

<%@page import="java.util.List"%>
<%@page import="user.sysUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minhas avaliações como cliente</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
                <jsp:useBean id="dao" class="sysDatabase.ConnectBD" scope="session"/>
        <%
            sysUser u = (sysUser) request.getSession().getAttribute("user");
            List<sysUser> avaliacao = (List<sysUser>) request.getAttribute("minhaavaliacaocomocliente");
        %>
        <a href="welcome.jsp"><h1><%=u.getLogin()%></h1></a><br/>
        <h1>Minhas notas como cliente</h1><br/>
        <%
            for(sysUser us : avaliacao){
        %>
            <p><%=us.getHoraAvaliacao()%> <%=us.getPrestador()%> fez uma avaliação sua
            <table border="1">
                <tr>
                    <th>Pagamento adequado</th>
                    <th>Fornecimento de materiais adequados</th>
                    <th>Lida com cliente</th>
                </tr>
                <tr>
                    <td><%=us.getNotaPagamento()%></td>
                    <td><%=us.getNotaFornecimentomateriais()%></td>
                    <td><%=us.getNotaFacilidadetrato()%></td>
                </tr>
            </table> <br/>
            Comentários:
            <p><%=us.getTextolivre()%></p>
            
        <%
            }
        %>

    </body>
</html>
