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
        <h2><%= user.getName() %> record has been deleted!</h2>
        <% session.invalidate(); %>
        <p>You have been logged out click <a href="index.jsp"> here </a> to go back home</p>   
    </body>
</html>
