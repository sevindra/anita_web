<%-- 
    Document   : send_email
    Created on : Jun 12, 2016, 10:48:19 PM
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
                <div class=" col-md-8 col-md-offset-2">
                    <div class="panel panel-success">
                        <div class="panel-body">

                            <div class="row text-center">
                                <div class="col-md-2">
                                    <img src="img/check.png" style="margin-top: 10px"/>   
                                </div>
                                <div class="col-md-10">
                                    <h4 style="font-family: fantasy; font-size: 20px;"><strong>We sent an email to sevindra1@gmail.com</strong></h4>

                                    <h5>Follow the instructions in the email to reset your password</h5>
                                </div>
                            </div>
                        </div>
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
