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
            $(document).ready(function () {

                $('.alert-autocloseable-danger').hide();
            });
                function checkcart() {
                    $('#autoclosable-btn-danger').prop("disabled", true);
                    $('.alert-autocloseable-danger').show();

                    $('.alert-autocloseable-danger').delay(3000).fadeOut("slow", function () {
                        // Animation complete.
                        $('#autoclosable-btn-danger').prop("disabled", false);
                    });
                }

                 function rem_cart_item(x) {
                  var cart_item_id=x;
                var xhttp = new XMLHttpRequest();
                        xhttp.onreadystatechange = function () {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
//                        alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                        //alert(xhttp.responseText+" "+x);
                                document.getElementById('cart_items').innerHTML = xhttp.responseText;
                        }
                        };
                        xhttp.open("POST", "remove_cart_item?cart=ok&id="+x, true);
                        xhttp.send();
                }
                 function checkInp(i)
                {
                    $('#qty'+i).bind('keyup paste', function () {
                        this.value = this.value.replace(/[^0-9]/g, '');
                    });
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
        <%@include file="site/search_bar.jsp" %>
        <br/>
        <br/>
        <br/>
        <%
            if (request.getSession().getAttribute("user_obj") != null) {
                Criteria cs = objsave.getses().createCriteria(Cart.class);
                User us=(User)request.getSession().getAttribute("user_obj");
                cs.add(Restrictions.eq("user", us));
                Cart cc = (Cart) cs.uniqueResult();

        %>
        <div class="col-md-9">
            <h1><strong>Your Shopping Cart</strong></h1>
            <div class="panel panel-default">
                <div class="panel-body" id="cart_items">
                    <%    
                int iqty=0;
                User ser = (User) request.getSession().getAttribute("user_obj");
                        cs.add(Restrictions.eq("user", ((User) objsave.getses().load(User.class, ((User) request.getSession().getAttribute("user_obj")).getIduser()))));
                        if (cs.uniqueResult() != null) {
                            List<CartItem> cl = objsave.getses().createCriteria(CartItem.class).add(Restrictions.eq("cart", cc)).list();
                            for (CartItem ch : cl) {
                                iqty++;
                                //out.write("ok");
                    %>
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="thumbnail col-md-2" style="padding: 5px">
                                    <%                                        Criteria c12 = objsave.getses().createCriteria(ItemImage.class);
                                        //Stock is = (Stock) objsave.getses().load(Stock.class, s.getIdstock());
                                        c12.add(Restrictions.eq("item", ch.getItem()));
                                        //c1.setFirstResult(1);
                                        c12.setMaxResults(1);
                                        List<ItemImage> itemimage2 = c12.list();

                                        for (ItemImage i : itemimage2) {
                                    %>
                                    <a href="<%out.write("Item_details.jsp?itemid=" + ch.getItem().getIditem());%>"><img src="<%=i.getUrl()%>"/></a>
                                        <%}%>
                                </div>

                                <div class="col-md-6">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <h4><a href="<%out.write("Item_details.jsp?itemid=" + ch.getItem().getIditem());%>"><%=ch.getItem().getItemname()%></a></h4>
                                        </div>
                                        <div class="row">

                                            <h4><strong>Color :<%=ch.getColor().getColor()%></strong></h4>
                                            <h4><strong>Size :<%=ch.getSize().getSize()%></strong></h4>
                                            <%
                                                if (ch.getQty() > 1) {
                                            %>
                                            <h5 class="">Item Price: LKR. <%=ch.getPrice()%></h5>
                                            <%}%>
                                        </div>


                                    </div>

                                </div>
                                <div class="col-md-2">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <h5>Quantity:</h5> 
                                        </div>
                                        <div class="col-md-7">
                                            <input type="text" class="text-center form-control" value="<%=ch.getQty()%>" onkeypress="checkInp('<%=iqty%>')" id="qty<%=iqty%>"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="pull-right">

                                        <h4 class="pull-right"><strong>LKR. <%=ch.getTotal()%></strong></h4>
                                    </div>
                                    <br/>
                                    <br/>
                                                                        <h6 class="pull-right">Shipping Available</h6>
                                                                        <div class="row">
                                                                            <button class="btn btn-danger btn-block" onclick="rem_cart_item('<%=ch.getIdcartItem() %>')">Remove</button>
                                                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}
                    } else {%>

                    <div class="col-md-10 col-md-offset-1">

                        <h2><strong>Your shopping cart is empty</strong></h2>

                    </div>
                    <%}%>
                </div>
            </div>
            <div class="alert alert-info alert-autocloseable-danger text-center">
                <strong>You not have any item</strong>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3><strong>Cart Summary</strong></h3>
                    <div style="border: solid #999999 1px"></div>
                    <h3><strong>Total: LKR. <%if (cc != null) {
                            out.write(cc.getTotal().toString());
                        } else {
                            out.write("0");
                        }%></strong></h3>
                    <button class="btn btn-success btn-block" onclick="goBack()"><strong>Continue Shopping</strong></button>
                    <br/>
                    <a href="<%if (user == null) {%>login.jsp<%} else {
                                    if (cc != null) {%>checkout.jsp<%} else {
                                            }
                            }%>"><button class="btn btn-primary btn-block"><strong>Proceed to checkout</strong></button></a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row col-md-12">
                <div class="col-md-9">
                    <div class="col-md-7 panel panel-default pull-right">
                        <div class="panel-body text-right">
                            <div class="row" style="margin-right: 15px">
                                <%
                                    int totitem = 0;
                                    int pcs = 0;
                                    if (cc != null) {
                                        Criteria cic = objsave.getses().createCriteria(CartItem.class);
                                        cic.setProjection(Projections.rowCount());
                                        totitem = Integer.parseInt(cic.uniqueResult().toString());
                                        Criteria cic2 = objsave.getses().createCriteria(CartItem.class);
                                        cic2.setProjection(Projections.sum("qty"));
                                        pcs = Integer.parseInt(cic2.uniqueResult().toString());
                                    }
                                %>
                                <h5><%=totitem%> items (<%=pcs%> Pcs)</h5>
                            </div>
                            <div style="border: solid 1px #999999"></div>
                            <div class="row" style="margin-right: 15px">
                                <h3><strong>Total: LKR. <%if (cc != null) {
                                        out.write(cc.getTotal().toString());
                                    } else {
                                        out.write("0");
                                    }%></strong></h3>
                            </div>
                            <div style="border: solid 1px #999999"></div>
                        </div>
                        <div class="col-md-10 col-md-offset-2" style="margin-bottom: 20px">
                            <div class="col-md-6">
                                <button class="btn btn-success btn-block" onclick="goBack()"><strong>Continue Shopping</strong></button>
                            </div>
                            <div class="col-md-6">
                                <a href="<%if (user == null) {%>login.jsp<%} else {
                                    if (cc != null) {%>checkout.jsp<%} else {
                                            }
                            }%>"><button class="btn btn-primary btn-block" onclick="checkcart()"><strong>Proceed to checkout</strong></button></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <%} else {
        %>

        <div class="col-md-9">
            <h1><strong>Your Shopping Cart</strong></h1>
            <div class="panel panel-default">
                <div class="panel-body">
                    <%
                        double tot = 0;
                        int pcs = 0;
                        int itemcount = 0;
                        if (request.getSession().getAttribute("sessionCart") != null) {
                            HashMap<String, Object> sessionCart = (HashMap<String, Object>) request.getSession().getAttribute("sessionCart");
                            //                            ArrayList<model.session_cart> cart = (ArrayList<model.session_cart>) hs.getAttribute("sescart");
                            for (String key : sessionCart.keySet()) {
                                itemcount++;
                                //                                Item p = (Item) objsave.getses().load(Item.class, ca.getPid());
                                //                                Color co = (Color) objsave.getses().load(Color.class, Integer.parseInt(ca.getColor()));
                                //                                Size si = (Size) objsave.getses().load(Size.class, Integer.parseInt(ca.getSize()));
                                //                                Criteria stc = objsave.getses().createCriteria(Stock.class);
                                //                                stc.add(Restrictions.eq("item", p));
                                //                                stc.setMaxResults(1);
                                //                                Stock st=(Stock) stc.uniqueResult();
                                //                                tot += (st.getPrice()*(ca.getQty()));

                                pcs += Integer.parseInt(sessionCart.get(key).toString());
                                Stock s = (Stock) objsave.getses().load(Stock.class, Integer.parseInt(key));
                                tot += (s.getPrice() * (Integer.parseInt(sessionCart.get(key).toString())));
                                String val = (String) sessionCart.get(key);
                    %>
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="thumbnail col-md-2" style="padding: 5px">
                                    <%                                        Criteria c1 = objsave.getses().createCriteria(ItemImage.class);
                                        Stock is = (Stock) objsave.getses().load(Stock.class, s.getIdstock());
                                        c1.add(Restrictions.eq("item", is.getItem()));
                                        //c1.setFirstResult(1);
                                        c1.setMaxResults(1);
                                        List<ItemImage> itemimage = c1.list();

                                        for (ItemImage i : itemimage) {
                                    %>
                                    <a href="<%out.write("Item_details.jsp?itemid=" + s.getItem().getIditem());%>"><img src="<%=i.getUrl()%>"/></a>
                                        <%}%>
                                </div>

                                <div class="col-md-6">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <h4><a href="<%out.write("Item_details.jsp?itemid=" + s.getItem().getIditem());%>"><%=s.getItem().getItemname()%></a></h4>
                                        </div>
                                        <div class="row">

                                            <h4><strong>Color :<%=s.getColor().getColor()%></strong></h4>
                                            <h4><strong>Size :<%=s.getSize().getSize()%></strong></h4>
                                        </div>
                                        <%
                                            int sesqty = Integer.parseInt(sessionCart.get(key).toString());
                                            if (sesqty > 1) {
                                        %>
                                        <h5 class="">Item Price: LKR. <%=s.getPrice()%></h5>
                                        <%}%>

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
                                    <h4 class="pull-right"><strong><%=sesqty * s.getPrice()%></strong></h4>
                                    <br/>
                                    <br/>
                                    <br/>
                                    <!--                                    <h6 class="pull-right">Shipping Available</h6>-->
                                    <!--                                    <div class="row">
                                                                            <button class="btn btn-danger btn-block">Remove</button>
                                                                        </div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}
                    } else {%>
                    <div class="col-md-10 col-md-offset-1">

                        <h4><strong>You're not currently signed in. <a href="login.jsp"><strong>Sign in</strong></a> to save these items or see your saved items.</strong></h4>

                    </div>
                    <%}%>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h3><strong>Cart Summary</strong></h3>
                    <div style="border: solid #999999 1px"></div>
                    <h3><strong>Total: LKR. <%=tot%></strong></h3>
                    <button class="btn btn-success btn-block" onclick="goBack()"><strong>Continue Shopping</strong></button>
                    <br/>
                    <a href="<%if (user == null) {%>login.jsp<%} else {%>#<%}%>"><button class="btn btn-primary btn-block"><strong>Proceed to checkout</strong></button></a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row col-md-12">
                <div class="col-md-9">
                    <div class="col-md-7 panel panel-default pull-right">
                        <div class="panel-body text-right">
                            <div class="row" style="margin-right: 15px">
                                <h5><%=itemcount%> items (<%=pcs%> Pcs)</h5>
                            </div>
                            <div style="border: solid 1px #999999"></div>
                            <div class="row" style="margin-right: 15px">
                                <h3><strong>Total: LKR. <%=tot%></strong></h3>
                            </div>
                            <div style="border: solid 1px #999999"></div>
                        </div>
                        <div class="col-md-10 col-md-offset-2" style="margin-bottom: 20px">
                            <div class="col-md-6">
                                <button class="btn btn-success btn-block" onclick="goBack()"><strong>Continue Shopping</strong></button>
                            </div>
                            <div class="col-md-6">
                                <a href="<%if (user == null) {%>login.jsp<%} else {%>#<%}%>"><button class="btn btn-primary btn-block"><strong>Proceed to checkout</strong></button></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <%}%>
        <%@include file="site/footer.jsp" %>
    </body>
</html>
