<%-- 
    Document   : index
    Created on : Nov 30, 2022, 9:52:27 AM
    Author     : 236325
--%>

<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <title>Home</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
    </head>
    <body onload="startTime()" >
        <%
            if (session.isNew()) {                             
                String userID = "" + (new Random().nextInt(999));
                session.setAttribute("userid", userID);
                Integer count = new Integer(0);
                session.setAttribute("counter", count);
            }
        %>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">
            <a class="button" href="admin.jsp">Admin</a>
            <a class="button" href="login.jsp">Login</a>          
            <a class="button" href="register.jsp">Register</a> 
            <a class="button" href="string.jsp">Strings</a>               
                </div>
            </div>
        </nav>
       
        <div id="clock" class="footer"></div>
    </body>
</html>
