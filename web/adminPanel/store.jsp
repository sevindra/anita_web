<%-- 
    Document   : store
    Created on : 18-Dec-2015, 23:27:27
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>Store</title>
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
            <a href="sup.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Supplier</strong></button></a> 
            <div class="myPadinTop5"></div>
            <a href="Product.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Product</strong></button></a> 
            <div class="myPadinTop5"></div>
            <a href="Grn.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>GRN</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="grn_return.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>GRN Return</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="store.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover mybtnselect"><strong>Store</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="settings.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Settings</strong></button></a>
            <div class="myPadinTop5"></div>
            <button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Report</strong></button>
        </div>
        <div class=" col-md-10 mypadintop60">
            <div class="row">
                <div class="col-md-2">
                    <center>
                        <label>Inserted of Date :</label>
                        <input type="date" name="indate" class="form-control">
                        <label>To</label>
                        <input type="date" name="todate" class="form-control">
                    </center>
                </div>
                <div class="col-md-1" style="padding-top: 25px;">
                    <button class="btn btn-default">Search</button>
                </div>
                <div class="col-md-1" style="padding-top: 30px; text-align: right">
                    <label>Qty</label>
                </div>
                <div class="col-md-2" style="padding-top: 25px">
                    <input type="text" class="form-control" name="qty">
                    <input type="radio" name="qty" value="greater"/>  <label> Greater</label>
                    <input type="radio" name="qty" value="lesser" style="padding-left: 10px"/>  <label> Lesser</label>
                    <br>
                    <input type="radio" name="qty" value="exact" /> <label> Exact</label>
                </div>
                <div class="col-md-1" style="padding-top: 25px">
                    <button class="btn btn-default">Search</button>
                </div>
                <div class="col-md-1" style="padding-top: 30px">
                    <label>Product :</label>
                    <br>
                    <br>
                    <label>Supplier :</label>
                </div>
                <div class="col-md-2" style="padding-top: 25px">
                    <select class="form-control">
                        <option>product name</option>
                        <option>product name</option>
                        <option>product name</option>
                    </select>
                    <br>
                    <select class="form-control">
                        <option>Supplier name</option>
                        <option>Supplier name</option>
                        <option>Supplier name</option>
                        <option>Supplier name</option>
                    </select>
                </div>
                <div class="col-md-1" style="padding-top: 25px">
                    <button class="btn btn-default">Search</button>
                </div>
            </div>
            <br>
            <div style="display: block; max-height: 300px; overflow: hidden; overflow-y: scroll;">
                <table class="table table-responsive table-bordered table-hover table-striped">
                    <tr>
                        <th>Grn id</th>
                        <th>Item id</th>
                        <th>Cat Name</th>
                        <th>Sub Cat Name</th>
                        <th style="width: 275px;">Item Name</th>
                        <th style="width: 150px;">Supplier</th>
                        <th>Cost</th>
                        <th>Qty</th>
                        <th>Retail Price</th>
                        <th>Whole sale</th>

                    </tr>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
