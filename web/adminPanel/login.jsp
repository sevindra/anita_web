<%-- 
    Document   : admin
    Created on : Nov 1, 2015, 10:05:25 PM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../adminPanel/inc.jsp" %>
        <title>Login</title>
        <script>
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
        <div class="container mypadin50">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-5">
                                    <a href="#" class="active" id="login-form-link">Login</a>
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
                                    <form id="login-form" action="http://phpoll.com/login/process" method="post" role="form" style="display: block;">
                                        <div class="form-group">
                                            <input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
                                        </div>
                                        <div class="form-group text-center">
                                            <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                            <label for="remember"> Remember Me</label>
                                        </div>
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
                                                        <a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <form id="register-form" action="http://phpoll.com/register/process" method="post" role="form" style="display: none;">

                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="email" name="reemail" id="reemail" tabindex="2" class="form-control" placeholder="Confirm Email Address" value="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="password" name="password" id="password" tabindex="3" class="form-control" placeholder="Password">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="text" name="fname" id="fname" tabindex="3" class="form-control" placeholder="First Name" value="">
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" name="lname" id="lname" tabindex="3" class="form-control" placeholder="Last Name" value="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="text" name="mobile" id="mobile" tabindex="3" class="form-control" placeholder="(+94) Mobile No" value="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="register-submit" id="register-submit" tabindex="5" class="form-control btn btn-register" value="Register">
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
