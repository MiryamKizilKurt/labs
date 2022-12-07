<%-- 
    Document   : login
    Created on : Nov 30, 2022, 11:07:27 AM
    Author     : 236325
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <title>Login</title>
    </head>
    <body onload="startTime()">    
        <% 
            String exist = (String) session.getAttribute("error");
        %>
        <div style="margin: auto;">
            <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">                   
                    <a class="button" href="index.jsp">Home</a>
                    <a class="button" href="register.jsp">Sign Up</a>
                </div>
            </div>
        </nav>
            <div class="container-fluid">
                <div class="row">
            <form method="POST" action="loginAction.jsp">
                <table class="mytable">
                   <thead><th style="text-align: center; font-size: 20px; color: #afeb00;" colspan="2">Sign In Here<span class="message"><%= (exist != null) ? exist : ""%></span></th></thead>
                    <tr><td>Email: </td><td><input type="text" name="email" placeholder="Enter your email" /></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" placeholder="Enter your password" /></td></tr>
                    <tr>
                        <td> </td>
                        <td>
                            <a class="button" href="index.jsp">Cancel</a>
                            <input class="button" type="submit" value="Sign In" />
                     
                        </td>
                    </tr> 
                </table>
            </form>
          </div>
        </div>
      </div>
        <div id="clock" class="footer"></div>
    </body>
</html>