<%-- 
    Document   : index
    Created on : 30-Dec-2015, 22:36:26
    Author     : Sevi
--%>

<%@page import="Src.current_url"%>
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
            <%
                String uri = request.getScheme() + "://"
                        + request.getServerName()
                        + ("http".equals(request.getScheme()) && request.getServerPort() == 80 || "https".equals(request.getScheme()) && request.getServerPort() == 443 ? "" : ":" + request.getServerPort())
                        + request.getRequestURI()
                        + (request.getQueryString() != null ? "?" + request.getQueryString() : "");
                current_url url = new current_url();
                url.setUrl(uri);
                System.out.print("this current ur- " + uri);
                HttpSession currurl = request.getSession();
                currurl.setAttribute("currenturl", uri);

            %>
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





            <%                HttpSession hs = request.getSession();
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

        <%@include file="site/header.jsp" %>
        <!-- Start WOWSlider.com BODY section -->
        <div id="wowslider-container1">
            <div class="ws_images"><ul>
                    <li><img src="data1/images/madmenbbbanner.jpg" alt="" title="" id="wows1_0"/></li>
                    <li><img src="data1/images/04.jpg" alt="" title="" id="wows1_1"/></li>
                    <li><img src="data1/images/01.jpg" alt="" title="" id="wows1_2"/></li>
                    <li><img src="data1/images/men_page_banner2.jpg" alt="" title="" id="wows1_3"/></li>
                    <li><img src="data1/images/02.jpg" alt="" title="" id="wows1_4"/></li>
                    <li><a href="#"><img src="data1/images/mensclothingbanner1.jpg" alt="bootstrap carousel" title="" id="wows1_5"/></a></li>
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
                </div></div><div class="ws_script" style="position:absolute;left:-99%"></div>
            <div class="ws_shadow"></div>
        </div>	
        <script type="text/javascript" src="engine1/wowslider.js"></script>
        <script type="text/javascript" src="engine1/script.js"></script>
        <!-- End WOWSlider.com BODY section -->

        <br/>
        <div class="container-fluid">
            <div class="row">
                <%@include file="site/Category.jsp" %>

                <div class="col-md-9">
                    <!--                    <div class="panel panel-default">
                                            <div class="panel-body">-->
                    <%for (int i = 0; i < 3; i++) {
                            for (int j = 0; j < 3; j++) {%>
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="thumbnail" style="position: relative">
                                    <a href="Item_details.jsp"><img src="adminPanel/men/2015-New-Arrival-Mens-Set-font-b-Men-s-b-font-Commercial-Wedding-font-b-Formal.jpg"/></a>
                                    <img src="img/new.png" style="position: absolute; right: 0px;top: 0;"/>

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
                                        <div class="col-md-8 col-md-offset-2">
                                            <a class="btn btn-success btn-block" href="Item_details.jsp"><strong>View</strong></a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%}
                        }%>
                    <!--                        </div>
                                        </div>-->
                </div>
            </div>
        </div>    



        <%@include file="site/footer.jsp" %>
        <script>
            $(document).ready(function () {


                $(".bs-example-modal-cat").modal();


            });
        </script>

    </body>
</html>
