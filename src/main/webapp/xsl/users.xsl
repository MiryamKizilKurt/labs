<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Admin View</title>
                <!-- <link href="css/users.css" rel="stylesheet" type="text/css"></link> -->
            </head>
            <body>
                <div class="label">User List 
                    <span class="center">
                        <a class="button" href="index.jsp">Home</a>
                    </span>
                </div>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="users">
        <table>
            <thead>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Date of Birth</th>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="/users/user">
        <tr>
            <td>
                <xsl:value-of select="ID"/>
            </td>
            <td>
                <xsl:value-of select="name"/>
            </td>
            <td>
                <xsl:variable name="emailurl" select="email"></xsl:variable>
                <a href="http://localhost:8080/labs/account.jsp?email={$emailurl}">
                    <xsl:value-of select="email"/>
                </a>
            </td>
            <td>
                <xsl:value-of select="DOB"/>
            </td>
        </tr>        
    </xsl:template>
</xsl:stylesheet>
