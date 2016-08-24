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
                    // window.location.href = url;
                    //window.location.href = url;

                    window.setTimeOut("window.close();",100);

                    //meken blank window ekaka open karaganna puluwan....
                    //myWindow=window.open(url, "_blank", "width=200, height=100 ,resizable=no,visible=no");
                    window.open(url, '_blank', ',toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,left=10000, top=10000, width=10, height=10, visible=none');
//                    myWindow = window.open(url, "myWindow", "width=200, height=100");//alert("Are you sure sendthis\nMessage?");
                    
// window.setTimeOut("window.close()", 10);
                   // window.setTimeOut(window.close(),10);
                    //myWindow.focus();
                    //myWindow.blur();
                    //myWindow.close();

                    //var http = new XMLHttpRequest();
                    //http.open("", url, true);

                    //meken blank tab ekaka open karaganna puluwan....
                    //window.open(url,'_blank','');
                    //window.close();
                    
                    location.reload();
                });
                    

            });

        </script>
        <h1>Hello World!</h1>
    </body>
</html>
