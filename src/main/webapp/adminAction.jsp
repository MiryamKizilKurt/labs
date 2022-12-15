<%-- 
    Document   : adminAction
    Created on : 14-Dec-2022, 3:03:06 PM
    Author     : 236349
--%>

<%@page import="com.model.Admin"%>
<%@page import="com.model.Admins"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Action Page</title>
    </head>
    <body>
        <% String filename = application.getRealPath("/WEB-INF/admins.xml");%>
        <jsp:useBean id="adminDAO" class="com.model.dao.AdminDAO" scope="application">
        <jsp:setProperty name="adminDAO" property="fileName" value="<%=filename%>"/>
        </jsp:useBean>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Admins admins = adminDAO.getAdmins();

            Admin admin = admins.admin(email, password);

            if (admin != null) {
                session.setAttribute("admin", admin);
                response.sendRedirect("admin4.jsp");
            } else {
                session.setAttribute("error", "Admin does not exist");
                response.sendRedirect("admin.jsp");
            }

        %>
    </body>
</html>
