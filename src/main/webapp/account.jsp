<%-- 
    Document   : account
    Created on : Nov 30, 2022, 12:50:47 PM
    Author     : 236325
--%>

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
        <%
            String submitted = request.getParameter("submitted");

            if (submitted != null && submitted.equals("submitted")) {
                int ID = Integer.parseInt(request.getParameter("ID"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                user = (User) session.getAttribute("user");
                user.update(ID, name, email, password, dob);     
                session.setAttribute("user", user);
            }else{
                user = (User) session.getAttribute("user");
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
            <form method="POST" action="account.jsp">
                <table class="mytable">
                    <thead><th style="text-align: center; font-size: 20px; color: #afeb00;" colspan="2">Edit User <span class="message"><%= (submitted != null) ? "Update is Successful" : ""%></span></th></thead>
                    <tr><td>ID: </td><td><input type="text" name="ID" value="${user.ID}" readonly="true" /></td></tr>
                    <tr><td>Name: </td><td><input type="text" name="name" value="${user.name}" /></td></tr>
                    <tr><td>Email: </td><td><input type="text" name="email" value="${user.email}" readonly="true"/></td></tr>
                    <tr><td>Password: </td><td><input type="password" name="password" value="${user.password}" /></td></tr>
                    <tr><td>DOB: </td><td><input type="date" name="dob" value="<%= user.getDOB()%>"/></td></tr>
                    <tr><input type="hidden" name="submitted" value="submitted"></tr>
                    <tr>
                        <td> </td>
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

