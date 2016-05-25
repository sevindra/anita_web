<%-- 
    Document   : customer
    Created on : 24-Dec-2015, 00:49:09
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>JSP Page</title>
        <%
            HttpSession hs = request.getSession();
            POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");
            if (user == null) {
                response.sendRedirect("../site/index.jsp");
            } else {
            }
        %>
    </head>
    <body>
        <div class="col-md-2 mypadin100">
            <a href="sup.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover mybtnselect"><strong>Supplier</strong></button></a> 
            <div class="myPadinTop5"></div>
            <a href="Product.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Product</strong></button></a> 
            <div class="myPadinTop5"></div>
            <a href="Grn.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>GRN</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="grn_return.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>GRN Return</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="store.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Store</strong></button></a>
            <div class="myPadinTop5"></div>
            <button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Settings</strong></button>
            <div class="myPadinTop5"></div>
            <button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Report</strong></button>
        </div>
        <div class=" col-md-8 mypadin100">
            <div class="panel panel-danger">
                <div class="panel-heading"><h3 class="panel-title"><strong>Customer Registration</strong></h3></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                            <strong>First Name :</strong>
                        </div>
                        <div class="col-md-5">
                            <input class="form-control" id="fname" placeholder="First Name">
                        </div>
                        <br>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-md-3">
                            <strong>Last Name :</strong>
                        </div>
                        <div class="col-md-5">
                            <input class="form-control" id="lname" placeholder="Last Name">
                        </div>
                        <br>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-3">
                            <strong>Address :</strong>
                        </div>
                        <div class="col-md-5">
                            <input class="form-control" id="address" placeholder="Address">
                        </div>
                        <br>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-3">
                            <strong>Postal Code :</strong>
                        </div>
                        <div class="col-md-5">
                            <input class="form-control" id="pcode" placeholder="Postal Code">
                        </div>
                        <br>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-3">
                            <strong>Mobile :</strong>
                        </div>
                        <div class="col-md-5">
                            <input class="form-control" id="mobile" placeholder="Mobile No">
                        </div>
                        <br>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-3">
                            <strong>Gender :</strong>
                        </div>
                        <div class="col-md-5 radio">
                            <label>
                                <input type="radio" name="gender" value="male" checked="checked"/> Male
                            </label>
                            <label>
                                <input type="radio" name="gender" value="female" /> Female
                            </label>
                        </div>
                        <br>
                    </div>
                    <br>
                </div>
                <br/>

            </div>
        </div>
        <div class="col-md-2">
            <div class="mypadin100">
                <button type="button" class="btn btn-default myhover" data-toggle="modal" data-target=".bs-example-modal-lg">View Suppliers</button>
            </div>

            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                <div class="modal-dialog modal-lg">
                    <!--<div class="modal-content">-->

                    <div class="panel panel-default mypenalwidth">
                        <div class="panel-heading"><h3 class="panel-title"><strong>Customers </strong></h3></div>
                        <div class="panel-body">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-6">
                                        <div class="form-group input-group">
                                            <input class="form-control" placeholder="Search by Compny Name" type="text"/>
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button"><i class="glyphicon glyphicon-search"></i></button>
                                            </span>
                                        </div>  
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="table-responsive">

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>



                    <!--</div>-->
                </div>
            </div>
        </div>
    </body>
</html>
