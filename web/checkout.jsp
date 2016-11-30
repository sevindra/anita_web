<%-- 
    Document   : checkout
    Created on : Nov 22, 2016, 1:43:06 AM
    Author     : Sevi
--%>

<%@page import="POJOS.ItemImage"%>
<%@page import="POJOS.Item"%>
<%@page import="java.util.HashMap"%>
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
        <br/>
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-body">
                    <%
                        if (request.getSession().getAttribute("sessionCart") != null) {

                            HashMap<String, Object> sessionCart = (HashMap<String, Object>) request.getSession().getAttribute("sessionCart");
                            double total1 = 0;
                            for (String key : sessionCart.keySet()) {
                                Item p = (Item) objsave.getses().load(Item.class, Integer.parseInt(key));
                        //total1 += (p.getPrice * (Integer.parseInt(sessionCart.get(key))));
                    %>
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="thumbnail col-md-2" style="padding: 5px">
                                    <%
                                        Criteria c1 = objsave.getses().createCriteria(ItemImage.class);
                                        c1.add(Restrictions.eq("item", p));
                                        //c1.setFirstResult(1);
                                        c1.setMaxResults(1);
                                        List<ItemImage> itemimage = c1.list();
                                        for (ItemImage i : itemimage) {
                                    %>
                                    <a href="<%out.write("Item_details.jsp?itemid=" + p.getIditem());%>"><img src="<%=i.getUrl()%>"/></a>
                                        <%}%>
                                </div>

                                <div class="col-md-6">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <h4><a href="<%out.write("Item_details.jsp?itemid=" + p.getIditem());%>"><%=p.getItemname()%></a></h4>
                                        </div>
                                        <div class="row">
                                            <h4><strong>Color : </strong></h4>
                                            <h4><strong>Size : </strong></h4>
                                        </div>


                                    </div>

                                </div>
                                <div class="col-md-2">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <h5>Quantity:</h5> 
                                        </div>
                                        <div class="col-md-7">
                                            <input type="text" class="text-center form-control" value="<%=sessionCart.get(key)%>"/>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <h4 class="pull-right"><strong>LKR.1250.00</strong></h4>
                                    <br/>
                                    <h6 class="pull-right">Shipping Available</h6>
                                    <div class="row">
                                        <button class="btn btn-danger btn-block">Remove</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}
                        }else{%>
                        <div class="col-md-10 col-md-offset-1">

                        <h2><strong>Your shopping cart is empty</strong></h2>
                        
                    </div>

                    <%}%>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3><strong>Order Summary</strong></h3>
                    <div style="border: solid #999999 1px"></div>
                    <h3><strong>Total: LKR.283.49</strong></h3>
                    <button class="btn btn-success btn-block" onclick="goBack()"><strong>Continue Shopping</strong></button>
                    <button class="btn btn-primary btn-block"><strong>Proceed to checkout</strong></button>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row col-md-12">
                <div class="col-md-9">
                    <div class="col-md-7 panel panel-default pull-right">
                        <div class="panel-body text-right">
                            <div class="row" style="margin-right: 15px">
                                <h5>Subtotal (2 items): LKR.2500.00</h5>
                            </div>
                            <div style="border: solid 1px #999999"></div>
                            <div class="row" style="margin-right: 15px">
                                <h3><strong>Total: US $471.86</strong></h3>
                            </div>
                            <div style="border: solid 1px #999999"></div>
                        </div>
                        <div class="col-md-10 col-md-offset-2" style="margin-bottom: 20px">
                            <div class="col-md-6">
                                <button class="btn btn-success btn-block" onclick="goBack()"><strong>Continue Shopping</strong></button>
                            </div>
                            <div class="col-md-6">
                                <button class="btn btn-primary btn-block"><strong>Proceed to checkout</strong></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="site/footer.jsp" %>
    </body>
</html>
