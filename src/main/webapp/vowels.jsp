<%-- 
    Document   : vowels
    Created on : Nov 30, 2022, 2:56:33 PM
    Author     : 236325
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        
        <% String s = request.getParameter("string");%>
         
        <%! String str(String str){             
            
           String newstr = str.replaceAll(" ",""); 
            return newstr;
            }
         %>
        
        <%! 
          int freq(char c, String str){  
            int count =0;
            for (int i = 0; i<str.length(); i++)
                if(c == str.charAt(i))
                    count++;
                return count;
           }
        %> 
        <%!
           int countSpaces(String str) {
             int spaces = 0;
             for(int i = 0; i < str.length(); i++) {
             spaces += (Character.isWhitespace(str.charAt(i))) ? 1 : 0;
             }
             return spaces;
            }
         %>
       
        <table class="mytable table-bordered table-striped">
            <thead><th>String</th> <td><%= str(s)%></td></thead>
            <thead><th>Spaces</th><td><%= countSpaces(s)%></td></thead>
        
            <thead><th>Vowels</th><th>Frequency</th></thead>
                <% char [] vowels = {'a','e','i','o','u'};
                for (int i = 0; i <= vowels.length-1; i++) {%>
        <tr> 
            <td><%= vowels[i]%></td>                           
            <td><%= freq(vowels[i],s)%></td>
            
            
        </tr>        
        <% }%>
    </table>
    </body>
</html>
