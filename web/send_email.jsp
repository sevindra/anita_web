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
        <script>
            $(function () {
                var pcode =<%=request.getParameter("code")%>
                var update =<%=request.getParameter("update")%>
            <%
                HttpSession hs = request.getSession();

            %>
                var code =<%=hs.getAttribute("mycode")%>
                $('.change_password').hide();
                $('.email_alert').hide();
                $('#returnhome').hide();

                if (pcode == code) {
                    $('.register_new').hide();
                    $('.change_password').show();
                } else {

                    $('.change_password').hide();
                    if (update == 753951) {
                        $('#change_pass').hide();
                        $('.change_password').show();
                        $('.email_alert').show();
                        $('#returnhome').show();
                        $('#savebtn').hide();

                    }
                }
            });
        </script>
    </head>
    <body>
        <div class="col-md-12">
            <div class="text-center">
                <img src="img/anita.ico" style="width: 100px; height:100px"/><label style="font-family: fantasy; font-size: 35px;">  Reset Password</label>
            </div>
            <hr/>
            <div class="row">
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

                    </div>
                </div>
            </div>
            <div class="row col-md-8 col-md-offset-2 change_password">
                <div class="my-div-center">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <form action="change_password" method="get">
                                <div id="changepass">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h5><strong>New Password</strong></h5>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="password" class="form-control" placeholder="New Password" id="pass" name="pass"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h5><strong>Conform Password</strong></h5>
                                        </div>
                                        <div class="col-md-8">
                                            <input type="password" class="form-control" placeholder="Conform Password" id="cpass" name="cpass"/>
                                        </div>
                                    </div>
                                </div>
                                <br/>
                                <div class="alert alert-success text-center email_alert">
                                    <strong>Successfuly! Password has been changed.</strong>
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col-md-4">

                                    </div>
                                    <div class="col-md-8">
                                        <button class="btn btn-primary pull-right" name="save" value="pwsave" id="savebtn"><strong>Save</strong></button>
                                        <a class="btn btn-primary pull-right" name="save" href="index.jsp" id="returnhome"><strong>Return to Home</strong></a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row register_new">
                Having trouble resetting your password?
                <a href="login.jsp?reg=1">Register for a new account</a>
            </div>
        </div>
    </body>
</html>
