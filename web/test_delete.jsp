<%-- 
    Document   : test_delete
    Created on : Oct 4, 2016, 11:43:12 AM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            function abc(a){
                var stat = document.getElementById("btn").value;
                if(stat==="Actie"){
                   document.getElementById("btn").setAttribute("value","Deactiv");
                   document.getElementById("btn").style.backgroundColor = "red";
                    alert("ac");
                }else{
                    document.getElementById("btn").setAttribute("value","Actie");
                    alert("de")
                }
            }
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <button type="button" value="Actie" id="btn" onclick="abc('1')">states</button>
    </body>
</html>
