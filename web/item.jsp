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

        <div>
            <%@include file="site/Category.jsp" %>
        </div>
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-body">
                    <%
                        Cat cat = (Cat) objsave.getses().createCriteria(Cat.class).add(Restrictions.eq("catname", request.getParameter("catname"))).uniqueResult();
                        List<Subcat> sublist = objsave.getses().createCriteria(Subcat.class).add(Restrictions.eq("cat", cat)).list();

                        for (Subcat subli:sublist) {
                    
                    %>
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
                    <%}%>
                </div>
            </div>
        </div>
    </body>
</html>
