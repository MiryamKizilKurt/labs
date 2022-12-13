<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : movies.xsl
    Created on : 12 December 2022, 2:10 PM
    Author     : 236349
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="shop">
        <html>
            <head>
                <title>Movies</title>
                <style>
                    table{
                    border-collapse:collapse;
                    width:70%;
                    }
                    th, td{
                    padding:8px;
                    text-align:left;
                    }
                    th{
                    background-color: green;
                    color: white;
                    font-weight:bold;
                    font-size:20px;
                    }
                    h1, h2, p{
                    background-color:#065381;
                    font-weight:bold;
                    width:70%;
                    color: white;
                    }
                    tr:nth-child(even){background-color:#B0C4DE;}
                    tr:nth-child(odd){background-color:#D2B48C;}
                </style>
            </head>
            <body bgcolor="#9da3a6">
                <xsl:apply-templates/>
                <p class="p">Total Number of Movies: <xsl:value-of select="count(movies/movie)"/></p>
                <p class="p">Average Rating: <xsl:value-of select="sum(movies/movie/rating) div count(movies/movie)" /></p>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="shop/name">
        <h1>           
            <xsl:apply-templates/>            
        </h1>
    </xsl:template>
    
    <xsl:template match="shop/movies">
        <table>
            <thead>
                <th>TITLE</th>
                <th>CDSET (Numbers)</th>
                <th>PRICE ($)</th>
                <th>RATING (Out of 10)</th>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="movie">
        <tr>
            <td><xsl:value-of select="title"/></td> 
            <td><xsl:value-of select="cdset"/></td>
            <td><xsl:value-of select="price"/></td>            
            <td>
                <div style="width:100px;background:white;height:12px;">
                    <div style="width:{20*rating}px;background:green;height:12px;"></div>                    
                </div>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
