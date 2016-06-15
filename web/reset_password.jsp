<%-- 
    Document   : reset_password
    Created on : Jun 12, 2016, 12:22:39 PM
    Author     : Sevi
--%>

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
                current_url email = (current_url) hs.getAttribute("email");
                
                Session ses= controler.connector.getSessionFactory().openSession();
                Criteria cr = ses.createCriteria(POJOS.User.class);
            cr.add(Restrictions.eq("email", email.getEmail()));
                User user= (User) cr.uniqueResult();
            %>
        </script>
    </head>
    <body>
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
                                        <span  style="font-size:5em; color: #666666" class="glyphicon glyphicon-envelope"></span>
                                        <h3><strong>Get an email</strong></h3>
                                        <h4>We'll send a Link to</h4>
                                        <h5><%=email.getEmail()%></h5>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-5">
                                <a href="anita_send_sms.jsp">
                                    <div class="thumbnail">
                                        <span  style="font-size:5em; color: #666666" class="glyphicon glyphicon-phone"></span>
                                        <h3><strong>Get an Mobile</strong></h3>
                                        <h4>We'll send a code to</h4>
                                        <h5><%=user.getMobile() %></h5>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <div>
                Having trouble resetting your password?
                <a href="login.jsp?reg=1">Register for a new account</a>
            </div>
        </div>
    </body>
</html>
