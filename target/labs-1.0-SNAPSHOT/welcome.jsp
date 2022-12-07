<%-- 
    Document   : welcome
    Created on : Nov 30, 2022, 11:34:08 AM
    Author     : 236325
--%>

<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
         <link rel="stylesheet" href="css/layout.css"/>
         <script type="text/javascript" src="js/index.js"></script>
        <title>Welcome</title>
    </head>
    <body onload="startTime()">
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");

            User user = new User(name, email, password, dob);
            Users users = userDAO.getUsers();
            
            // Lookup function 
            User userXML = users.user(user.getEmail());
            
            if(userXML != null){
                session.setAttribute("error", "User already exists");
                response.sendRedirect("register.jsp");
            }else{
                users.add(user);
                userDAO.save(users, filename);
                session.setAttribute("user", user);
            }              

        %>
    <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">
            <a class="button" href="logout.jsp">Logout</a>
            <a class="button" href="main.jsp">Main</a>  
                </div>
            </div>
        </nav>
        <div class="container-fluid">
          <div class="row">
        <table class="mytable">
            <thead><th style="text-align: center; font-size: 20px; color: #afeb00;" colspan="2">User Information</th></thead>
            <tr><td>Name: </td><td> <%= name %></td></tr>
            <tr><td>Email: </td><td> <%= email %></td></tr>
            <tr><td>Password: </td><td> <%= password %></td></tr>
            <tr><td>D.O.B.: </td><td> <%= dob %></td></tr>
        </table>
          </div>
        </div>
        <div id="clock" class="footer"></div>
    </body>
</html>
