<%-- 
    Document   : categoria
    Created on : 26/09/2013, 12:46:21
    Author     : Bruno
--%>
<%@page import="java.util.List"%>
<%@page import="user.sysUser"%>
<%@page import="sysDatabase.UserData"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categoria</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:useBean id="dao" class="sysDatabase.ConnectBD" scope="session"/>
        <%
                sysUser u  = (sysUser) request.getSession().getAttribute("user");
                List<sysUser> usrs = dao.listCategoria();
               // for(sysUser us : usrs){
        %>
        <a href="welcome.jsp"><h1><%=u.getLogin()%></h1></a><br/>
        <h1>Categorias</h1> <br/>      

            
            <%--<a href="navegateCateg?categ="><%=us.getCategoria()%></a><br/>
            <%
                }
            %>--%>

            
            <c:forEach items = "${dao.listCategoria()}" var="usr">
                <a href="navegateCateg?action=update&categ=<c:out value="${usr.getCategoria()}"/>"><c:out value="${usr.getCategoria()}"/></a><br />
            </c:forEach>
                
                <br/>
                <%--<form method="post" action="navegateCateg">
                    <select name="categprestador"> 
                        <c:forEach items = "${dao.listCategoria()}" var="usr">
                            <option><c:out value="${usr.getCategoria()}"/></option>    
                        </c:forEach>
                    </select>
                    <input type="submit" value="Buscar">
                </form>--%>
            
            <%
                if(u!=null){
            %>
                <br/><a href="welcome.jsp">Voltar</a>
            <%
                }else{
            %>
                <br/><a href="home.jsp">Voltar</a>
            <%
                }
            %>
    </body>
</html>
