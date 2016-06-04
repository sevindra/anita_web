<%-- 
    Document   : delete_lak
    Created on : Jun 4, 2016, 10:14:20 AM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../adminPanel/inc.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="col-md-2">

            </div>
            <div class="col-md-8">
                <div class="panel panel-primary">
                    <div class="panel-heading"><strong>Registration</strong></div>
                    <div class="panel-body">
                        <div class="col-md-2">

                        </div>   
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-3"><label>Name : </label></div>
                                <div class="col-md-9"><input type="text" placeholder="Name" class="form-control"/></div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-3"><label>Age : </label></div>
                                <div class="col-md-9"><input type="text" placeholder="Age" class="form-control"/></div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-3"><label>Nic : </label></div>
                                <div class="col-md-9"><input type="text" placeholder="Nic" class="form-control"/></div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-3"><label>Mobile : </label></div>
                                <div class="col-md-9"><input type="text" placeholder="Mobile" class="form-control"/></div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-3"><label>Password : </label></div>
                                <div class="col-md-9"><input type="password" placeholder="Password" class="form-control"/></div>
                            </div>
                            <br/>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="thumbnail" style="position: relative">
                            <img src="../adminPanel/men/2015-New-Arrival-Mens-Set-font-b-Men-s-b-font-Commercial-Wedding-font-b-Formal.jpg"/>
                            <img src="../img/new.png" style="position: absolute; right: 0px;top: 0;"/>

                        </div>
                        <div class="col-md-6">
                            <h3>T-Shirt</h3>
                        </div>
                        <div class="col-md-6 price pull-right">
                            <h3><label>Rs.1250.00</label></h3>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <p style="text-align: justify">Medium, 100% Cotton, Hand Wash, Made in Sri Lanka</p>
                                <div class="col-md-6">
                                    <button class="btn btn-primary btn-block"><strong>Add To Cart</strong></button>
                                </div>
                                <div class="col-md-6">
                                    <button class="btn btn-success btn-block"><strong>Buy</strong></button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        
    </body>
</html>
