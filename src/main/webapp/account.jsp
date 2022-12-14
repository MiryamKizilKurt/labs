<%-- 
    Document   : account
    Created on : Nov 30, 2022, 12:50:47 PM
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
        <title>Account</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
    </head>
    <body onload="startTime()">   
        <%!
            User user;
        %>
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <%
            String submitted = request.getParameter("submitted");
            String emailView = request.getParameter("email");
            Users users = userDAO.getUsers();

            if (emailView != null) {
                user = users.user(emailView);
                session.setAttribute("emailView", emailView);
            } else {
                user = (User) session.getAttribute("user");
            }

            if (submitted != null && submitted.equals("submitted")) {
                int ID = Integer.parseInt(request.getParameter("ID"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                emailView = (String) session.getAttribute("emailView");
                if (emailView != null) {
                    user = users.user(emailView);
                }
                user.update(ID, name, email, password, dob);
                userDAO.update(users, user);
                session.setAttribute("user", user);
            }
        %>

        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">
                    <a class="button" href="logout.jsp">Logout</a>
                </div>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <form method="POST" action="account.jsp">
                    <table class="mytable">               
                    <caption>User info <span class="message"><%= (submitted != null) ? "Update is Successful" : ""%></span></caption>
                    <tr><td>ID: </td><td><input type="text" name="ID" value="<%= user.getID()%>" readonly="true" /></td></tr>
                    <tr><td>Name: </td><td><input type="text" name="name" value="<%= user.getName()%>" /></td></tr>
                    <tr><td>Email: </td><td><input type="text" name="email" value="<%= user.getEmail()%>" readonly="true"/></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" value="<%= user.getPassword()%>" /></td></tr>
                    <tr><td>DOB: </td><td><input type="date" name="dob" value="<%= user.getDOB()%>"/></td></tr>
                    <tr><input type="hidden" name="submitted" value="submitted"></tr>
                    <tr>
                            <td>  <% if (emailView != null) { %>
                                <a class="button" href="admin4.jsp">Accounts</a> 
                                <%} else { %>
                                <a class="button" href="main.jsp">Dashboard</a>
                                <%}%> </td>
                            <td>
                                <input class="button" type="submit" value="Update" />
                                <a class="button" href="delete.jsp">Delete</a>
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

