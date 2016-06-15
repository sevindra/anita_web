<%-- 
    Document   : send_sms
    Created on : Jun 13, 2016, 10:30:08 PM
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

        Name:
        <input type="text" id="txtNumb" name="numb"/><br />
        <input type="text" id="mess" name="numb"/><br />
        <input type="text" id="userid" name="numb"/><br />
        <br />


        <input type="button" id="btnQueryString" value="Send" />
        <input type="button" id="my" value="check" />
        <script type="text/javascript">
            $(function () {
                $("#btnQueryString").bind("click", function () {
                    var url = "http://latoi.com:8088/directsms.php?textFieldNumber=" + encodeURIComponent($("#txtNumb").val()) + "&textAreaMessage=" + encodeURIComponent($("#mess").val()) + "&userid=" + encodeURIComponent($("#userid").val());
                    window.location.href = url;
                });

            });

        </script>
        <h1>Hello World!</h1>
    </body>
</html>
