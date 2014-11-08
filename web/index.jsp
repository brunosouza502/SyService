<%-- 
    Document   : index
    Created on : 26/07/2013, 21:47:42
    Author     : Bruno
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SyService</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <h1>SyService</h1>
        <p>Bem-vindo</p>
        <form method="post" action="doLogin">
            Login <input type="text" name="login"><br/>
            Senha <input type="password" name="password"><br/>
            <input type="submit" value="Entrar"><br/>
        </form>
        <br/><a href="Cadastro.jsp">Crie uma conta</a>
        <br/><a href="Admin.jsp">Administrador</a>
        <br/><a href="listCategoria?action=list">Categorias</a>
        
        <jsp:forward page="homepage?action=ranking" />
        
    </body>
</html>
