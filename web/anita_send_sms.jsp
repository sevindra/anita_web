<%-- 
    Document   : anita_send_sms
    Created on : Jun 14, 2016, 6:09:29 PM
    Author     : Sevi
--%>

<%@page import="POJOS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            double d = Math.random();
            int code = (int) (d * 1000000000);
            int newcode = (int) (d * 100000);
            String scode = "Your Security code is :- " + code;
            HttpSession hs = request.getSession();
            User user = (User) hs.getAttribute("user_obj");
        %>

        <!--<h1>Hello World!</h1>-->
        <input type="hidden" id="txtNumb" value="94714066566"/>
        <input type="hidden" id="mess" value="<%=scode%>"/>
        <input type="hidden" id="userid" value="<%=newcode%>"/>
        <!--<input type="button" id="btnQueryString" value="Send" />-->
        <script type="text/javascript">
            $(function () {

                var url = "http://latoi.com:8088/directsms.php?textFieldNumber=" + encodeURIComponent($("#txtNumb").val()) + "&textAreaMessage=" + encodeURIComponent($("#mess").val()) + "&userid=" + encodeURIComponent($("#userid").val());
                // window.location.href = url;
                //window.location.href = url;

                //window.setTimeOut("window.close();",100);

                //meken blank window ekaka open karaganna puluwan....
                //myWindow=window.open(url, "_blank", "width=200, height=100 ,resizable=no,visible=no");
                window.open(url, '_blank', ',toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,left=10000, top=10000, width=10, height=10, visible=none', '');
                alert("Are you sure sendthis\nMessage?");
                window.setTimeOut("window.close();", 100);
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
//            $(function () {
//                $("#btnQueryString").bind("click", function () {
//                    var url = "http://latoi.com:8088/directsms.php?textFieldNumber=" + encodeURIComponent($("#txtNumb").val()) + "&textAreaMessage=" + encodeURIComponent($("#mess").val()) + "&userid=" + encodeURIComponent($("#userid").val());
//                    window.location.href = url;
//                });
//
//            });

        </script>
    </body>
</html>
