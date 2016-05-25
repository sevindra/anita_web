<%-- 
    Document   : cus_reg
    Created on : 28-Dec-2015, 12:26:33
    Author     : Sevi
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>Registration</title>
    </head>
    <body>
        <form method="get" action="../user_save">
            <%
                SessionFactory sf = controler.connector.getSessionFactory();
                Session ses = sf.openSession();
            %>
            <%
                HttpSession hs = request.getSession();
                POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");
                if (user == null) {
                    response.sendRedirect("../site/index.jsp");
                } else {
                }
            %>
            <div class="col-md-6 col-md-offset-3" style="padding-top: 50px;">
                <div class="panel panel-default">
                    <div class="panel-heading"><h3 class="panel-title"><strong>Registration</strong></h3></div>
                    <div class="panel-body col-md-offset-1">
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                First Name :
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="fname" class="form-control" placeholder="Enter First Name">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                Last Name :
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="lname" class="form-control" placeholder="Enter Last Name">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                User Name :
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="uname" class="form-control" placeholder="Enter User Name">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                Password :
                            </div>
                            <div class="col-md-8">
                                <input type="password" name="pass" class="form-control" placeholder="Enter Password">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                Conform Password :
                            </div>
                            <div class="col-md-8">
                                <input type="password" name="cpass" class="form-control" placeholder="Enter Conform Password">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                Street Address :
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="stadd" class="form-control" placeholder="Enter City Address">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                City :
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="city" class="form-control" placeholder="Enter City">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                State / Province :
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="state" class="form-control" placeholder="Enter State / Province">
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="Zip" class="form-control" placeholder="ZIP / Postal Code">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                Country :
                            </div>
                            <div class="col-md-8">
                                <select class="form-control">
                                    <option>Sri Lanka</option>
                                    <option>India</option>
                                    <option>New Zeeland</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                Mobile :
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="no" class="form-control" placeholder="Enter Mobile">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                Question :
                            </div>
                            <div class="col-md-8">
                                <select class="form-control" name="qus">
                                    <option>-Select-</option>
                                    <option>my fathers name</option>
                                    <option>my fathers name</option>
                                    <option>my fathers name</option>

                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                Answer :
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="ans" class="form-control" placeholder="Enter User Name">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-4">

                            </div>
                            <div class="col-md-7">
                                <button class="btn btn-primary myBtnwidth150" style="" name="save" value="save">Register</button>

                            </div>
                        </div>
                        <br>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
