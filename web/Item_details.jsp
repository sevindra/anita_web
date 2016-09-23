<%-- 
    Document   : Item_details
    Created on : May 27, 2016, 9:19:03 AM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <script>
            var color;
            var size;
            $(function () {
                $('.color').hide();
                $('.size').hide();

            });
            function sizecolor() {
                color = $('.color_val').val();
                size = $('.size_val').val();
                if (color == "-Select-") {
                    $('.color').show();
                }else{
                    $('.color').hide();
                    
                }
                if (size == "-Select-") {
                    $('.size').show();
                }else{
                    
                    $('.size').hide();
                }
            }
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


            });

            jQuery(document).ready(function ($) {

                $('#myCarousel').carousel({
                    interval: 5000
                });

                //Handles the carousel thumbnails
                $('[id^=carousel-selector-]').click(function () {
                    var id_selector = $(this).attr("id");
                    try {
                        var id = /-(\d+)$/.exec(id_selector)[1];
                        console.log(id_selector, id);
                        jQuery('#myCarousel').carousel(parseInt(id));
                    } catch (e) {
                        console.log('Regex failed!', e);
                    }
                });
                // When the carousel slides, auto update the text
                $('#myCarousel').on('slid.bs.carousel', function (e) {
                    var id = $('.item.active').data('slide-number');
                    $('#carousel-text').html($('#slide-content-' + id).html());
                });
            });

            <%
                HttpSession hs = request.getSession();
                POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");

            %>


            function loginfirst() {

            <%                        if (user == null) {%>////
                alert("Please Login First !");
                ////    <%}%>

            }


        </script>
        <title>Item Name</title>
    </head>
    <body>
        <%@include file="site/header.jsp" %>

        <div class="col-md-12">
            <div class="row">
                <div class="col-md-5">
                    <div class="col-md-12" id="slider">
                        <!-- Top part of the slider -->
                        <div class="row">
                            <div class="col-md-12" id="carousel-bounding-box">
                                <div class="carousel slide" id="myCarousel">
                                    <!-- Carousel items -->
                                    <div class="carousel-inner">
                                        <div class="active item" data-slide-number="0">
                                            <img src="img/470x480&text=zero.png"></div>

                                        <div class="item" data-slide-number="1">
                                            <img src="img/470x480&text=1.png"></div>

                                        <div class="item" data-slide-number="2">
                                            <img src="img/470x480&text=2.png"></div>

                                        <div class="item" data-slide-number="3">
                                            <img src="img/470x480&text=3.png"></div>


                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="row">
                        <h3>My Item Name</h3>
                        <div style="border: solid 1px #cccccc"></div>  
                    </div>
                    <div class="col-md-7">
                        <br/>
                        <div class="row">
                            <div class="col-md-3 text-right">
                                <h5>Color : </h5> 
                            </div>
                            <div class="col-md-9">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <select class="form-control color_val" onchange="sizecolor()">
                                            <option>-Select-</option>
                                            <option>Black</option>
                                            <option>White</option>
                                            <option>Red</option>
                                            <option>Blue</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 text-right">

                            </div>
                            <div class="col-md-9">
                                <div class="col-md-10 color">
                                    <span class="glyphicon glyphicon-remove-sign myred"></span><strong class="myred">Please select color</strong>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 text-right">
                                <h5>Size : </h5> 
                            </div>
                            <div class="col-md-9">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <select class="form-control size_val" onchange="sizecolor()">
                                            <option>-Select-</option>
                                            <option>S</option>
                                            <option>M</option>
                                            <option>L</option>
                                            <option>XL</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 text-right">

                            </div>
                            <div class="col-md-9">
                                <div class="col-md-10 size">
                                    <span class="glyphicon glyphicon-remove-sign myred"></span><strong class="myred">Please select size</strong>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 text-right">
                                <h5>Qty : </h5> 
                            </div>
                            <div class="col-md-9">
                                <div class="col-md-4">
                                    <input type="text" placeholder="Qty" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="well">
                                <div class="row">
                                    <div class="col-md-3 text-right">
                                        <h5>Price : </h5>
                                    </div> 
                                    <div class="col-md-4">
                                        <h4><strong>LKR.1250.00</strong></h4>
                                    </div>
                                    <div class="col-md-4">
                                        <button class="btn btn-primary form-control" onclick="sizecolor()">Buy It Now</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 text-right">

                                    </div> 
                                    <div class="col-md-4">
                                        <h5>1 Watching</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <button class="btn btn-success form-control" onclick="sizecolor()">Add To Cart</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 text-right">

                                    </div> 
                                    <div class="col-md-4">

                                    </div>
                                    <div class="col-md-5">
                                        <a href="#"><h6><span class="glyphicon glyphicon-eye-open"></span>Add to watch list</h6></a>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1">
                                        <h5><strong>Description</strong></h5>
                                        Medium, 100% Cotton, Hand Wash, Made in Sri Lanka
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 text-right">
                                <h5>Shipping : </h5> 
                            </div>
                            <div class="col-md-9">
                                <h5>Island Wide Shipping</h5>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-md-3 text-right">
                                <h5>Delivery : </h5> 
                            </div>
                            <div class="col-md-9">
                                <h5>Estimated between <strong> Jun. 15 and Jun. 30</strong></h5>
                                <h6 style="color: #666666">Ships within 2 days after receiving cleared payment</h6>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-md-3 text-right">
                                <h5>Payments : </h5> 
                            </div>
                            <div class="col-md-9">
                                <!--<span class="fa fa-spinner fa-spin "></span>-->
                                <h5><strong>Visa,Master Card,American Express</strong></h5>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <div class="col-md-5">
                        <div class="panel panel-default">
                            <div class="panel-body text-center" style="height: 500px">
                                advertisement
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="col-md-5" style="margin-top: 20px">
                <div class='row' style="text-align: center">

                    <div class="" style="width: 20%;display: inline-block">
                        <a class="thumbnail" id="carousel-selector-0"><img src="img/470x480&text=zero.png"></a>
                    </div>          
                    <div class="" style="width: 20%;display: inline-block">
                        <a class="thumbnail" id="carousel-selector-1"><img src="img/470x480&text=1.png"></a>
                    </div>
                    <div class="" style="width: 20%;display: inline-block">
                        <a class="thumbnail" id="carousel-selector-2"><img src="img/470x480&text=2.png"></a>
                    </div>
                    <div class="" style="width: 20%;display: inline-block">
                        <a class="thumbnail" id="carousel-selector-3"><img src="img/470x480&text=3.png"></a>
                    </div>


                </div>
            </div>
        </div>
        <%@include file="site/footer.jsp" %>
    </body>
</html>
