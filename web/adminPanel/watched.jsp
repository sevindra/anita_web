<%-- 
    Document   : watched
    Created on : 27-Jan-2016, 15:55:34
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            <%
                HttpSession hs = request.getSession();
                POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");

            %>

            var myVar = setInterval(myTimer, 1000);
            function myTimer() {
                <%
                if(user==null){
                %>
                  alert("Please Login");
                                      <%
                }
                %>
            }
        </script>
        <h1>Watched</h1>
    </body>
</html>
