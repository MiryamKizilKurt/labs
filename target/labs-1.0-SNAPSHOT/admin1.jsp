
<%@page import="com.model.Users"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="com.model.dao.XmlTransformer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body onload="startTime()">   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <title>Admin login</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
    </head>
        <%
            session.invalidate();
            request.setAttribute("email", null);
            request.removeAttribute("email");
        %>
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <% String xslPath = application.getRealPath("/xsl/users.xsl");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
        <jsp:setProperty name="userDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>

        <%
            Users users = userDAO.getUsers();
            XmlTransformer transformer = new XmlTransformer();
            transformer.transform(xslPath, users, new StreamResult(out));
        %>
    <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">             
            <a class="button" href="logout.jsp">Logout</a>  
            <a class="button" href="index.jsp">Home</a> 
                </div>
            </div>
        </nav>
       <div class="container-fluid">       
    </body>
  <div id="clock" class="footer"></div>
</html>
