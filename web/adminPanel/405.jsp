<%-- 
    Document   : 405
    Created on : Jun 10, 2016, 10:13:40 PM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../inc.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="col-md-5 col-sm-5 col-md-offset-4 col-sm-offset-4" style="margin-top: 150px;">
            <div class="error-404">
                <div class="error-code m-b-10 m-t-20">405 <i class="glyphicon glyphicon-warning-sign"></i></div>
                <h2 class="font-bold">Oops 405! Internal Server Error.</h2>

                <div class="error-desc">
                    The server encountered an internal error that prevented it from fulfilling this request. <br/>
                    Try refreshing the page or click the button below to go back to the Homepage.
                    <div><br/>
                        <!-- <a class=" login-detail-panel-button btn" href="http://vultus.de/"> -->
                        <a href="index.jsp" class="btn btn-primary"><span class="glyphicon glyphicon-home"></span> Go back to Homepage</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
