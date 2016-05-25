<%-- 
    Document   : sider_after_delete
    Created on : May 14, 2016, 4:18:51 PM
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
        <h1>Hello World!</h1>
        <div class="col-md-12">
                            <div class="container">
                                <div class='row'>
                                    <div class='col-md-10' style="padding-left: 150px">
                                        <div class="carousel slide media-carousel" id="media">
                                            <div class="carousel-inner">
                                                <div class="item  active">
                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Men</span></h4>-->

                                                            <img alt="" src="../adminPanel/men/3PCS-LOT-Men-s-wear-short-sleeved-short-man-short-sleeved-s-t-shirts-Brand-N.jpg"  class="img-responsive" style="margin-top: 0px; float: left;">
                                                            <img alt="" src="../img/new.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>


                                                            <div class="caption">
                                                                <div class="row">
                                                                    <div class="col-md-4 col-xs-4">
                                                                        <h3>T-Shirt</h3>
                                                                    </div>
                                                                    <div class="col-md-6 col-xs-6 price">
                                                                        <h3>
                                                                            <label>Rs.1250.00</label></h3>
                                                                    </div>
                                                                </div>
                                                                <p>Medium, 100% Cotton, Hand Wash, Made in Sri Lanka</p>
                                                                <div class="row" style="float: none; margin: 0 auto">
                                                                    <div class="col-md-6">
                                                                        <!--<a class="btn btn-primary btn-product" id="autoclosaautoclosable-btn-success"><span class="glyphicon glyphicon-arrow-down"></span> Add Cart</a>--> 
                                                                        <button class="btn btn-primary btn-product autoclosable-btn-success"><span class="glyphicon glyphicon-arrow-down"></span> Add Cart</button>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Women</span></h4>-->
                                                            <img alt="" src="../adminPanel/men/2015-New-Arrival-Mens-Set-font-b-Men-s-b-font-Commercial-Wedding-font-b-Formal.jpg" style="margin-top: 0px; float: left;">
                                                            <img alt="" src="../img/sale.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>

                                                            <div class="caption">
                                                                <div class="row">
                                                                    <div class="col-md-4 col-xs-4">
                                                                        <h3>Blazer</h3>
                                                                    </div>
                                                                    <div class="col-md-6 col-xs-6 price">
                                                                        <h3>
                                                                            <label>Rs.11000.00</label></h3>
                                                                    </div>
                                                                </div>
                                                                <p>Medium, Dry Clean, Made in Sri Lanka</p>
                                                                <div class="row" style="float: none; margin: 0 auto">
                                                                    <div class="col-md-6">
                                                                        <button class="btn btn-primary btn-product autoclosable-btn-success"><span class="glyphicon glyphicon-arrow-down"></span> Add Cart</button>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Kids</span></h4>-->
                                                            <img src="../adminPanel/men/Mens-Casual-Clothing-Styles3.jpg" class="img-responsive" style="margin-top: 0px; float: left;">
                                                            <img alt="" src="../img/new.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            <div class="caption">
                                                                <div class="row">
                                                                    <div class="col-md-4 col-xs-4">
                                                                        <h3>Casual</h3>
                                                                    </div>
                                                                    <div class="col-md-6 col-xs-6 price">
                                                                        <h3>
                                                                            <label>Rs.1500.00</label></h3>
                                                                    </div>
                                                                </div>
                                                                <p>Medium, Hand wash, Made in Sri Lanka</p>
                                                                <div class="row" style="float: none; margin: 0 auto">
                                                                    <div class="col-md-6">
                                                                        <button class="btn btn-primary btn-product autoclosable-btn-success"><span class="glyphicon glyphicon-arrow-down"></span> Add Cart</button> 
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Men1</span></h4>-->
                                                            <img src="../adminPanel/men/Mens-Colored-Suits-2015-New-Arrival-Casual-Blazer-Masculino-Korean-Style-Mens-Stage-Wear-Slim-Fit.jpg"  class="img-responsive" style="margin-top: 0px; float: left;">
                                                            <img alt="" src="../img/sale.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            <div class="caption">
                                                                <div class="row">
                                                                    <div class="col-md-6 col-xs-6">
                                                                        <h3>Galaxy S5</h3>
                                                                    </div>
                                                                    <div class="col-md-6 col-xs-6 price">
                                                                        <h3>
                                                                            <label>$649.99</label></h3>
                                                                    </div>
                                                                </div>
                                                                <p>32GB, 2GB Ram, 1080HD, 5.1 inches, Android</p>
                                                                <div class="row" style="float: none; margin: 0 auto">
                                                                    <div class="col-md-6">
                                                                        <button class="btn btn-primary btn-product autoclosable-btn-success"><span class="glyphicon glyphicon-arrow-down"></span> Add Cart</button>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Women1</span></h4>-->
                                                            <img src="../adminPanel/men/Mens.Style_.Inspiration.Spring.Sweater.Denim_.Jacket.1.4.jpg" class="img-responsive" style="margin-top: 0px; float: left;">
                                                            <img alt="" src="../img/new.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            <div class="caption">
                                                                <div class="row">
                                                                    <div class="col-md-6 col-xs-6">
                                                                        <h3>iPhone 6</h3>
                                                                    </div>
                                                                    <div class="col-md-6 col-xs-6 price">
                                                                        <h3>
                                                                            <label>$749.99</label></h3>
                                                                    </div>
                                                                </div>
                                                                <p>32GB, 64Bit, 1080HD, 4.7 inches, iOS 8</p>
                                                                <div class="row" style="float: none; margin: 0 auto">
                                                                    <div class="col-md-6">
                                                                        <button class="btn btn-primary btn-product autoclosable-btn-success"><span class="glyphicon glyphicon-arrow-down"></span> Add Cart</button>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Kids1</span></h4>-->
                                                            <img src="../adminPanel/men/dapper-look-streetstyle-men.jpg" class="img-responsive" style="margin-top: 0px; float: left;">
                                                            <img alt="" src="../img/new.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            <div class="caption">
                                                                <div class="row">
                                                                    <div class="col-md-6 col-xs-6">
                                                                        <h3>Lumia 1520</h3>
                                                                    </div>
                                                                    <div class="col-md-6 col-xs-6 price">
                                                                        <h3>
                                                                            <label>$749.00</label></h3>
                                                                    </div>
                                                                </div>
                                                                <p>32GB, 4GB Ram, 1080HD, 6.3 inches, WP 8</p>
                                                                <div class="row" style="float: none; margin: 0 auto">
                                                                    <div class="col-md-6">
                                                                        <button class="btn btn-primary btn-product autoclosable-btn-success"><span class="glyphicon glyphicon-arrow-down"></span> Add Cart</button>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Men2</span></h4>-->
                                                            <img src="../adminPanel/men/dazzio-black-plain-men-party-wear-shirt-dzsh11.jpg" class="img-responsive" style="margin-top: 0px; float: left;">
                                                            <img alt="" src="../img/sale.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            <div class="caption">
                                                                <div class="row">
                                                                    <div class="col-md-6 col-xs-6">
                                                                        <h3>Galaxy S5</h3>
                                                                    </div>
                                                                    <div class="col-md-6 col-xs-6 price">
                                                                        <h3>
                                                                            <label>$649.99</label></h3>
                                                                    </div>
                                                                </div>
                                                                <p>32GB, 2GB Ram, 1080HD, 5.1 inches, Android</p>
                                                                <div class="row" style="float: none; margin: 0 auto">
                                                                    <div class="col-md-6">
                                                                        <button class="btn btn-primary btn-product autoclosable-btn-success"><span class="glyphicon glyphicon-arrow-down"></span> Add Cart</button>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Women2</span></h4>-->
                                                            <img src="../adminPanel/men/dazzio-grey-plain-men-party-wear-shirt-dzsh2.jpg"  class="img-responsive" style="margin-top: 0px; float: left;">
                                                            <img alt="" src="../img/sale.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            <div class="caption">
                                                                <div class="row">
                                                                    <div class="col-md-6 col-xs-6">
                                                                        <h3>iPhone 6</h3>
                                                                    </div>
                                                                    <div class="col-md-6 col-xs-6 price">
                                                                        <h3>
                                                                            <label>$749.99</label></h3>
                                                                    </div>
                                                                </div>
                                                                <p>32GB, 64Bit, 1080HD, 4.7 inches, iOS 8</p>
                                                                <div class="row" style="float: none; margin: 0 auto">
                                                                    <div class="col-md-6">
                                                                        <button class="btn btn-primary btn-product autoclosable-btn-success"><span class="glyphicon glyphicon-arrow-down"></span> Add Cart</button>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Kids2</span></h4>-->
                                                            <img src="../adminPanel/men/dazzio-purple-plain-men-party-wear-shirt-dzsh27.jpg" class="img-responsive" style="margin-top: 0px; float: left;">
                                                            <img alt="" src="../img/new.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            <div class="caption">
                                                                <div class="row">
                                                                    <div class="col-md-6 col-xs-6">
                                                                        <h3>Lumia 1520</h3>
                                                                    </div>
                                                                    <div class="col-md-6 col-xs-6 price">
                                                                        <h3>
                                                                            <label>$749.00</label></h3>
                                                                    </div>
                                                                </div>
                                                                <p>32GB, 4GB Ram, 1080HD, 6.3 inches, WP 8</p>
                                                                <div class="row" style="float: none; margin: 0 auto">
                                                                    <div class="col-md-6">
                                                                        <button class="btn btn-primary btn-product autoclosable-btn-success"><span class="glyphicon glyphicon-arrow-down"></span> Add Cart</button>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4 col-md-offset-4">
                                                <div style="float: none; margin: 0 auto; margin-top: 10px; text-align: center;">
                                                    <div class="alert alert-success alert-autocloseable-success" style="max-height: 100px; ">
                                                        Added Ur Cart
                                                    </div>
                                                </div>
                                            </div>
                                            <a data-slide="prev" href="#media" class="left carousel-control" style="margin-top: 225px">‹</a>
                                            <a data-slide="next" href="#media" class="right carousel-control" style="margin-top: 225px">›</a>
                                        </div>                          
                                    </div>
                                </div>
                            </div>


                        </div>
    </body>
</html>
