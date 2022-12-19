<%-- 
    Document   : admin4
    Created on : 13-Dec-2022, 1:02:00 PM
    Author     : 236349
--%>

<%@page import="com.model.User"%>
<%@page import="com.model.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<html>

    <body onload="startTime()">   

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <title>User List</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
    </head>

    <% String filename = application.getRealPath("/WEB-INF/users.xml");%>       
    <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
        <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
    </jsp:useBean>

    <% Users users = userDAO.getUsers(); %>

    <c:import url="/xsl/users.xsl" var="xslt"/>
    <c:set var="xml">
        <users>
            <% for (User user : users.getUsers()) {%>
            <user>
                <ID><%= user.getID()%></ID>
                <name><%= user.getName()%></name>
                <email><%=user.getEmail()%></email>
                <DOB><%= user.getDOB()%></DOB>
            </user>
            <% }%>        
        </users>       
    </c:set> 

    <x:transform xml="${xml}" xslt="${xslt}"></x:transform>

    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <div class="navbar-header navbar-left"></div>                
        </div>
    </nav>     
    <div id="clock" class="footer"></div>
</body>
</html>


