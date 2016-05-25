<%-- 
    Document   : grn_return
    Created on : Dec 16, 2015, 10:31:59 AM
    Author     : Sevi
--%>

<%@page import="org.hibernate.criterion.Order"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>GOODS Return</title>
    </head>
    <body>
        <%
            Session ses = controler.connector.getSessionFactory().openSession();
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
            <a href="grn_return.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover mybtnselect"><strong>GRN Return</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="store.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Store</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="settings.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Settings</strong></button></a>
            <div class="myPadinTop5"></div>
            <button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Report</strong></button>
        </div>
        <div class="mypadin100 col-md-10">
            <form action="../grn_save" method="get">

                <div class="panel panel-danger">
                    <div class="panel-heading"><h3 class="panel-title"><strong>Good Return Note</strong></h3></div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-3">


                                    <div class="col-md-7">
                                        <input class="form-control" name="grnreid" id="grnid" placeholder="G return No"/>


                                    </div>
                                    <div class="col-md-1">
                                        <button class="btn btn-default myhover">Search</button>
                                    </div>

                                </div>


                            </div>
                        </div>
                        <br>
                        <form id="person">
                            <div class="row mypadin7">
                                <div class="col-md-3">
                                    <!--<input class="form-control" id="pname" placeholder="Product Name"/>-->
                                    <select id="pname" class="form-control" onkeypress="return focuscost(event)">
                                        <%
                                            Criteria c1 = ses.createCriteria(POJOS.Item.class);
                                            c1.addOrder(Order.asc("itemname"));
                                            List<POJOS.Item> li2 = c1.list();
                                            for (POJOS.Item item : li2) {
                                        %>
                                        <option value="<%=item.getIditem()%>"><%=item.getItemname()%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <input class="form-control" id="cost" onkeypress="return focusrprice(event)" placeholder="Cost"/>
                                </div>
                                <div class="col-md-2">
                                    <input class="form-control" id="rprice" onkeypress="return focusqty(event)" placeholder="Retail Price"/>
                                </div>
                                <div class="col-md-1">
                                    <input class="form-control" id="qty" onkeypress="return focusdis(event)" placeholder="Qty"/>
                                </div>
                                <div class="col-md-2">
                                    <input class="form-control" id="dis" onkeyup="caltot()" onkeypress="return runScript(event)" placeholder="Discount"/>
                                </div>
                                <div class="col-md-2">
                                    <input class="form-control" id="total" disabled="" placeholder="Total"/>
                                </div>
                            </div>
                        </form>


                        <br>
                        <div class="row mypadin7">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <div id="tab">
                                        <table id="list" class="table table-bordered table-hover table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Stock ID</th>
                                                    <th>Itemcode</th>
                                                    <th style="width: 350px;">Description</th>
                                                    <th>Cost</th>
                                                    <th>Retail Price</th>
                                                    <th>Qty</th>
                                                    <th>Discount</th>
                                                    <th>Total</th>
                                                    <th>Remove</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-2 mypadin7" style="width: 130px;">
                                    Total Amount :
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" disabled="" name="totalam" id="totalam" placeholder=""/>
                                </div>
                                <div class="col-md-1 mypadin7" style="width: 120px;">
                                    Cash :
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" id="cash" name="cash" onkeyup="balance()" placeholder=""/>
                                </div>

                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-2 mypadin7" style="width: 130px;">
                                    Total Discount :
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" id="totdis" onkeyup="caltotall()" placeholder=""/>
                                </div>
                                <div class="col-md-1 mypadin7" style="width: 120px;">
                                    Balance :
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" disabled="" name="bal" id="bal" placeholder=""/>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-2 mypadin7" style="width: 130px;">
                                    Net Amount :
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" disabled="" id="netam" placeholder=""/>
                                </div>
                                <div class="col-md-1 mypadin7" style="width: 120px;">
                                    Dis Amount :
                                </div>
                                <div class="col-md-3">
                                    <input class="form-control" disabled="" id="disam" placeholder=""/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div style="height: 53px;">

                            </div>
                            <div>
                                <button class="btn btn-default myBtnwidth150">Del Return Note</button>

                            </div>
                            <br>
                            <div>
                                <button class="btn btn-default myBtnwidth150">Clear Table</button>
                                <button class="btn btn-default myBtnwidth150">Print</button>
                            </div>
                        </div>
                        <div style="height: 53px;">

                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-default myBtnwidth150 mysavebtnsize">Save/Print</button>
                        </div>

                    </div>
                </div>
            </form>                  
        </div>
    </body>
</html>
