<%-- 
    Document   : reset_password
    Created on : Jun 12, 2016, 12:22:39 PM
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
        <div class="col-md-12">
            <div class="text-center">
                <img src="img/anita.ico" style="width: 100px; height:100px"/><label style="font-family: fantasy; font-size: 35px;">  Reset Password</label>
            </div>
            <hr/>
            <div class="col-md-8 col-md-offset-2">
                <div class=" col-md-4 col-md-offset-4">
                    <div class="text-center">
                        <a href="#"><div class="thumbnail">
                                <span  style="font-size:5em; color: #666666" class="glyphicon glyphicon-envelope"></span>
                                <h3><strong>Get an email</strong></h3>
                                <h4>We'll send a Link to</h4>
                                <h5>sevindra@gmail.com</h5>
                            </div></a>
                    </div>
                    <div>
                        Having trouble resetting your password?
                        <a href="login.jsp?reg=1">Register for a new account</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
