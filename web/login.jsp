<%-- 
    Document   : admin
    Created on : Nov 1, 2015, 10:05:25 PM
    Author     : Sevi
--%>

<%@page import="POJOS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>Login</title>
        <script>
            $(document).ready(function () {
                $("#mypwmatch").hide();
                $('#incomplete').hide();
                $("input[type=password]").keyup(function () {
                    if ($("#regpassword").val().toString() == $("#cpass").val().toString()) {
                        $("#pwmatch").removeClass("glyphicon-remove");
                        $("#pwmatch").addClass("glyphicon-ok");
                        $("#pwmatch").css("color", "#00A41E");
                        $("#mypwmatch").show();
                        $("#disreg").removeAttr("disabled");
                    } else {
                        $("#disreg").attr("disabled", "disabled");
                        $("#pwmatch").removeClass("glyphicon-ok");
                        $("#pwmatch").addClass("glyphicon-remove");
                        $("#pwmatch").css("color", "#FF0004");
                        $("#mypwmatch").show();
                    }
                });


                var reg = "<%=request.getParameter("reg")%>";
                var error_data = "<%=request.getParameter("error_data")%>";
                var verify_email = "<%=request.getParameter("verify_email")%>";
                $('#gotohome').hide();
                $('#invliedEmail').hide();
                $('#checkEmail').hide();
                if (reg == 1) {
                    $('#register-form').click();
                    $(this).addClass('active');
                    $('#login-form-link').removeClass('active');
                    $('#login-form').hide();
                    $('#register-form').show();
                    //$('#invliedEmail').show();
                }
                if (reg == 2) {
                    $('#invliedEmail').show();

                }
                if (reg == 3) {
                    $('#regbtn').hide();
                    $('#gotohome').show();

                }
                if (error_data == 3) {
                    $('#incomplete').show();

                }
                if (verify_email == 3) {
                    $('#checkEmail').show();
                }

                $('.alert-autocloseable-danger').hide();
                var res = "<%=request.getParameter("error_login")%>";
                if (res == 1) {
                    $('#autoclosable-btn-danger').prop("disabled", true);
                    $('.alert-autocloseable-danger').show();

                    $('.alert-autocloseable-danger').delay(3000).fadeOut("slow", function () {
                        // Animation complete.
                        $('#autoclosable-btn-danger').prop("disabled", false);
                    });
                }
                    $('#acdeact').hide();
                if (res == 6) {
                    $('#acdeact').show();
 
                }




                $(document).on('click', '.close', function () {
                    $(this).parent().hide();
                });
            });
            $(function () {
                $('#login-form-link').click(function (e) {
                    $("#login-form").delay(100).fadeIn(100);
                    $("#register-form").fadeOut(100);
                    $('#register-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });
                $('#register-form-link').click(function (e) {
                    $("#register-form").delay(100).fadeIn(100);
                    $("#login-form").fadeOut(100);
                    $('#login-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });

            });

            
        </script>
    </head>
    <body>
        <div class="text-center">
            <img src="img/anita.ico" style="width: 100px; height:100px"/><label style="font-family: fantasy; font-size: 35px;">  Anita Designer Wear</label>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-5">
                                    <a href="#" class="active"  id="login-form-link">Login</a>
                                </div>
                                <div class="col-xs-5">
                                    <a href="#" id="register-form-link">Register</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="login-form" action="user_login" method="post" role="form" style="display: block;">
                                        <div class="form-group">
                                            <input type="email" required="" name="email" id="email" tabindex="1" class="form-control" placeholder="E-mail">
                                        </div>
                                        <div class="alert alert-danger text-center" id="invliedEmail">
                                            <strong>Invalid Email Address</strong>
                                        </div>
                                        <div class="form-group password">
                                            <!--<input type="password" id="password" placeholder="password">-->
                                            <input type="password" required="" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
                                        </div>
                                        <div class="alert alert-danger alert-autocloseable-danger text-center">
                                            <strong>Wrong Email or Password</strong>
                                        </div>
                                        <div class="alert alert-danger" id="acdeact">
                                            <center>
                                                <strong>Your Account has Been Deactivated</strong>
                                            </center>
                                        </div>
<!--                                        <div class="form-group text-center">
                                            <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                            <label for="remember"> Remember Me</label>
                                        </div>-->
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="text-center">
                                                        <a href="foget_password.jsp" tabindex="5" class="forgot-password">Forgot Password?</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                    <form id="register-form" action="cus_reg" role="form" style="display: none;">

                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" required="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="password" name="password" id="regpassword" tabindex="2" class="form-control" placeholder="Password" required="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="password" name="cpassword" id="cpass" tabindex="3" class="form-control" placeholder="Confirm Password" required="">

                                                <div id="mypwmatch"><span id="pwmatch" class="glyphicon glyphicon-remove" style="color:#FF0004;"></span> Passwords Match</div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="text" name="fname" id="fname" tabindex="4" class="form-control" placeholder="First Name" required="">
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" name="lname" id="lname" tabindex="5" class="form-control" placeholder="Last Name" required="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="text" name="mobile" id="mobile" tabindex="6" class="form-control" placeholder="(07) Mobile No" required="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="alert alert-info alert-autocloseable-register text-center" id="checkEmail">
                                            <center>
                                                <strong>
                                                    Your account has been created and an
                                                    activation link has been sent to the email address
                                                    you entered. Note that you must activate
                                                    the account by selecting the activation link
                                                    when you get the email before you can login.
                                                </strong>
                                            </center>
                                        </div>
                                        
                                        <div class="alert alert-danger text-center" id="incomplete">
                                            <strong>Incomplete Data</strong>
                                        </div>
                                        <br/>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3" id="regbtn">
                                                    <!--<input type="submit" name="register-submit" id="register-submit" tabindex="5" class="form-control btn btn-register" value="Register">-->
                                                    <button type="submit" name="register-submit" class="btn btn-register form-control" value="register" id="disreg"><span class="glyphicon glyphicon-user"></span><label> REGISTER</label></button>
                                                </div>
                                                <div class="col-sm-6 col-sm-offset-3" id="gotohome">
                                                    <center>
                                                        <!--<input type="submit" name="register-submit" id="register-submit" tabindex="5" class="form-control btn btn-register" value="Register">-->
                                                        <a href="index.jsp" class="btn btn-info btn-block" id="myhome"><span class="glyphicon glyphicon-home"></span><label> Home</label></a>
                                                        <a href="login.jsp?reg=1">Reload</a>
                                                    </center>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
