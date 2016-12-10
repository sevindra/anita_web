<%-- 
    Document   : Category
    Created on : May 22, 2016, 10:46:11 PM
    Author     : Sevi
--%>


<%@page import="POJOS.Cart"%>
<%@page import="POJOS.CartItem"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="POJOS.Message"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.Subcat"%>
<%@page import="Src.objsave"%>
<%@page import="POJOS.Cat"%>
<%@page import="java.util.List"%>
<%
    HttpSession hsheader = request.getSession();
    POJOS.User userheader = (POJOS.User) hsheader.getAttribute("user_obj");

%>
<noscript>
<META HTTP-EQUIV="Refresh" CONTENT="0;URL=error_javascript.jsp">
</noscript>
<div class="container navbar-botom-margin">
    <nav class="navbar navbar-default navbar-fixed-top">
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
            <label class="logo-text">ANITA</label>
            <ul class="nav navbar-nav">
                <li><a href="index.jsp"><span></span>Home</a></li>
                <!--class="dropdown"-->
                <li class="">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Shop <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a id="watch" href="item.jsp">New Products</a></li>
                        <li><a id="watch" href="item.jsp">Promotions</a></li>
                        <li><a href="item.jsp">Products</a></li>

                    </ul>
                </li>

                <li class="">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Category <b class="caret"></b></a>

                    <ul class="dropdown-menu multi-level" >
                        <%                            int count = 5;
                            List<Cat> catli = objsave.getses().createCriteria(Cat.class).list();
                            for (Cat cat : catli) {
                        %>
                        <li class="dropdown-submenu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=cat.getCatname()%></a>
                            <ul class="dropdown-menu" style="margin-top: <%=count%>px">
                                <%
                                    List<Subcat> sublist = objsave.getses().createCriteria(Subcat.class).add(Restrictions.eq("cat", cat)).list();
                                    for (Subcat subli : sublist) {
                                %>
                                <li> <a href="item.jsp?catname=<%=cat.getCatname()%>&subcatname=<%=subli.getSubname()%>"><%=subli.getSubname()%></a> </li>
                                    <%}%>
                                <!--                                <li> <a href="item.jsp"> T-Shirt </a> </li>
                                                                <li> <a href="item.jsp"> Short </a> </li>
                                                                <li> <a href="item.jsp"> Trousers </a> </li>
                                                                <li> <a href="item.jsp"> Denims </a> </li>
                                                                <li> <a href="item.jsp"> Shoes </a> </li>-->

                            </ul>
                        </li>
                        <%
                                count += 26;
                            }%>
                        <!--                        <li class="dropdown-submenu">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Women</a>
                                                    <ul class="dropdown-menu" style="margin-top: 30px">
                                                        <li> <a href="item.jsp"> Blouses </a> </li>
                                                        <li> <a href="item.jsp"> T-Shirts </a> </li>
                                                        <li> <a href="item.jsp"> Frocks </a> </li>
                                                        <li> <a href="item.jsp"> Trousers </a> </li>
                                                        <li> <a href="item.jsp"> Denims </a> </li>
                                                        <li> <a href="item.jsp"> Shoes </a> </li>
                        
                                                    </ul>
                                                </li>
                                                <li class="dropdown-submenu">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Kids</a>
                                                    <ul class="dropdown-menu" style="margin-top: 55px">
                                                        <li> <a href="item.jsp"> T-shirts </a> </li>
                                                        <li> <a href="item.jsp"> Trousers </a> </li>
                                                        <li> <a href="item.jsp"> Shorts  </a> </li>
                                                        <li> <a href="item.jsp"> Frocks </a> </li>
                        
                                                    </ul>
                                                </li>
                                                <li class="dropdown-submenu">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Toys</a>
                                                    <ul class="dropdown-menu" style="margin-top: 82px">
                                                        <li> <a href="item.jsp"> Boy </a> </li>
                                                        <li> <a href="item.jsp"> Girl </a> </li>
                        
                                                    </ul>
                                                </li>
                                                <li class="dropdown-submenu">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other</a>
                                                    <ul class="dropdown-menu" style="margin-top: 108px">
                                                        <li> <a href="item.jsp"> other1 </a> </li>
                                                        <li> <a href="item.jsp"> other2 </a> </li>
                        
                                                    </ul>
                                                </li>-->
                    </ul>

                </li>

                <li><a href="Contact.jsp">Contact</a></li>

            </ul>				

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">               <!--data-toggle="dropdown"-->
                    <a href="<%if (userheader == null) {%>login.jsp<%} else {%>#<%}%>" class="dropdown-toggle" id="user" value="<%if (userheader != null) {
                            out.write(userheader.getIduser());
                        } else {
                            out.write("Login");
                        }%>">Hi <%
                            if (userheader != null) {
                                out.write(userheader.getFname());
                            } else {
                                out.write("Login");
                            }%> <span class="<%if (userheader != null) {%>caret<%}%>"></span></a>
                        <%
                            if (userheader != null) {%>
                    <ul class="dropdown-menu" role="menu">

                        <li><a href="my_profile.jsp">My Profile</a></li>
                        <li><a onclick="loginfirst()" href="<%if (userheader != null) {%>purchased.jsp<%}%>">Cart</a></li>

                        <li class="divider"></li>
                        <li><a onclick="loginfirst()" href="<%if (userheader != null) {%>watched.jsp<%}%>">Watched Items</a></li>
                        <li><a onclick="loginfirst()" href="<%if (userheader != null) {%>purchased.jsp<%}%>">Purchase</a></li>
                        <li class="divider"></li>
                            <%
                                if (userheader.getUtype().getUtype().equals("Super Admin") | userheader.getUtype().getUtype().equals("SuperAdmin")) {%>

                        <li><a href="new_admin/main.jsp">Admin Panel</a></li>
                            <%}%>
                        <li><a href="logout">Logout</a></li>
                    </ul>  
                    <%}%>
                </li>
                <%
                    Criteria c = objsave.getses().createCriteria(Message.class);
                    c.add(Restrictions.eq("notification", 1));
                    // c.addOrder(Order.desc("date"));
                    List<Message> mli = c.list();
                    c.setProjection(Projections.sum("notification"));
                    int me = Integer.parseInt(c.uniqueResult().toString());
                %>
                <li class="dropdown"><a onclick="loginfirst()" href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                            class="glyphicon glyphicon-envelope" style="margin-right: 5px"></span>Inbox<%if (userheader != null) {%><span class="label label-info" style="margin-left: 5px"><%=me%></span><%}%>
                    </a>
                    <%if (userheader != null) {%>
                    <ul class="dropdown-menu">
                        <%
                            for (Message m : mli) {
                                String mes = m.getMessage();
                                mes = mes.substring(0, 15);
                                Date d1 = new Date();
                                Date d2 = m.getDate();
                                SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
                                String d3 = sd.format(d1);
                                String d4 = sd.format(d2);
                        %>
                        <li><a href="message.jsp"><span class="label label-warning"><%if (d3.equals(d4)) {
                                out.write(m.getTime().toString());
                            } else {
                                out.write(m.getDate().toString());
                            }%></span> <%=mes + "..."%></a></li>
                                    <%}%>
                        <!--                        <li><a href="message.jsp"><span class="label label-warning">4:30 AM</span> Email marketing</a></li>
                                                <li><a href="message.jsp"><span class="label label-warning">5:00 AM</span> Subscriber focused email-->
                        <!--design</a></li>-->
                        <li class="divider"></li>
                        <li><a href="message.jsp" class="text-center">View All</a></li>
                    </ul>        
                    <%}%>
                </li>
                <%
                    int cartcount=0;
                    Criteria cru = objsave.getses().createCriteria(Cart.class);
                    cru.add(Restrictions.eq("user", userheader));
                    List<Cart> carl = cru.list();
                    for (Cart cr : carl) {
                        Criteria crc = objsave.getses().createCriteria(CartItem.class);
                        crc.add(Restrictions.eq("cart", cr));
                        crc.setProjection(Projections.rowCount());
                        cartcount = Integer.parseInt(crc.uniqueResult().toString());
                    }
                %>
                <li><a onclick="seturl()" href="cart.jsp"><span  class="glyphicon glyphicon-shopping-cart" style="margin-right: 5px"></span>Cart<%if(cartcount!=0){%><span class="label label-warning" style="margin-right:  10px;margin-left: 5px" id="cartqty"><%=cartcount %></span><%}%></a>

                </li>
            </ul>
        </div><!-- /.nav-collapse -->
    </nav>
</div>
<!--<button type="button" class="btn btn-default myhover myBtnwidth150" data-toggle="modal" data-target=".bs-example-modal-cat">Add Sub Category</button>-->

<div class="modal fade bs-example-modal-cat" data-remodal-id="loginid" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="loginmodel">
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
                                    <input type="text" required="" name="email" id="email" tabindex="1" class="form-control" placeholder="E-mail">
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
                                                <a href="foget_password.jsp" tabindex="5" class="forgot-password">Forgot Password?</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </form>
                            <form id="register-form" action="cus_reg" role="form" style="display: none;">

                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="password" name="cpassword" id="cpass" tabindex="3" class="form-control" placeholder="Confirm Password">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="text" name="fname" id="fname" tabindex="4" class="form-control" placeholder="First Name">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="lname" id="lname" tabindex="5" class="form-control" placeholder="Last Name">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="text" name="mobile" id="mobile" tabindex="3" class="form-control" placeholder="(07) Mobile No">
                                    </div>
                                </div>
                                <br>
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <button type="submit" name="register-submit" class="btn btn-register form-control" value="register"><span class="glyphicon glyphicon-user"></span><label> REGISTER</label></button>
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