<%-- 
    Document   : register
    Created on : Nov 30, 2022, 11:11:24 AM
    Author     : 236325
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <title>Register</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
    </head>
    <body onload="startTime()">
        <% 
            String emailError = (String)session.getAttribute("emailError");
            String passError = (String)session.getAttribute("passError");
        %>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">
            <a class="button" href="login.jsp">Login</a>
            <a class="button" href="index.jsp">Home</a>  
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
           <form method="POST" action="welcome.jsp">
                <table class="mytable">
                    <thead><th style="text-align: center; font-size: 20px; color: #afeb00;" colspan="2">Sign Up</th></thead>
                    <tr><td>Name: </td><td><input type="text" name="name" placeholder="Enater your name" /></td></tr>
                    <tr><tr><td>Email: </td><td><input type="text" name="email" placeholder="<%= (emailError !=null) ? emailError :"Enter your email" %>" /></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" placeholder="<%= (passError !=null) ? passError :"Enter your password" %>" /></td></tr>
                    <tr><td>DOB: </td><td><input type="date" name="dob"/></td></tr>
                    <tr>
                        <td> </td>
                        <td>
                            <a class="button" href="index.jsp">Cancel</a>
                            <input class="button" type="submit" value="Sign Up" />
                        </td>
                    </tr>
                </table>
            </form>
            </div>
        </div>        
        <div id="clock" class="footer"></div>
    </body>
</html>

