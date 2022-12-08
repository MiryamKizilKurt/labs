<%-- 
    Document   : delete
    Created on : 07-Dec-2022, 12:01:07 PM
    Author     : 236349
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
        <title>Delete Page</title>
    </head>
    <body>
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <% 
            User user = (User) session.getAttribute("user");
            Users users = userDAO.getUsers();
            userDAO.delete(users, user);
        %>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">
                <% session.invalidate(); %>
                <h1 style=" color: #adff2f; font-size: 15px;"><%= user.getName() %> record has been deleted! <a class="button" href="index.jsp">Home</a></h1>    
                </div>
            </div>
        </nav>
    </body>
</html>


