<%-- 
    Document   : main
    Created on : Nov 30, 2022, 12:51:56 PM
    Author     : 236325
--%>

<%@page import="com.model.Users"%>
<%@page import="java.util.List"%>
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
        <!-- <title>Blogs</title> -->
    </head>
    <body onload="startTime()" >  
        <% String filename = application.getRealPath("/WEB-INF/users.xml"); %>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <% 
            User user = (User) session.getAttribute("user");            
            String text = request.getParameter("blog");
            if(text != null){
                user.add(text);         
            }
            
            Users users = userDAO.getUsers();
           
            userDAO.update(users, user);
            
            session.setAttribute("user", user);
        %>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">
                    <a class="navbar-brand" href="#"><%= user.getName() %> </a>                    
                    <a class="button" href="logout.jsp">Logout</a>
                    <a class="button" href="account.jsp">Account</a>
                </div> 
            </div>
        </nav>
        <div class="container-fluid">             
        </div>
        <div id="clock" class="footer"></div>
    </body>
</html>

