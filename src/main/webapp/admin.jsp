<%-- 
    Document   : admin
    Created on : 14-Dec-2022, 3:01:40 PM
    Author     : 236349
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <title>Login</title>
    </head>
    <body onload="startTime()">  
        <% 
            String exist = (String) session.getAttribute("error");
        %>
        <div style="margin: auto;">
            <form method="POST" action="adminAction.jsp">
                <table class="table">
                    <caption>Sign In <span class="message"><%= (exist != null) ? exist : ""%></span></caption>
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
         <% exist = ""; %>
        <div id="clock" class="footer"></div>
    </body>
</html>
