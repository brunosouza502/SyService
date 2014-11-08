<%-- 
    Document   : Admin
    Created on : 03/09/2013, 20:03:45
    Author     : Bruno
--%>

<%@page import="user.sysUser"%>
<%@page import="sysDatabase.UserData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h2>SyService <br/> Espaço do administrador</h2>
        
        <form method="post" action="adminLogin">
            Login <input type="text" name="login"><br/>
            Senha <input type="password" name="password"><br/>
            <input type="submit" value="Entrar"><br/>
        </form>
        <br/><a href="home.jsp">Voltar</a>
    </body>
</html>
