<%-- 
    Document   : newjsp
    Created on : Jun 2, 2016, 11:14:58 AM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <div style="height: 70px">
            
        </div>
        <div>
            <p id="me">Hello</p>
        </div>
        <p></p>
        <div>
            <a id="me1"> njnj</a>
        </div>

        <script>
            var p = $("#me");
            var position = p.position();
            $("#me1").text("left: " + position.left + ", top: " + position.top);
           // alert(position.top);
        </script>
    </body>
</html>
