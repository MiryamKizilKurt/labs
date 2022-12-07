<%-- 
    Document   : logout
    Created on : Nov 30, 2022, 11:08:02 AM
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
        <title>Logout Page</title>
    </head>
    <body>
               
    <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">
                <% session.invalidate(); %>
            <h1 style=" color: #adff2f; font-size: 15px;">You have been logged out- Thank you!<a class="button" href="index.jsp">Home</a> </h1>                          
                </div>
            </div>
        </nav>
        </body>
</html>
