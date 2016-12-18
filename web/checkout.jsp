<%-- 
    Document   : checkout
    Created on : Nov 22, 2016, 1:43:06 AM
    Author     : Sevi
--%>

<%@page import="POJOS.CardDetails"%>
<%@page import="POJOS.User"%>
<%@page import="POJOS.State"%>
<%@page import="POJOS.Addres"%>
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
            //document.addEventListener('contextmenu', event = > event.preventDefault());
            function change_bill_address() {

                var Address = document.getElementById('address').value;
                var city = document.getElementById('city').value;
                var state = document.getElementById('state').value;
                var pcode = document.getElementById('pcode').value;
                var mobile = document.getElementById('mob').value;
                //alert(mobile);
                document.getElementById('ad1').innerHTML = Address;
                document.getElementById('ad2').innerHTML = city + " " + state + " " + pcode;
                document.getElementById('ad3').innerHTML = mobile;
            }
            function change_delevary_address() {

                var name = document.getElementById('name2').value;
                var Address = document.getElementById('address2').value;
                var city = document.getElementById('city2').value;
                var state = document.getElementById('state2').value;
                var pcode = document.getElementById('pcode2').value;
                var mobile = document.getElementById('mob2').value;
                //alert(mobile);
                document.getElementById('name').innerHTML = name;
                document.getElementById('ad4').innerHTML = Address;
                document.getElementById('ad5').innerHTML = city + " " + state + " " + pcode;
                document.getElementById('ad6').innerHTML = mobile;
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





            <%                HttpSession hs = request.getSession();
                POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");

            %>

            function loginfirst() {

            <%                        if (user == null) {%>////
                alert("Please Login First !");
                ////    <%}%>

            }

//            function pay() {
//                var cardno = document.getElementById('cardno').value;
//                var exp = document.getElementById('exp').value;
//                var sec = document.getElementById('sec').value;
//                var cardfname = document.getElementById('cardfname').value;
//                var cardlname = document.getElementById('cardlname').value;
//
//                var xhttp = new XMLHttpRequest();
//                //alert(itemid);
//                xhttp.onreadystatechange = function () {
//                    if (xhttp.readyState === 4 && xhttp.status === 200) {
//                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
//
//                        alert(xhttp.responseText);
//                        //document.getElementById('watched').innerHTML = xhttp.responseText;
//                    }
//                };
//                xhttp.open("POST", "order?cardno=" + cardno + "&exp=" + exp + "&sec=" + sec + "&cardfname=" + cardfname + "&cardlname=" + cardlname + "&pay=ok", true);
//                xhttp.send();
//            }


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
        <form method="post" action="order">
            <div class="col-md-10 col-md-offset-1">
                <div class="col-md-9">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3><strong>Card Details</strong></h3>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-6">
                                        <%
                                            Criteria cd = objsave.getses().createCriteria(CardDetails.class);
                                            cd.add(Restrictions.eq("user", user));
                                            CardDetails cad = (CardDetails) cd.uniqueResult();
                                        %>
                                        <div class="col-md-12">
                                            <H5>Card Number</H5>
                                        </div>
                                        <div class="col-md-12">
                                            <input placeholder="Card Number" class="form-control" required="" name="cardno" value="<%if (cad != null) {
                                                    out.write(cad.getCardNo());
                                                }%>"/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <img src="img/card_types.png" width="350px">
                                    </div>
                                </div>
                                <br/>
                                <div class="row">

                                    <div class="col-md-6">
                                        <div class="col-md-12">
                                            <H5>Expiration Date</H5>
                                        </div>
                                        <input placeholder="MM/YY" class="form-control" required="" name="exp" value="<%if (cad != null) {
                                                out.write(cad.getExp());
                                            }%>"/>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-12">
                                            <H5>Security Code</H5>
                                        </div>
                                        <input placeholder="3 or 4 Digits" class="form-control" required="" name="sec" value="<%if (cad != null) {
                                                out.write(cad.getSec());
                                            }%>"/>
                                    </div>
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="col-md-12">
                                            <H5>First Name</H5>
                                        </div>
                                        <input placeholder="First Name" class="form-control" required="" name="cardfname" value="<%if (cad != null) {
                                                out.write(cad.getFname());
                                            }%>"/>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-md-12">
                                            <H5>Last Name</H5>
                                        </div>
                                        <input placeholder="Last Name" class="form-control" required="" name="cardlname" value="<%if (cad != null) {
                                                out.write(cad.getLname());
                                            }%>"/>
                                    </div>

                                </div>
                                <br/>
                                <div class="row">
                                    <%
                                        User us = (User) request.getSession().getAttribute("user_obj");
                                        Addres ad = (Addres) objsave.getses().createCriteria(Addres.class).add(Restrictions.and(Restrictions.eq("user", us), Restrictions.eq("primaryAddress", 1))).uniqueResult();
                                    %>
                                    <div style="border: solid #999999 1px"></div>
                                    <h4>Billing Address</h4>
                                    <div id="ad1"><%if (ad != null) {
                                            out.write(ad.getAddress());
                                        }%></div>
                                    <div id="ad2"><%if (ad != null) {
                                            out.write(ad.getCity() + ", " + ad.getState().getState() + ", " + ad.getZip());
                                        }%></div>
                                    <div id="ad3"><%=us.getMobile()%></div>
                                    <a href="#" data-toggle="modal" data-target="#myModal">Edit your billing address</a>
                                    <input type="hidden" name="baddress" value="<%if (ad != null) {
                                            out.write(ad.getAddress());
                                        }%>"/>
                                    <input type="hidden" name="baddress2" value="<%if (ad != null) {
                                            out.write(ad.getCity() + " ," + ad.getState().getState() + ", " + ad.getZip());
                                        }%>"/>
                                    <input type="hidden" name="baddress3" value="<%=us.getMobile()%>"/>

                                </div>
                                <div id="myModal" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">

                                            <div class="modal-body">

                                                <div class="row">

                                                    <div class="col-md-2 col-md-offset-1">
                                                        <h5><strong>Address</strong></h5>
                                                    </div>
                                                    <div class="col-md-6">

                                                        <input type="text" placeholder="Address" class="form-control" id="address" value="<%if (ad != null) {
                                                                out.write(ad.getAddress());
                                                            }%>"/>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <input type="text" placeholder="City" class="form-control" id="city" value="<%if (ad != null) {
                                                                out.write(ad.getCity());
                                                            }%>"/>
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="row">
                                                    <div class="col-md-3 col-md-offset-1">
                                                        <h5><strong>State</strong></h5>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <select class="form-control" id="state">
                                                            <%
                                                                Session ses = objsave.getses();
                                                                Criteria c1 = ses.createCriteria(State.class);
                                                                List<State> li1 = c1.list();
                                                                for (State state : li1) {
                                                            %>
                                                            <option value="<%=state.getState()%>"><%=state.getState()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="row">
                                                    <div class="col-md-3 col-md-offset-1">
                                                        <h5><strong>Postal Code (Zip)</strong></h5>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="text" placeholder="Postal Code (Zip)" class="form-control" id="pcode" value="<%if (ad != null) {
                                                                out.write(ad.getZip());
                                                            }%>"/>
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="row">
                                                    <div class="col-md-3 col-md-offset-1">
                                                        <h5><strong>Primary Mobile</strong></h5>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="text" placeholder="Mobile" class="form-control" id="mob" value="<%=us.getMobile()%>"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" onclick="change_bill_address()" data-dismiss="modal">Save</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h3><strong>Delivery to</strong></h3>
                            <%
                                Addres ad2 = (Addres) objsave.getses().createCriteria(Addres.class).add(Restrictions.and(Restrictions.eq("user", us), Restrictions.eq("primaryAddress", 0))).uniqueResult();
                            %>
                            <div class="row">
                                <%
                                    if (ad2 != null) {
                                %>
                                <div class="col-md-12">
                                    <div style="border: solid #999999 1px"></div>
                                    <h4 id="name"><%=us.getFname() + " " + us.getLname()%></h4>
                                    <div id="ad4" name="daddress"><%if (ad2 != null) {
                                            out.write(ad2.getAddress());
                                        }%></div>
                                    <div id="ad5" name="daddress2"><%if (ad2 != null) {
                                            out.write(ad2.getCity() + ", " + ad2.getState().getState() + ", " + ad2.getZip());
                                        }%></div>
                                    <div id="ad6" name="daddress3"><%=us.getMobile()%></div>
                                    <a href="#" data-toggle="modal" data-target="#myModal2">Change</a>
                                    <input type="hidden" name="daddress" value="<%if (ad2 != null) {
                                            out.write(ad2.getAddress());
                                        }%>"/>
                                    <input type="hidden" name="daddress2" value="<%if (ad2 != null) {
                                            out.write(ad2.getCity() + " ," + ad2.getState().getState() + ", " + ad2.getZip());
                                        }%>"/>
                                    <input type="hidden" name="daddress3" value="<%=us.getMobile()%>"/>
                                </div>
                                <%
                                } else {
                                %>
                                <div class="col-md-12">
                                    <div style="border: solid #999999 1px"></div>
                                    <h4 id="name"><%=us.getFname() + " " + us.getLname()%></h4>
                                    <div id="ad4"><%if (ad != null) {
                                            out.write(ad.getAddress());
                                        }%></div>
                                    <div id="ad5"><%if (ad != null) {
                                            out.write(ad.getCity() + " " + ad.getState().getState() + " " + ad.getZip());
                                        }%></div>
                                    <div id="ad6"><%=us.getMobile()%></div>
                                    <a href="#" data-toggle="modal" data-target="#myModal2">Change</a>
                                </div>
                                <%
                                    }
                                %>
                                <div id="myModal2" class="modal fade" role="dialog">
                                    <div class="modal-dialog">

                                        <!-- Modal content-->
                                        <div class="modal-content">

                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-3 col-md-offset-1">
                                                        <h5><strong>Full Name :</strong></h5>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="text" placeholder="Full Name" class="form-control" id="name2" value="<%=us.getFname() + " " + us.getLname()%>"/>
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="row">
                                                    <div class="col-md-2 col-md-offset-1">
                                                        <h5><strong>Address</strong></h5>
                                                    </div>
                                                    <div class="col-md-6">

                                                        <input type="text" placeholder="Address" class="form-control" id="address2" value="<%if (ad2 != null) {
                                                                if (ad2 != null) {
                                                                    out.write(ad2.getAddress().toString());
                                                                } else {
                                                                }
                                                            } else {
                                                            }%>"/>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <input type="text" placeholder="City" class="form-control" id="city2" value="<%if (ad2 != null) {
                                                                if (ad2 != null) {
                                                                    out.write(ad2.getCity().toString());
                                                                } else {
                                                                }
                                                            } else {
                                                            }%>"/>
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="row">
                                                    <div class="col-md-3 col-md-offset-1">
                                                        <h5><strong>State</strong></h5>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <select class="form-control" id="state2">
                                                            <%
                                                                //Session ses=objsave.getses();
                                                                Criteria c2 = ses.createCriteria(State.class);
                                                                List<State> li2 = c2.list();
                                                                for (State state : li2) {
                                                            %>
                                                            <option value="<%=state.getState()%>"><%=state.getState()%></option>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="row">
                                                    <div class="col-md-3 col-md-offset-1">
                                                        <h5><strong>Postal Code (Zip)</strong></h5>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="text" placeholder="Postal Code (Zip)" class="form-control" id="pcode2" value="<%if (ad2 != null) {
                                                                if (ad2 != null) {
                                                                    out.write(ad2.getZip().toString());
                                                                } else {
                                                                }
                                                            } else {
                                                            }%>"/>
                                                    </div>
                                                </div>
                                                <br/>
                                                <div class="row">
                                                    <div class="col-md-3 col-md-offset-1">
                                                        <h5><strong>Primary Mobile</strong></h5>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <input type="text" placeholder="Mobile" class="form-control" id="mob2" value="<%=us.getMobile()%>"/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="change_delevary_address()">Save</button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading"><strong>Review item</strong></div>
                        <div class="panel-body">
                            <%
                                if (request.getSession().getAttribute("user_obj") != null) {
                                    Criteria cs = objsave.getses().createCriteria(Cart.class);
                                    User u = (User) request.getSession().getAttribute("user_obj");
                                    cs.add(Restrictions.eq("user", u));
                                    Cart cc = (Cart) cs.uniqueResult();

                            %>
                            <%                        User ser = (User) request.getSession().getAttribute("user_obj");
                                cs.add(Restrictions.eq("user", ((User) objsave.getses().load(User.class, ((User) request.getSession().getAttribute("user_obj")).getIduser()))));
                                if (cs.uniqueResult() != null) {
                                    List<CartItem> cl = objsave.getses().createCriteria(CartItem.class).add(Restrictions.eq("cart", cc)).list();
                                    for (CartItem ch : cl) {
                                        //out.write("ok");
                            %>
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
                                                <h5>Quantity: </h5> 
                                            </div>
                                            <div class="col-md-7">
                                                <h5> <strong style="margin-left: 5px"><%=ch.getQty()%></strong></h5>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <h4 class="pull-right"><strong>LKR. <%=ch.getTotal()%></strong></h4>
                                        <br/>
                                        <br/>
                                        <br/>

                                    </div>
                                </div>
                            </div>
                            <%}
                                    }
                                }%>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <%
                                Criteria cs = objsave.getses().createCriteria(Cart.class);
                                User u = (User) request.getSession().getAttribute("user_obj");
                                cs.add(Restrictions.eq("user", u));
                                Cart cc = (Cart) cs.uniqueResult();

                                Criteria cri = objsave.getses().createCriteria(CartItem.class);
                                cri.add(Restrictions.eq("cart", cc));
                                cri.setProjection(Projections.rowCount());
                                int coun = Integer.parseInt(cri.uniqueResult().toString());
                            %>

                            <div class="col-md-12">
                                <h3><strong>Order Summary</strong></h3>
                                <div style="border: solid #999999 1px"></div>
                            </div>
                            <br/>
                            <div class="col-md-6">
                                <label>Item (<%=coun%>)</label>
                                <br/>
                                <label>Delivery</label>
                            </div>
                            <div class="col-md-6">
                                <label class="pull-right">LKR. <%=cc.getTotal()%></label>
                                <br/>
                                <%Criteria ccc = objsave.getses().createCriteria(Addres.class);
                                    ccc.add(Restrictions.eq("user", u));
                                    ccc.add(Restrictions.eq("primaryAddress", 1));
                                    Addres adr = (Addres) ccc.uniqueResult();
                                %>
                                <label class="pull-right">LKR. <%if (adr != null) {
                                        out.write(adr.getState().getDeliveryPrice().toString());
                                    }%></label>
                            </div>
                            <br/>
                            <div class="col-md-8">
                                <h4><strong>Order Total: </strong></h4>
                            </div>
                            <div class="col-md-4">

                                <h4 class="pull-right"><strong>LKR.<%=adr.getState().getDeliveryPrice() + cc.getTotal()%></strong></h4>
                            </div>

                            <!--<button class="btn btn-success btn-block" onclick="goBack()"><strong>Continue Shopping</strong></button>-->
                            <button class="btn btn-primary btn-block"><strong>Confirm and Pay</strong></button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <div class="container-fluid">
            <!--            <div class="row col-md-12">
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
                        </div>-->
        </div>
        <%@include file="site/footer.jsp" %>
    </body>
</html>
