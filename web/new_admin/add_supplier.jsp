<%-- 
    Document   : supplier
    Created on : Jun 18, 2016, 9:35:56 AM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>Supplier</title>
        <%@include file="../my_main_script.jsp" %>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="admin_side_panel.jsp" %>
        <div class="col-md-9">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-danger">
                    <div class="panel-heading"><h3 class="panel-title"><strong>Supplier Details</strong></h3></div>
                    <div class="panel-body">
                        <form method="get" action="../sup_save">
                            <!--                    <div class="row">
                                                    <div class="col-md-3 mypadin7 col">
                                                        Supplier ID  
                                                    </div>
                                                    <div class="col-md-5">
                                                        <input class="form-control" placeholder="Enter Supplier ID"/>    
                                                    </div>
                                                </div>-->
                            <br/>
                            <div class="row">
                                <div class="col-md-3 mypadin7">
                                    <label>Supplier Name </label>  
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control" required="" id="sname" name="sname" placeholder="Enter Supplier Name"/>    
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-default btn-block">Search</button>
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-3 mypadin7 myMinWidth50">
                                    <label>Company Name</label>   
                                </div>
                                <div class="col-md-6">
                                    <input class="form-control" required="" name="cname" placeholder="Enter Company Name"/>    
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-default btn-block">Search</button>
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-3 mypadin7">
                                    <label>Contact No</label>
                                </div>
                                <div class="col-md-4">
                                    <input class="form-control" required="" name="cno1" placeholder="Enter Contact No 1"/>
                                </div>
                                <div class="col-md-4">
                                    <input class="form-control" name="cno2" placeholder="Enter Contact No 2"/>
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-3 mypadin7">
                                    <label>E-Mail</label>
                                </div>
                                <div class="col-md-6">
                                    <input type="email" required="" class="form-control" name="email" placeholder="Enter E-Mail"/>
                                </div>

                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-3 mypadin7">
                                    <label>Address</label>
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" name="add1" required="" placeholder="Address line 1"/>
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" name="add2" required="" placeholder="Address line 2"/>
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" name="add3" required="" placeholder="Address line 3"/>
                                </div>
                            </div>
                            <br/>
                            <div class="row">
                                <div class="col-md-3 mypadin7">

                                </div>
                                <div class="col-md-3 pull-right">
                                    <button  name="btn" value="save" class="btn btn-default form-control"><strong>Save</strong></button>
                                </div>
                                <div class="col-md-3 pull-right">
                                    <button class="btn btn-info form-control" name="btn" value="update"><strong>Update</strong></button>
                                </div>
                            </div>

                        </form>
                    </div>
                    <br/>

                </div>
            </div>
        </div>
    </body>
</html>
