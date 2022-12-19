<%-- 
    Document   : loginAction
    Created on : Nov 30, 2022, 12:04:51 PM
    Author     : 236325
--%>

<%@page import="com.model.User"%>
<%@page import="com.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <title>Login Action</title>
    </head>
    <body onload="startTime()">
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>

        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Users users = userDAO.getUsers();

            User user = users.user(email, password);

            if (user != null) {
                session.setAttribute("user", user);
                //    response.sendRedirect("main.jsp");

            } else {
                session.setAttribute("error", "User does not exist");
                response.sendRedirect("login.jsp");
            }
        %>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">             
                    <a class="button" href="logout.jsp">Logout</a>  
                    <a class="button" href="index.jsp">Home</a> 
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <% if (user != null) {%>
                <table class="mytable">
                    <h1<a style=" color: #ffff33; font-size: 60px;">Welcome <%= user.getName()%> </a></h1>
                    <thead><th style="text-align: center; font-size: 20px; color: #afeb00;" colspan="2">User Information</th></thead>
                    <tr><td>Email: </td><td> <%= email%></td></tr>
                    <tr><td>Password: </td><td> <%= password%></td></tr>
                    <tr>
                        <td> 
                            <a class="button" href="main.jsp">Main</a>
                        </td>
                    </tr>
                </table>
                <%} else {%>
                <h1 style=" color: #ffff33; font-size: 30px;">User does not exists! </h1>
                <%}%>
            </div>
        </div>
    </body>
    <div id="clock" class="footer"></div>
</html>