<%-- 
    Document   : settings
    Created on : Dec 15, 2015, 10:13:37 AM
    Author     : Sevi
--%>


<%@page import="POJOS.User"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
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
        <%--<%@include file="../adminPanel/header.jsp" %>--%>
        <title>Settings</title>
    </head>
    <body>

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
        <div class="col-md-2 mypadin100">
            <a href="sup.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Supplier</strong></button></a> 
            <div class="myPadinTop5"></div>
            <a href="Product.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Product</strong></button></a> 
            <div class="myPadinTop5"></div>
            <a href="Grn.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>GRN</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="grn_return.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>GRN Return</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="store.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Store</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="settings.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover mybtnselect"><strong>Settings</strong></button></a>
            <div class="myPadinTop5"></div>
            <button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Report</strong></button>
        </div>
        <div class="col-md-6 col-md-offset-2" style="padding-top: 50px;">
            <div class="panel panel-default">
                <div class="panel-heading"><h3 class="panel-title"><strong>User Registration</strong></h3></div>
                <div class="panel-body">
                    <form method="get" action="../user_save">
                        <div class="row">
                            <div class="col-md-3">
                                First Name :
                            </div>
                            <div class="col-md-7">
                                <input type="text" name="fname" class="form-control" placeholder="First Name">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-3">
                                Last Name :
                            </div>
                            <div class="col-md-7">
                                <input type="text" name="lname" class="form-control" placeholder="Last Name">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-3">
                                User Name :
                            </div>
                            <div class="col-md-7">
                                <input type="text" name="uname" class="form-control" placeholder="User Name">
                            </div>
                        </div>
                        <br>
                        <%                            if (user == null) {
                            } else if (user.getUtype().getUtype().equals("Admin")) {%>
                        <div class="row">
                            <div class="col-md-3">
                                User Type :
                            </div>
                            <div class="col-md-7">
                                <select class="form-control" name="utype">
                                    <%  Criteria c = ses.createCriteria(POJOS.Utype.class);
                                        List<POJOS.Utype> li1 = c.list();
                                        for (POJOS.Utype utype : li1) {
                                    %>
                                    <option value="<%=utype.getIdutype()%>"><%=utype.getUtype()%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <br>

                        <%}%>
                        <div class="row">
                            <div class="col-md-3">
                                Password :
                            </div>
                            <div class="col-md-7">
                                <input type="password" name="pass" class="form-control" placeholder="Password">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-3">
                                Conform Password :
                            </div>
                            <div class="col-md-7">
                                <input type="password" name="cpass" class="form-control" placeholder="Conform Password">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-3">
                                Email :
                            </div>
                            <div class="col-md-7">
                                <input type="email" name="email" class="form-control" placeholder="Email">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-3">
                                Question :
                            </div>
                            <div class="col-md-7">
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
                            <div class="col-md-3">
                                Answer :
                            </div>
                            <div class="col-md-7">
                                <input type="text" name="ans" class="form-control" placeholder="User Name">
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-3">

                            </div>
                            <div class="col-md-7">
                                <%
                                    if (user == null) {
                                    } else if (user.getUtype().getUtype().equals("Admin")) {%>
                                <button class="btn btn-default myBtnwidth150" name="save" value="save">Save</button>
                                <%}%>
                                <button class="btn btn-info">Update</button>
                                <button class="btn btn-danger">Delete</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>

    </body>
</html>
