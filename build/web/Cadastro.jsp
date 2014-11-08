<%-- 
    Document   : Cadastro
    Created on : 21/08/2013, 18:09:53
    Author     : Bruno
--%>

<%@page import="user.sysUser"%>
<%@page import="sysDatabase.UserData"%>
<%@page import="user.EditarCrud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:useBean id="dao" class="sysDatabase.ConnectBD" />
        <h1>Cadastro</h1>
        <form method="post" action="doUserCrud">
            Nome  <input type="text" name="name">
            Sobrenome  <input type="text" name="sname"><br/>
            Login <input type="text" name="login"><br/>
            Senha <input type="password" name="password"><br/>
            Sexo  <br/>
            Masculino <input type="radio" value="Masculino" name="sexo">
            Feminino  <input type="radio"  value="Feminino" name="sexo"><br/>
            Cidade <input type="text" name="cidade"><br/>
            Servico <input type="text" name="servico">
            Categoria
            <select name="categoria">
                <c:forEach var="u" items="${dao.listCategoria()}">
                    <option><c:out value="${u.categoria}"/></option>
                </c:forEach>
            </select> <br/>
            Descrição do serviço <br/>
            <textarea  rows="5" cols="50" name="descricaoservico"></textarea>
            
            <input type="submit" value="Ok" class="button">
            <input type="reset" value="Limpar" class="button">
        </form>
        <br/><a href="index.jsp">Voltar</a>
        
    </body>
</html>
