<%-- 
    Document   : item
    Created on : May 22, 2016, 10:09:33 PM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>Product Details</title>
    </head>
    <body>
        <%@include file="site/header.jsp" %>
        <%@include file="site/Category.jsp" %>
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-body">
                    <%for (int i = 0; i < 3; i++) {
                            for (int j = 0; j < 5; j++) {%>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <a href="#"><img src="adminPanel/men/2015-New-Arrival-Mens-Set-font-b-Men-s-b-font-Commercial-Wedding-font-b-Formal.jpg"/></a>
                            <!--<img src="img/new.png"/>-->
                            <div class="caption">
                                <div class="row">
                                    <div class="col-md-4 col-xs-4">
                                        <h3>T-Shirt</h3>
                                    </div>
                                    <div class="col-md-6 col-xs-6 price pull-right">
                                        <h3>
                                            <label>Rs.1250.00</label></h3>
                                    </div>
                                </div>
                                <p>Medium, 100% Cotton, Hand Wash, Made in Sri Lanka</p>
                                <div class="row">

                                    <div class="col-md-8 col-md-offset-2">
                                        <a href="#" class="btn btn-success buy-btn-width"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <%}
                        }%>
                </div>
            </div>
        </div>
    </body>
</html>
