<%-- 
    Document   : home
    Created on : 09/11/2013, 14:40:33
    Author     : Bruno
--%>

<%@page import="java.util.List"%>
<%@page import="user.sysUser"%>
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
        <jsp:useBean id="dao" class="sysDatabase.ConnectBD" scope="session"/>
            <%
                sysUser u  = (sysUser) request.getSession().getAttribute("user");
                List<sysUser> categ = (List<sysUser>) request.getAttribute("categoria");
            %>
                
        <h1>SyService</h1>
        <p>Bem-vindo</p>
        <form method="post" action="doLogin">
            Login <input type="text" name="login"><br/>
            Senha <input type="password" name="password"><br/>
            <input type="submit" value="Entrar"><br/>
        </form>
        <br/><a href="Cadastro.jsp">Crie uma conta</a>
        <br/><a href="Admin.jsp">Administrador</a>
        <%--<br/><a href="listCategoria?action=list">Categorias</a><br/>--%>
        
        <h1>Top prestadores</h1>
        
        <p>Preco</p>
            <table border="1">
            <c:forEach items = "${dao.listCategoria()}" var="usr">
                <tr>
                <th><c:out value="${usr.getCategoria()}"/></th>
                </tr>
                <%--<tr>--%>
                    <%-- <td>--%>
                        <c:forEach items = "${dao.ranknotaprecoprestadoresHome(usr.getCategoria())}" var="usr">
                            <tr>
                        <td><c:out value="${usr.getPrestador()}"/> <c:out value="${usr.getCategoria()}"/></td>
                            </tr>
                            </c:forEach>
                        <%--</td>--%>
                        <%--</tr>--%>
                <%--<c:out value="${usr.getCategoria()}"/><br />--%>
            </c:forEach>
        </table>
        
        <p>Prazo</p>
            <table border="1">
            <c:forEach items = "${dao.listCategoria()}" var="usr">
                <tr>
                <th><c:out value="${usr.getCategoria()}"/></th>
                </tr>
                <tr>
                    <td>
                        <c:forEach items = "${dao.ranknotaprazoprestadoresHome(usr.getCategoria())}" var="usr">
                            <c:out value="${usr.getPrestador()}"/> <c:out value="${usr.getCategoria()}"/><br />
                        </c:forEach>
                    </td>
                </tr>
                <%--<c:out value="${usr.getCategoria()}"/><br />--%>
            </c:forEach>
        </table>        

        <p>Serviço</p>
            <table border="1">
            <c:forEach items = "${dao.listCategoria()}" var="usr">
                <tr>
                <th><c:out value="${usr.getCategoria()}"/></th>
                </tr>
                <tr>
                    <td>
                        <c:forEach items = "${dao.ranknotaservicoprestadoresHome(usr.getCategoria())}" var="usr">
                            <c:out value="${usr.getPrestador()}"/> <c:out value="${usr.getCategoria()}"/><br />
                        </c:forEach>
                    </td>
                </tr>
                <%--<c:out value="${usr.getCategoria()}"/><br />--%>
            </c:forEach>
        </table>
        
        <p>Atendimento</p>
            <table border="1">
            <c:forEach items = "${dao.listCategoria()}" var="usr">
                <tr>
                <th><c:out value="${usr.getCategoria()}"/></th>
                </tr>
                <tr>
                    <td>
                        <c:forEach items = "${dao.ranknotaatendimentoprestadoresHome(usr.getCategoria())}" var="usr">
                            <c:out value="${usr.getPrestador()}"/> <c:out value="${usr.getCategoria()}"/><br />
                        </c:forEach>
                    </td>
                </tr>
                <%--<c:out value="${usr.getCategoria()}"/><br />--%>
            </c:forEach>
        </table>        
        
        <div>
        <h1>Últimos prestadores cadastrados</h1>
        <c:forEach items = "${dao.ultimosCadastradoHome()}" var="usr">
               <c:out value="${usr.getPrestador()}"/> <c:out value="${usr.getCategoria()}"/><br />
        </c:forEach>
        </div>
        
        <h1>Últimos prestadores contratados</h1>
        <c:forEach items = "${dao.ultimosContratadosHome()}" var="usr">
               <c:out value="${usr.getPrestador()}"/> <c:out value="${usr.getCategoria()}"/><br />
        </c:forEach>
               
               
         <p>Top prestadores</p>
            <table border="1">
            <c:forEach items = "${dao.listCategoria()}" var="usr">
                <tr>
                <th><c:out value="${usr.getCategoria()}"/></th>
                </tr>
                <%--<tr>--%>
                    <%-- <td>--%>
                        <c:forEach items = "${dao.topprestHome(usr.getCategoria())}" var="usr">
                            <tr>
                        <td><c:out value="${usr.getPrestador()}"/> <c:out value="${usr.getCategoria()}"/></td>
                            </tr>
                            </c:forEach>
                        <%--</td>--%>
                        <%--</tr>--%>
                <%--<c:out value="${usr.getCategoria()}"/><br />--%>
            </c:forEach>
        </table>
    </body>
</html>
