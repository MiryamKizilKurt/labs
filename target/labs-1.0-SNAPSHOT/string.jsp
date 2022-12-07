<%-- 
    Document   : string
    Created on : Nov 30, 2022, 10:05:34 AM
    Author     : 236325
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Strings</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
        <link rel="stylesheet" href="css/layout.css"/>
        <script>
            $('form input').on('change', function () {
                $(this).closest('form').submit();
            });
        </script>
    </head>
    <body onload="startTime()">
        <nav class="navbar navbar-dark bg-dark">
            <div class="container-fluid">
                <div class="navbar-header navbar-left">                   
                    <a class="button" href="index.jsp">Home</a>
                </div>
                 <form class="navbar-form navbar-left" action="string.jsp">
                    <div class="input-group">
                        <input id="string" type="text" name="string" class="form-control" placeholder="Enter Your Strings" autofocus>                        
                    </div>
                </form>
            </div>
        </nav>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-x-1">
                    <jsp:include page="vowels.jsp" flush="true"/>
                </div>
            </div>
        </div>
       <div id="clock" class="footer"></div>          
    </body>
</html>


