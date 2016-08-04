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
                
                User user=email.getUser();
                hs.setAttribute("user", user);
            %>




            function send_sms() {
                var num1 = document.getElementById('num').value;
                var val = num1.substring(1, 10);
                val = "94" + val;
                var rnum = Math.random();
                rnum = rnum.toString();
                var l = rnum.substring(2, 10);
                var message = "Your Security is: "+l;
                alert(val);
                var url = "http://latoi.com:8088/directsms.php?textFieldNumber=" + encodeURIComponent(val) + "&textAreaMessage=" + encodeURIComponent(message) + "&userid=" + encodeURIComponent(l);
                window.open(url, '_blank', ',toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,left=10000, top=10000, width=10, height=10, visible=none');
    alert("Your Message has been sent!");
    }

            $(document).ready(function () {
                var num1 = document.getElementById('mobile_num').innerHTML;
                var set1 = num1.substring(0, 3);
                var set2 = num1.substring(7, 10);
                //alert(set1 + "****" + set2);
                document.getElementById('mobile_num').innerHTML = set1 + "****" + set2;


            });
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
                                mobile no. Note that you must activate
                                the account by selecting the activation link
                                when you get the email before you can login.
                            </strong>
                        </div>
                        <div class="col-md-6 col-md-offset-3">
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
<script>

</script>
