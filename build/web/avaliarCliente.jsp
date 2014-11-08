<%-- 
    Document   : avaliarCliente
    Created on : 06/11/2013, 14:49:57
    Author     : Bruno
--%>

<%@page import="user.sysUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avaliar cliente</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:useBean id="dao" class="sysDatabase.ConnectBD" scope="session"/>
        <%
            sysUser u = (sysUser) request.getSession().getAttribute("user");
            sysUser avaliar = (sysUser) request.getAttribute("clienteavaliacao");//vem de minhasavaliacoesServicos.jsp e avaliacaoFinal.java
        %>
        <a href="welcome.jsp"><h1><%=u.getLogin()%></h1></a> <br/>
        <h1>Avaliar <%=avaliar.getCliente()%> como cliente</h1>
        
        <form method="post" action="avaliaCliente">
            <input type="hidden" name="cliente" value="<%=avaliar.getCliente()%>">
            <input type="hidden" name="prestador" value="<%=avaliar.getPrestador()%>">
            Nota do pagamento combinado <select name="notapgmt">
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
            </select> <br/>
            
            Nota de fornecimento dos materiais<select name="notamaterial">
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
            </select> <br/>
            
            Nota de lida com o cliente <select name="notatratocliente">
                    <option>0</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                    <option>6</option>
                    <option>7</option>
                    <option>8</option>
                    <option>9</option>
                    <option>10</option>
            </select> <br/>
            
            Comentários sobre <%=avaliar.getCliente()%><br/>
            <textarea  rows="5" cols="50" name="textolivre"></textarea><br/>
            <input type="submit" value="Finalizar">
        </form>
            
    </body>
</html>
