<%-- 
    Document   : sup
    Created on : Nov 2, 2015, 12:36:26 AM
    Author     : Sevi
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Criteria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Supplier</title>
        <%@include file="inc.jsp" %>
        <%--<%@include file="header.jsp" %>--%>
        <!--<link href="../MyFiles/adminCss.css" rel="stylesheet">-->
    </head>
    <body>
        <%
            SessionFactory sf = controler.connector.getSessionFactory();
            Session s = sf.openSession();

            HttpSession hs = request.getSession();
            POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");
            if (user == null) {
                response.sendRedirect("../index.jsp");
            } else {
            }
        %>
        <script>
            $(document).on('click', '.add_tb', function () {
                alert($(this).parent().html().val());
            });
        </script>
        <%@include file="../site/header.jsp" %>
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
            <a href="settings.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Settings</strong></button></a>
            <div class="myPadinTop5"></div>
            <button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Report</strong></button>
        </div>
        <div class=" col-md-8 mypadin100">
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
                            <div class="col-md-8">
                                <input class="form-control" required="" id="sname" name="sname" placeholder="Enter Supplier Name"/>    
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-3 mypadin7 myMinWidth50">
                                <label>Company Name</label>   
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" required="" name="cname" placeholder="Enter Company Name"/>    
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
                            <div class="col-md-3">
                                <button  name="btn" value="save" class="btn btn-default form-control"><strong>Save</strong></button>
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-info form-control" name="btn" value="update"><strong>Update</strong></button>
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-danger form-control" name="btn" value="delete"><strong>Delete</strong></button>
                            </div>
                        </div>

                    </form>
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
                        <div class="panel-heading"><h3 class="panel-title"><strong>Suppliers </strong></h3></div>
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
                                        <table class="table table-bordered table-hover table-striped">
                                            <tr>
                                                <th>Supplier Name</th>
                                                <th>Company Name</th>
                                                <th>Contact No 1</th>
                                                <th>Contact No 2</th>
                                                <th>E-mail</th>
                                                <th>Address</th>
                                            </tr>
                                            <% Criteria c2 = s.createCriteria(POJOS.Supplier.class);
                                                
                                                //c2.addOrder(Order.asc("catname"));
                                                List<POJOS.Supplier> li3 = c2.list();
                                                for (POJOS.Supplier supl : li3) {%>
                                            <tr>
                                                <td class="add_tb"><%=supl.getSupname()%></td>
                                                <td class="add_tb"><%=supl.getComname()%></td>
                                                <td class="add_tb"><%=supl.getContact1()%></td>
                                                <td class="add_tb"><%=supl.getContact2()%></td>
                                                <td class="add_tb"><%=supl.getEmail()%></td>
                                                <td class="add_tb"><%=supl.getAddress1() + ", " + supl.getAddress2() + ", " + supl.getAddress3()%></td>
                                            </tr>
                                            <%}%>


                                        </table>
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
