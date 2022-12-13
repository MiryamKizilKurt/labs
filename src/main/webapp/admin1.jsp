<%-- 
    Document   : admin1
    Created on : Dec 13, 2022, 9:48:12 AM
    Author     : George
--%>

<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="com.model.dao.XmlTransformer"%>
<%@page import="com.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <% String xslPath = application.getRealPath("/xsl/users.xsl");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        
        <% 
            Users users = userDAO.getUsers();
            XmlTransformer transformer = new XmlTransformer();
            transformer.transform(xslPath, users, new StreamResult(out));            
        %>
    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <div class="navbar-header navbar-left"></div>                
        </div>
    </nav>     
    <div id="clock" class="footer"></div>
        
    </body>
</html>
