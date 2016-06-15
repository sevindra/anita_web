<%-- 
    Document   : foget_password
    Created on : Jun 12, 2016, 7:50:24 AM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>JSP Page</title>
        <script>
            $(function () {
                var error =<%=request.getParameter("error_uid")%>
                if (error == 1) {
                    $('email_alert').show();
                } else {
                    $('.email_alert').hide();

                }
            });
        </script>
    </head>
    <body>

        <div class="col-md-12">
            <div class="text-center">
                <img src="img/anita.ico" style="width: 150px; height:150px"/><label style="font-family: fantasy; font-size: 50px; color: #e60000">ANITA</label>
            </div>
            <form action="check_email">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-success">
                        <div class="panel-body">
                            <h3><strong>Reset your Password</strong></h3>
                            <hr/>
                            <h5>Enter your email or NIC</h5>
                            <input type="text" placeholder="Enter your email or NIC" name="email_or_nic" class="form-control"/>
                            <br/>
                            <div class="alert alert-danger text-center email_alert">
                                <strong> Oops, that's not a match. Try again?</strong>
                            </div>
                            <button class="btn btn-primary btn-block"><strong>Next</strong></button>
                        </div>
                    </div>
                    <div>
                        Having trouble resetting your password?
                        <br/>
                        <a href="login.jsp?reg=1">Register for a new account</a>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
