<%-- 
    Document   : reset_password
    Created on : Jun 12, 2016, 12:22:39 PM
    Author     : Sevi
--%>

<%@page import="POJOS.Login"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.User"%>
<%@page import="Src.current_url"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>JSP Page</title>
        <script>


            <%
                HttpSession hs = request.getSession();
                Login email = (Login) hs.getAttribute("login");
                current_url emaill = (current_url) hs.getAttribute("email");

                User user = email.getUser();
                hs.setAttribute("user", user);
            %>
            $(function () {
                $('.email_alert').hide();
                $('.email_alerte').hide();
                $('.code_panel').hide();
                $('#returnhome').hide();
                $('#changepass').hide();
                $('#savebtn').hide();
            });
            function email_alt() {
                $('.email_alert').show();
                $('.code_panel').show();

            }

            var l;
            function send_sms() {
                var num1 = document.getElementById('num').value;
                var val = num1.substring(1, 10);
                val = "94" + val;
            <%
                double d = Math.random();
                int code = (int) (d * 1000000000);
            %>

                l = <%=code%>
                var message = ":     Your Anita Recovery code is: " + l;

                alert(val + " code=" + l);
            <%
                hs.setAttribute("msgcode", code);
            %>
                email_alt();
//                var url = "http://latoi.com:8088/directsms.php?textFieldNumber=" + encodeURIComponent(val) + "&textAreaMessage=" + encodeURIComponent(message) + "&userid=" + encodeURIComponent(l);
//                var i=window.open(url, "_blank");
//                i.setInterval("window.close()",500);
//               alert("Your Message has been sent!");
            }

            $(document).ready(function () {
                var num1 = document.getElementById('mobile_num').innerHTML;
                var set1 = num1.substring(0, 3);
                var set2 = num1.substring(7, 10);
                //alert(set1 + "****" + set2);
                document.getElementById('mobile_num').innerHTML = set1 + "****" + set2;


            });
            var sms_verify_status;
            function verify() {

                var code = document.getElementById('verify_code_tf').value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
//                        alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        alert(xhttp.responseText);
//                        document.getElementById('ajax').innerHTML=xhttp.responseText;
                        sms_verify_status = xhttp.responseText;
                        if (sms_verify_status == "verified") {
                            $('.email_alert').hide();
                            $('.code_panel').hide();
                        }

                    }
                };
                xhttp.open("POST", "verify_smscode?sescode=" + l + "&typecode=" + code, true);
                xhttp.send();
            }

        </script>

    </head>
    <body>
        <input type="hidden" id="num" value="<%=email.getUser().getMobile()%>"/>
        <div class="col-md-12">
            <div class="text-center">
                <img src="img/anita.ico" style="width: 100px; height:100px"/><label style="font-family: fantasy; font-size: 35px;">  Reset Password</label>
            </div>
            <hr/>
            <div class="col-md-8 col-md-offset-2">
                <div class=" col-md-8 col-md-offset-2">
                    <div class="text-center">

                        <div class="row col-md-12">
                            <div class="col-md-5 col-md-offset-1">
                                <a href="send_using_email">
                                    <div class="thumbnail">
                                        <span  style="font-size:5em; color: #666666;" class="glyphicon glyphicon-envelope"></span>
                                        <h3><strong>Get an Email</strong></h3>
                                        <h4>We'll send a Link to</h4>
                                        <h5><%=emaill.getEmail()%></h5>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-5">
                                <a href="#" onclick="send_sms()" id="click_mobile">
                                    <div class="thumbnail">
                                        <span  style="font-size:5em; color: #666666; margin-top: 5px;" class="glyphicon glyphicon-phone"></span>
                                        <h3><strong>Get a Text</strong></h3>
                                        <h4>We'll send a code to</h4>
                                        <h5 id="mobile_num"><%=email.getUser().getMobile()%></h5>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-8 col-md-offset-2 alert alert-info text-center email_alert">
                            <strong>Your recovery Code has been sent to the your
                                mobile no. Please enter the code.
                            </strong>
                        </div>
                        <div class="panel panel-default col-md-6 col-md-offset-3 code_panel">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-3">
                                        <strong>Code:</strong>
                                    </div>
                                    <div class="col-md-9">
                                        <input placeholder="Code" class="form-control" id="verify_code_tf"/>
                                    </div>
                                </div>
                                <br/>
                                <button class="btn btn-primary btn-block" onclick="verify()">Verify</button>
                            </div>
                        </div>
                        <form action="change_password" method="POST">
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
                            <div class="alert alert-success text-center email_alerte">
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
                        <div class="col-md-6 col-md-offset-3 row">
                            Having trouble resetting your password?
                            <a href="login.jsp?reg=1">Register for a new account</a>
                        </div>
                    </div>
                </div>
            </div>
            <br/>

        </div>
    </body>
</html>

