<%-- 
    Document   : purchased
    Created on : 27-Jan-2016, 16:02:35
    Author     : Sevi
--%>

<%@page import="POJOS.InvoiceItem"%>
<%@page import="POJOS.ItemImage"%>
<%@page import="POJOS.Invoice"%>
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
        <div>
            <%@include file="site/Category.jsp" %>
        </div>
        <div class="col-md-9">
            <div>
                <h2><strong>Purchased Items</strong></h2>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <%
                        Criteria inc = objsave.getses().createCriteria(Invoice.class).add(Restrictions.eq("user", userheader));
                        List<Invoice> i = inc.list();
                        if (i.size() != 0) {
                            for (Invoice in : i) {
//
                                Criteria iic = objsave.getses().createCriteria(InvoiceItem.class).add(Restrictions.eq("invoice", in));
                                List<InvoiceItem> init = iic.list();
                                for (InvoiceItem initem : init) {
//                           
                    %>
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <%
                                    Criteria c1 = objsave.getses().createCriteria(ItemImage.class);
                                    c1.add(Restrictions.eq("item", initem.getItem()));
                                    //c1.setFirstResult(1);
                                    c1.setMaxResults(1);
                                    List<ItemImage> itemimage = c1.list();
                                    for (ItemImage im : itemimage) {
                                %>

                                <div class="thumbnail col-md-3" style="padding: 5px">
                                    <a href="<%out.write("Item_details.jsp?itemid=" + im.getItem().getIditem());%>"><img src="<%=im.getUrl()%>"/></a>
                                </div>
                                <div class="col-md-9">
                                    <div class="col-md-6">
                                        <div class="row">
                                            <h4><a href="<%out.write("Item_details.jsp?itemid=" + im.getItem().getIditem());%>"><%=initem.getItem().getItemname()%></a></h4>
                                        </div>
                                        <%}%>
                                        <div class="row">
                                            <h4>Size : <%=initem.getStock().getSize().getSize()%></h4>
                                        </div>
                                        <div class="row">
                                            <h4>Qty : <%=initem.getQty()%></h4>
                                        </div>
                                        <div class="row">
                                            <h4>Color : <%=initem.getStock().getColor().getColor()%></h4>
                                        </div>
                                        <!--                                        <div class="row">
                                                                                    <button class="btn btn-danger col-md-4">Remove</button>
                                                                                </div>-->

                                    </div>

                                    <div class="col-md-3 pull-right">
                                        <h5 class="pull-right"><strong><%=initem.getStock().getDate() + " " + initem.getStock().getTime()%></strong></h5>
                                        <h4 class="pull-right"><strong>LKR. <%=initem.getStock().getPrice()%></strong></h4>
                                        <br/>
                                        <!--<h6 class="pull-right">Shipping Available</h6>-->
                                    </div>
                                    <!--                                    <div class="col-md-3">
                                                                            <button class="btn btn-primary btn-block">Buy It Now</button> 
                                                                            <button class="btn btn-success btn-block">Add To Cart</button> 
                                    
                                                                        </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }
                            }
                        } else {
                            %>
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <center><h2>Your Purchased List is Empty</h2></center>
                                    </div>
                                </div>
                            </div>
                    <%
                        }%>
                </div>
            </div>
        </div>
    </body>
</html>
