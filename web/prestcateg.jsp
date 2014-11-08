<%-- 
    Document   : prestcateg
    Created on : 16/10/2013, 14:14:09
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
        <title>Prestadores</title>
        <link href="CSS/welcome.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <jsp:useBean id="dao" class="sysDatabase.ConnectBD" scope="session"/>
        <%
                sysUser u  = (sysUser) request.getSession().getAttribute("user");
               // for(sysUser us : usrs){
        %>
        <a href="welcome.jsp"><h1><%=u.getLogin()%></h1></a><br/>
        <h1>Prestadores</h1>

        
        <%
            List<sysUser> prest = (List<sysUser>)request.getAttribute("prestadores");
            List<sysUser> toprestpreco = (List<sysUser>)request.getAttribute("ranknotapreco");
            List<sysUser> toprestprazo = (List<sysUser>) request.getAttribute("ranknotaprazo");
            List<sysUser> toprestserv = (List<sysUser>) request.getAttribute("ranknotaservico");
            List<sysUser> toprestatendimeto = (List<sysUser>) request.getAttribute("ranknotaatendimento");
            
            List<sysUser> ultimoscadastrados = (List<sysUser>)request.getAttribute("ultimoscad");
            List<sysUser> ultimoscontratados = (List<sysUser>)request.getAttribute("ultimoscontratados");
            List<sysUser> topusers = (List<sysUser>)request.getAttribute("topusers");
        %> 
        <c:forEach items = "${prest}" var="usr">
                <a href="navegateCateg?"><c:out value="${usr.getPrestador()}"/></a>
        </c:forEach>
        
        <%
            for(sysUser us : prest){
        %>
        <a href="user?action=update&login=<%=us.getPrestador()%>"><%=us.getPrestador()%></a> <br/>

        <%
                }
        %>
 
            <%
                if(prest==null){
            %>
            <p>Sem contribuintes</p>
            <%
                }
            %>
        
            <br/>
            
            <h1>Top prestadores</h1><br/>
        <p>Preço</p>
        
        <%
            for(sysUser rkpreco : toprestpreco){
        %>
        <a href="user?action=update&login=<%=rkpreco.getPrestador()%>"><%=rkpreco.getPrestador()%></a><br/>
        <%
            }
        %>
        
        <p>Prazo cobrado</p>
        <%
            for(sysUser rkprazo : toprestprazo){
        %>
        <a href="user?action=update&login=<%=rkprazo.getPrestador()%>"><%=rkprazo.getPrestador()%></a><br/>
        <%
            }
        %>
        
        <p>Qualidade do serviço</p>
        <%
            for(sysUser rkserv : toprestserv){
        %>
        <a href="user?action=update&login=<%=rkserv.getPrestador()%>"><%=rkserv.getPrestador()%></a><br/>
        <%
            }
        %>
        
        <p>Atendimento</p>
        <%
            for(sysUser rkat : toprestatendimeto){
        %>
        <a href="user?action=update&login=<%=rkat.getPrestador()%>"><%=rkat.getPrestador()%></a><br/>
        <%
            }
        %>
        
        <h1>Cadastrados recentemente</h1>
        <%
            for(sysUser last : ultimoscadastrados){
        %>
        <a href="user?action=update&login=<%=last.getPrestador()%>"><%=last.getPrestador()%></a><br/>
        <%
            }
        %>
        
        <h1>Contratados recentemente</h1>
        <%
            for(sysUser lastcontrat : ultimoscontratados){
        %>
        <a href="user?action=update&login=<%=lastcontrat.getPrestador()%>"><%=lastcontrat.getPrestador()%></a> Requisitado por: 
        <a href="user?action=update&login=<%=lastcontrat.getCliente()%>"><%=lastcontrat.getCliente()%></a><br/>
        <%
            }
        %>
        
        <h1>Top prestadores</h1>
        <%
            for(sysUser top : topusers){
        %>
        <a href="user?action=update&login=<%=top.getPrestador()%>"><%=top.getPrestador()%></a><br/>
        <%
            }
        %>
            <br/><a href="categoria.jsp">Voltar</a><br/>
            <br/><a href="home.jsp">Inicio</a><br/>
            
    </body>
</html>
