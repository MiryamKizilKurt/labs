<%-- 
    Document   : sesionInfo
    Created on : Nov 30, 2022, 1:23:54 PM
    Author     : 236325
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <title>Session Info</title>
    </head>
    <body>    
        <% 
            Date creationTime = new Date(session.getCreationTime());  
            Date lastAccessed = new Date(session.getLastAccessedTime());
            String userID = (String) session.getAttribute("userid");
            Integer count = (Integer) session.getAttribute("counter");
            count = count + 1;
            session.setAttribute("counter", count);
        %>
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">
                    <a class="navbar-brand" href="#">Session Info</a>                    
                    <a class="btn btn-info" style="text-decoration: none; color: white; font-size: 16px;" href="index.jsp">Home</a>               
                </div>               
            </div>
        </nav>
        <br>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark"><tr><th>Session Info</th><th>Values</th></tr></thead>
                        <tr><td>Session ID</td><td> <%= session.getId() %> </td></tr>
                        <tr><td>Creation time</td><td><%= creationTime %> </td></tr>
                        <tr><td>Last Accessed</td><td> <%= lastAccessed %></td></tr>
                        <tr><td>Client ID</td><td><%= userID %></td></tr>
                        <tr><td>Number of Visits</td><td><%= count%></td></tr>
                    </table>
                </div>
            </div>
        </div>
               
    </body>
</html>

