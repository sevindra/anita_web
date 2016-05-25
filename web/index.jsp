<%-- 
    Document   : index
    Created on : 30-Dec-2015, 22:36:26
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@include file="inc.jsp" %>
        <!-- Start WOWSlider.com HEAD section -->
        <link rel="stylesheet" type="text/css" href="engine1/style.css" />
        <script type="text/javascript" src="engine1/jquery.js"></script>
        <!-- End WOWSlider.com HEAD section -->
        <title>Anita Designer wear</title>
        <script>




            $(function () {
                $('#login-form-link').click(function (e) {
                    $("#login-form").delay(100).fadeIn(100);
                    $("#register-form").fadeOut(100);
                    $('#register-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });
                $('#register-form-link').click(function (e) {
                    $("#register-form").delay(100).fadeIn(100);
                    $("#login-form").fadeOut(100);
                    $('#login-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });

            });
            $(document).ready(function () {


                $(".dropdown").hover(
                        function () {
                            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideDown("400");
                            $(this).toggleClass('open');
                        },
                        function () {
                            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideUp("400");
                            $(this).toggleClass('open');
                        }
                );
                //page to top
                $(window).scroll(function () {
                    if ($(this).scrollTop() > 50) {
                        $('#back-to-top').fadeIn();
                    } else {
                        $('#back-to-top').fadeOut();
                    }
                });
                // scroll body to 0px on click
                $('#back-to-top').click(function () {

//                    $('#back-to-top').tooltip('hide');
                    $('body,html').animate({
                        scrollTop: 0
                    }, 800);
                    return false;
                });

                $('#back-to-top').tooltip('show');

                $('#back-to-top').tooltip('show');


            });
            //item slider
            $('#media').carousel({
                pause: true,
                interval: false,
            });




            <%
                HttpSession hs = request.getSession();
                POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");

            %>

            function loginfirst() {

            <%                        if (user == null) {%>////
                alert("Please Login First!");
                ////    <%}%>

            }



        </script>
    </head>
    <body>

        <div class="container">
            <nav class="navbar navbar-default navbar-fixed-top" style="max-height: 50px">
                <div class="navbar-header">
                    <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                </div>

                <div class="collapse navbar-collapse js-navbar-collapse">
                    <img src="img/anita.ico" style="width: 50px; height: 40px; float: left; padding-top: 3px; min-height: 50px; padding-left: 5px">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Shop <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a id="watch" onclick="loginfirst()" href="<%if (user != null) {%>adminPanel/watched.jsp<%}%>">New Products</a></li>
                                <li><a onclick="loginfirst()" href="<%if (user != null) {%>adminPanel/purchased.jsp<%}%>">Products</a></li>
                                <li><a onclick="loginfirst()" href="<%if (user != null) {%>adminPanel/purchased.jsp<%}%>">Checkout</a></li>
                                <li><a onclick="loginfirst()" href="<%if (user != null) {%>adminPanel/purchased.jsp<%}%>">Cart</a></li>
                                <li><a href="<%if (user != null) {%>#<%}%>" data-toggle="modal" data-target="<%if (user == null) {%>.bs-example-modal-cat<%}%>"><%if (user != null) {%><a href="logout">Logout</a><%} else {%>Login<%}%></a></li>
                                <li class="divider"></li>
                                <li><a onclick="loginfirst()" href="<%if (user != null) {%>adminPanel/purchased.jsp<%}%>">Watched Items</a></li>
                                <li><a onclick="loginfirst()" href="<%if (user != null) {%>adminPanel/purchased.jsp<%}%>">Purchase</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Men <span class="caret"></span></a>				
                            <ul class="dropdown-menu">
                                <li class="col-sm-3">
                                <li> <a href="#"> Shirt </a> </li>
                                <li> <a href="#"> T-Shirt </a> </li>
                                <li> <a href="#"> Short </a> </li>
                                <li> <a href="#"> Trousers </a> </li>
                                <li> <a href="#"> Denims </a> </li>
                                <li> <a href="#"> Shoes </a> </li>
                            </ul>

                        </li>
                        <li class="dropdown mega-dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Women <span class="caret"></span></a>				
                            <ul class="dropdown-menu">
                                <li class="col-sm-3">
                                <li> <a href="#"> Blouses </a> </li>
                                <li> <a href="#"> T-Shirts </a> </li>
                                <li> <a href="#"> Frocks </a> </li>
                                <li> <a href="#"> Trousers </a> </li>
                                <li> <a href="#"> Denims </a> </li>
                                <li> <a href="#"> Shoes </a> </li>
                            </ul>

                        </li>
                        <li><a href="Contact.jsp"><span></span>Contact</a></li>
                    </ul>				




                    <div class="col-md-4 col-md-offset-1" style="padding-top: 7px">
                        <div class="form-group input-group">

                            <input class="form-control" placeholder="Search" type="text"/>
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><i class="glyphicon glyphicon-search"></i></button>
                            </span>
                        </div>
                    </div>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">               <!--data-toggle="dropdown"-->
                            <a href="#" class="dropdown-toggle" role="button" aria-expanded="false"  data-toggle="modal" data-target="<%if (user == null) {%>.bs-example-modal-cat<%}%>" id="user" value="<%if (user != null) {
                                    out.write(user.getIduser());
                                } else {
                                    out.write("Login");
                                }%>">Hi <%
                                    if (user != null) {
                                        out.write(user.getUname());
                                    } else {
                                        out.write("Login");
                                    }%> <span class="caret"></span></a>
                                <%
                                    if (user != null) {%>
                            <ul class="dropdown-menu" role="menu">

                                <%
                                    if (user.getUtype().getUtype().equals("Admin")) {%>

                                <li><a href="adminPanel/sup.jsp">Admin Panel</a></li>
                                    <%}%>
                                <li><a href="logout">Logout</a></li>
                            </ul>  
                            <%}%>
                        </li>
                        <a></a>
                        <!--<li><a href="#" class="glyphicon glyphicon-envelope"></a></li>-->
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                                    class="glyphicon glyphicon-envelope" style="margin-right: 5px"></span>Inbox<span class="label label-info" style="margin-left: 5px">32</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#"><span class="label label-warning">4:00 AM</span>Favourites Snippet</a></li>
                                <li><a href="#"><span class="label label-warning">4:30 AM</span>Email marketing</a></li>
                                <li><a href="#"><span class="label label-warning">5:00 AM</span>Subscriber focused email
                                        design</a></li>
                                <li class="divider"></li>
                                <li><a href="#" class="text-center">View All</a></li>
                            </ul>
                        </li>
                        <li><a href="#"><span  class="glyphicon glyphicon-shopping-cart" style="margin-right: 5px"></span>Cart<span class="label label-warning" style="margin-right:  10px;margin-left: 5px">2</span></a>

                        </li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </nav>
        </div>
        <!--<button type="button" class="btn btn-default myhover myBtnwidth150" data-toggle="modal" data-target=".bs-example-modal-cat">Add Sub Category</button>-->

        <div class="modal fade bs-example-modal-cat" data-remodal-id="loginid" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog mymodlewidth900">
                <!--<div class="modal-content">-->





                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-login">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-5">
                                    <a href="#" class="active" id="login-form-link">Login</a>
                                </div>
                                <div class="col-xs-5">
                                    <a href="#" id="register-form-link">Register</a>
                                </div>
                            </div>
                            <hr>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form id="login-form" action="user_login" method="post" role="form" style="display: block;">
                                        <div class="form-group">
                                            <input type="text" required="" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
                                        </div>
                                        <div class="form-group password">
                                            <!--<input type="password" id="password" placeholder="password">-->
                                            <input type="password" required="" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
                                        </div>
                                        <div class="form-group text-center">
                                            <input type="checkbox" tabindex="3" class="" name="remember" id="remember">
                                            <label for="remember"> Remember Me</label>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="text-center">
                                                        <a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </form>
                                    <form id="register-form" action="http://phpoll.com/register/process" method="post" role="form" style="display: none;">

                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="email" name="reemail" id="reemail" tabindex="2" class="form-control" placeholder="Confirm Email Address" value="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="password" name="password" id="password" tabindex="3" class="form-control" placeholder="Password">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input type="text" name="fname" id="fname" tabindex="3" class="form-control" placeholder="First Name" value="">
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" name="lname" id="lname" tabindex="3" class="form-control" placeholder="Last Name" value="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="text" name="mobile" id="mobile" tabindex="3" class="form-control" placeholder="(+94) Mobile No" value="">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-sm-6 col-sm-offset-3">
                                                    <input type="submit" name="register-submit" id="register-submit" tabindex="5" class="form-control btn btn-register" value="Register">
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>






                <!--</div>-->
            </div>
        </div>
        <!-- Start WOWSlider.com BODY section -->
        <div id="wowslider-container1" style="padding-top: 50px">
            <div class="ws_images"><ul>
                    <li><img src="data1/images/madmenbbbanner.jpg" alt="" title="" id="wows1_0"/></li>
                    <li><img src="data1/images/04.jpg" alt="" title="" id="wows1_1"/></li>
                    <li><img src="data1/images/01.jpg" alt="" title="" id="wows1_2"/></li>
                    <li><img src="data1/images/men_page_banner2.jpg" alt="" title="" id="wows1_3"/></li>
                    <li><img src="data1/images/02.jpg" alt="" title="" id="wows1_4"/></li>
                    <li><a href="http://wowslider.com"><img src="data1/images/mensclothingbanner1.jpg" alt="bootstrap carousel" title="" id="wows1_5"/></a></li>
                    <li><img src="data1/images/03.jpg" alt="" title="" id="wows1_6"/></li>
                </ul></div>
            <div class="ws_bullets"><div>
                    <a href="#" title=""><span><img src="data1/tooltips/madmenbbbanner.jpg" alt=""/>1</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/04.jpg" alt=""/>2</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/01.jpg" alt=""/>3</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/men_page_banner2.jpg" alt=""/>4</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/02.jpg" alt=""/>5</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/mensclothingbanner1.jpg" alt=""/>6</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/03.jpg" alt=""/>7</span></a>
                </div></div><div class="ws_script" style="position:absolute;left:-99%"><a href="http://wowslider.com">wowslider.com</a> by WOWSlider.com v8.7</div>
            <div class="ws_shadow"></div>
        </div>	
        <script type="text/javascript" src="engine1/wowslider.js"></script>
        <script type="text/javascript" src="engine1/script.js"></script>
        <!-- End WOWSlider.com BODY section -->
        <%--<%@include file="../MyFiles/footer.jsp" %>--%>
        <div class="container">
            <br>
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading text-center"><h3 class="panel-title"><strong style="color: #d03d25">Features Items</strong></h3></div>
                    <div class="panel-body">
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
                                                            <div>
                                                                <img alt="" src="adminPanel/men/3PCS-LOT-Men-s-wear-short-sleeved-short-man-short-sleeved-s-t-shirts-Brand-N.jpg" class="img-responsive" style="margin-top: 0px; float: left;" >
                                                                <img alt="" src="img/new.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>

                                                            </div>

                                                            <div class="caption">
                                                                <div class="row">
                                                                    <div class="col-md-4 col-xs-4">
                                                                        <h3>T-Shirt</h3>
                                                                    </div>
                                                                    <div class="col-md-6 col-xs-6 price">
                                                                        <h3
                                                                            <label>Rs.1250.00</label></h3>
                                                                    </div>
                                                                </div>
                                                                <p>Medium, 100% Cotton, Hand Wash, Made in Sri Lanka</p>
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-shopping-cart"></span>Add To Cart</a> 
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>

                                                                <p> </p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Women</span></h4>-->
                                                            <div>
                                                                <img alt="" src="adminPanel/men/2015-New-Arrival-Mens-Set-font-b-Men-s-b-font-Commercial-Wedding-font-b-Formal.jpg" class="img-responsive" style="margin-top: 0px; float: left;">
                                                                <img alt="" src="img/sale.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>

                                                            </div>
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
                                                                        <a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>

                                                                <p> </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Kids</span></h4>-->
                                                            <div>
                                                                <img src="adminPanel/men/Mens-Casual-Clothing-Styles3.jpg" class="img-responsive" style="margin-top: 0px; float: left;">
                                                                <img alt="" src="img/sale.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>

                                                            </div>
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
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>

                                                                <p> </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Men1</span></h4>-->
                                                            <div>
                                                                <img src="adminPanel/men/Mens-Colored-Suits-2015-New-Arrival-Casual-Blazer-Masculino-Korean-Style-Mens-Stage-Wear-Slim-Fit.jpg"  class="img-responsive" style="margin-top: 0px; float: left;">
                                                                <img alt="" src="img/new.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            </div>
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
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>

                                                                <p> </p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Women1</span></h4>-->
                                                            <div>
                                                                <img src="adminPanel/men/Mens.Style_.Inspiration.Spring.Sweater.Denim_.Jacket.1.4.jpg" class="img-responsive" style="margin-top: 0px; float: left;">
                                                                <img alt="" src="img/sale.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            </div>
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
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>

                                                                <p> </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Kids1</span></h4>-->
                                                            <div>
                                                                <img src="adminPanel/men/dapper-look-streetstyle-men.jpg" class="img-responsive" style="margin-top: 0px; float: left;">
                                                                <img alt="" src="img/new.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            </div>
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
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>

                                                                <p> </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Men2</span></h4>-->
                                                            <div>
                                                                <img src="adminPanel/men/dazzio-black-plain-men-party-wear-shirt-dzsh11.jpg" class="img-responsive" style="margin-top: 0px; float: left;">
                                                                <img alt="" src="img/sale.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            </div>
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
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>

                                                                <p> </p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Women2</span></h4>-->
                                                            <div>
                                                                <img src="adminPanel/men/dazzio-grey-plain-men-party-wear-shirt-dzsh2.jpg"  class="img-responsive" style="margin-top: 0px; float: left;">
                                                                <img alt="" src="img/new.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            </div>
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
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>

                                                                <p> </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 col-md-4">
                                                        <div class="thumbnail" >
                                                            <!--<h4 class="text-center"><span class="label label-info">Kids2</span></h4>-->
                                                            <div>
                                                                <img src="adminPanel/men/dazzio-purple-plain-men-party-wear-shirt-dzsh27.jpg" class="img-responsive" style="margin-top: 0px; float: left;">
                                                                <img alt="" src="img/new.png" style="float: right; width: 40px; height: 40px; margin-top:-175px;"/>
                                                            </div>
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
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <a class="btn btn-primary btn-product"><span class="glyphicon glyphicon-thumbs-up"></span> Like</a> 
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <a href="#" class="btn btn-success btn-product"><span class="glyphicon glyphicon-shopping-cart"></span> Buy</a></div>
                                                                </div>

                                                                <p> </p>
                                                            </div>
                                                        </div>
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
                    </div>
                </div>
            </div>
        </div>

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

        <footer>
            <div class="footer" id="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                            <h3> My Account </h3>
                            <ul>
                                <li> <a href="#"> Watched Items </a> </li>
                                <li> <a href="#"> Purchase </a> </li>
                                <li> <a href="<%if (user != null) {%>#<%}%>" data-toggle="modal" data-target="<%if (user == null) {%>.bs-example-modal-cat<%}%>"><%if (user != null) {%><a href="../logout">Logout</a><%} else {%>Login<%}%></a> </li>

                            </ul>
                        </div>
                        <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                            <h3> Men </h3>
                            <ul>
                                <li> <a href="#"> Shirt </a> </li>
                                <li> <a href="#"> T-Shirt </a> </li>
                                <li> <a href="#"> Short </a> </li>
                                <li> <a href="#"> Trousers </a> </li>
                            </ul>
                        </div>
                        <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                            <h3> Women </h3>
                            <ul>
                                <li> <a href="#"> Top wear </a> </li>
                                <li> <a href="#"> Skirt </a> </li>
                                <li> <a href="#"> Office wear </a> </li>
                                <li> <a href="#"> Pant </a> </li>
                            </ul>
                        </div>
                        <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                            <h3> Kids </h3>
                            <ul>
                                <li> <a href="#"> Shirt </a> </li>
                                <li> <a href="#"> Short </a> </li>
                                <li> <a href="#"> Shoes </a> </li>
                                <li> <a href="#"> Toys </a> </li>
                            </ul>
                        </div>
                        <div class="col-lg-3  col-md-3 col-sm-6 col-xs-12 ">
                            <h3> Social </h3>
                            <!--                            <ul>
                                                            <li>
                                                                <div class="input-append newsletter-box text-center">
                                                                    <input type="text" class="full text-center form-control" placeholder="Email ">
                                                                    <button class="btn  bg-gray" type="button"> Lorem ipsum <i class="fa fa-long-arrow-right"> </i> </button>
                                                                </div>
                                                            </li>
                                                        </ul>-->
                            <ul class="social">
                                <li> <a href="www.facebook.com"> <i class=" fa fa-facebook">   </i> </a> </li>
                                <li> <a href="www.twitter.com"> <i class="fa fa-twitter">   </i> </a> </li>
                                <li> <a href="#"> <i class="fa fa-google-plus">   </i> </a> </li>
                                <li> <a href="www.youtube.com"> <i class="fa fa-youtube">   </i> </a> </li>
                            </ul>
                        </div>
                    </div>
                    <!--/.row--> 
                </div>
                <!--/.container--> 
            </div>
            <!--/.footer-->

            <div class="footer-bottom">
                <div class="container">
                    <p class="pull-left"> Copyright © Cygnetic IT 2016. All right reserved. </p> 

                    <a id="back-to-top" href="#" class="btn btn-danger btn-lg back-to-top pull-right" role="button" title="Click to return on the top page" data-toggle="tooltip" data-placement="left" style="margin-left: 50px"><span class="glyphicon glyphicon-chevron-up"></span></a>
                    <div class="pull-right">
                        <ul class="nav nav-pills payments">
                            <li><i class="fa fa-cc-visa"></i></li>
                            <li><i class="fa fa-cc-mastercard"></i></li>
                            <li><i class="fa fa-cc-amex"></i></li>
                            <li><i class="fa fa-cc-paypal"></i></li>
                        </ul> 
                    </div>
                </div>
            </div>
            <!--/.footer-bottom--> 
        </footer>



    </body>
</html>
