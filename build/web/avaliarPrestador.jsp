<%-- 
    Document   : avaliarPrestador
    Created on : 05/11/2013, 15:52:09
    Author     : Bruno
--%>

<%@page import="user.sysUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Avaliar prestador</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:useBean id="dao" class="sysDatabase.ConnectBD" scope="session"/>
        <%
            sysUser u = (sysUser) request.getSession().getAttribute("user");
            sysUser avaliar = (sysUser) request.getAttribute("concluido");//vem de servAgendados.jsp e concluirServico.java
        %>
        <a href="welcome.jsp"><h1><%=u.getLogin()%></h1></a> <br/>
        <p>Avaliar <%=avaliar.getPrestador()%></p><br />
        
        <form method="post" action="avaliaPrestador">
            <input type="hidden" name="cliente" value="<%=u.getLogin()%>">
            <input type="hidden" name="prestador" value="<%=avaliar.getPrestador()%>">
            Data do término <input type="text" name="datatermino"><br/>
            Nota do preço cobrado <select name="notapreco">
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
            
            Nota de respeito aos prazos<select name="notaprazos">
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
            
            Nota de qualidade do serviço <select name="notaqualidadeservico">
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
            
             Nota de qualidade do atendimento<select name="notaqualidadeatendimento">
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
            
            Comentários sobre <%=avaliar.getPrestador()%><br/>
            <textarea  rows="5" cols="50" name="textolivre"></textarea><br/>
            <input type="submit" value="Finalizar">
        </form>
    </body>
</html>
