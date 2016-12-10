<%-- 
    Document   : cart
    Created on : Jun 6, 2016, 2:02:09 PM
    Author     : Sevi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="POJOS.Size"%>
<%@page import="POJOS.Color"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.ItemImage"%>
<%@page import="POJOS.Stock"%>
<%@page import="POJOS.Item"%>
<%@page import="java.util.HashMap"%>
<%@page import="POJOS.CartItem"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.User"%>
<%@page import="POJOS.Cart"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Src.objsave"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Src.current_url"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>Cart</title>
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





            <%                HttpSession hs = request.getSession();
                POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");

            %>

            function loginfirst() {

            <%                        if (user == null) {%>////
                alert("Please Login First !");
                ////    <%}%>

            }



        </script>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </head>
    <body>
        <div>
            <%@include file="site/header.jsp" %>
        </div>
        <%-- 
    Document   : Category
    Created on : May 22, 2016, 10:46:11 PM
    Author     : Sevi
--%>

        <div class="col-md-3">
            <div class="my-div-center my-text-center">
                <label class="category-size">Categories</label>
            </div>
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-plus">
                                </span>Men</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body side-panel">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="item.jsp">Shirt</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="item.jsp">T-Shirt</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <a href="item.jsp">Short</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="item.jsp">Trousers</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <a href="item.jsp">Denim</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="item.jsp">Shoes</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-plus">
                                </span>Women</a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body side-panel">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="item.jsp">Blouses</a> <span class="label label-success">$ 320</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="item.jsp">T-Shirts</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="item.jsp">Frocks</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="item.jsp">Trousers</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="item.jsp">Denims</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="item.jsp">Shoes</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-plus">
                                </span>Kids</a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body side-panel">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="item.jsp">T-shirts</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="item.jsp">Trousers</a> <span class="label label-info">5</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="item.jsp">Shorts</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="item.jsp">Frocks</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="item.jsp">Baby Shoes</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><span class="glyphicon glyphicon-plus">
                                </span>Toys</a>
                        </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body side-panel">
                            <table class="table">
                                <tr>
                                    <td>
                                       <a href="item.jsp">Boy</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <a href="item.jsp">Girl</a>
                                    </td>
                                </tr>
                                
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive"><span class="glyphicon glyphicon-plus">
                                </span>Bags</a>
                        </h4>
                    </div>
                    <div id="collapseFive" class="panel-collapse collapse">
                        <div class="panel-body side-panel">
                            <table class="table">
                                <tr>
                                    <td>
                                       <a href="item.jsp">Sales</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <a href="item.jsp">Customers</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <a href="item.jsp">Products</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <a href="item.jsp">Shopping Cart</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseSix"><span class="glyphicon glyphicon-plus">
                                </span>Shoes</a>
                        </h4>
                    </div>
                    <div id="collapseSix" class="panel-collapse collapse">
                        <div class="panel-body side-panel">
                            <table class="table">
                                <tr>
                                    <td>
                                       <a href="item.jsp">Sales</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <a href="item.jsp">Customers</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <a href="item.jsp">Products</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <a href="item.jsp">Shopping Cart</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="site/footer.jsp" %>
    </body>
</html>

