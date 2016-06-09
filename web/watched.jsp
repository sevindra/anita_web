<%-- 
    Document   : watched
    Created on : 27-Jan-2016, 15:55:34
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>JSP Page</title>
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
    </head>
    <body>
        <div>
            <%@include file="site/header.jsp" %>
        </div>
        <br/>
        <div>
            <%@include file="site/Category.jsp" %>
        </div>
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-body">
                    <%for (int i = 0; i < 1; i++) {
                            for (int j = 0; j < 5; j++) {
                    %>
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="thumbnail col-md-3" style="padding: 5px">
                                    <img src="adminPanel/men/3PCS-LOT-Men-s-wear-short-sleeved-short-man-short-sleeved-s-t-shirts-Brand-N.jpg"/>
                                </div>
                                <div class="col-md-9">
                                    <div class="col-md-6">
                                        <div class="row">
                                            <h4><a>3PCS-LOT-Men-s-wear-short-sleeved-short-man-short-sleeved-s-t-shirts-Brand-N</a></h4>
                                        </div>
                                        <div class="row">
                                            <h4>Size : M</h4>
                                        </div>
                                        <div class="row">
                                            <h4>Qty : 1</h4>
                                        </div>
                                        <div class="row">
                                            <button class="btn btn-danger col-md-4">Remove</button>
                                        </div>

                                    </div>

                                    <div class="col-md-3">
                                        <h4 class="pull-right"><strong>LKR.1250.00</strong></h4>
                                        <br/>
                                        <h6 class="pull-right">Shipping Available</h6>
                                    </div>
                                    <div class="col-md-3">
                                        <button class="btn btn-primary btn-block">Buy It Now</button> 
                                        <button class="btn btn-success btn-block">Add To Cart</button> 

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }%>
                </div>
            </div>
        </div>
    </body>
</html>
