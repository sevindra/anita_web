<%-- 
    Document   : Category
    Created on : May 22, 2016, 10:46:11 PM
    Author     : Sevi
--%>
<%
    HttpSession hsheader = request.getSession();
    POJOS.User userheader = (POJOS.User) hsheader.getAttribute("user_obj");

%>
<div class="container" style="padding-top: 60px">
    <nav class="navbar navbar-default navbar-fixed-top" style="max-height: 50px">
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
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Shop <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a id="watch" onclick="loginfirst()" href="<%if (userheader != null) {%>adminPanel/watched.jsp<%}%>">New Products</a></li>
                        <li><a onclick="loginfirst()" href="<%if (userheader != null) {%>adminPanel/purchased.jsp<%}%>">Products</a></li>
                        <li><a onclick="loginfirst()" href="<%if (userheader != null) {%>adminPanel/purchased.jsp<%}%>">Checkout</a></li>
                        <li><a onclick="loginfirst()" href="<%if (userheader != null) {%>adminPanel/purchased.jsp<%}%>">Cart</a></li>
                        <li><a href="<%if (userheader != null) {%>#<%}%>" data-toggle="modal" data-target="<%if (userheader == null) {%>.bs-example-modal-cat<%}%>"><%if (userheader != null) {%><a href="logout">Logout</a><%} else {%>Login<%}%></a></li>
                        <li class="divider"></li>
                        <li><a onclick="loginfirst()" href="<%if (userheader != null) {%>adminPanel/purchased.jsp<%}%>">Watched Items</a></li>
                        <li><a onclick="loginfirst()" href="<%if (userheader != null) {%>adminPanel/purchased.jsp<%}%>">Purchase</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Men <span class="caret"></span></a>				
                    <ul class="dropdown-menu">
                        <li class="col-sm-3">
                        <li> <a href="#"> Shirt </a> </li>
                        <li> <a href="#"> T-Shirt </a> </li>
                        <li> <a href="#"> Short </a> </li>
                        <li> <a href="#"> Trousers </a> </li>
                        <li> <a href="#"> Denims </a> </li>
                        <li> <a href="#"> Shoes </a> </li>
                    </ul>

                </li>
                <li class="dropdown mega-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Women <span class="caret"></span></a>				
                    <ul class="dropdown-menu">
                        <li class="col-sm-3">
                        <li> <a href="#"> Blouses </a> </li>
                        <li> <a href="#"> T-Shirts </a> </li>
                        <li> <a href="#"> Frocks </a> </li>
                        <li> <a href="#"> Trousers </a> </li>
                        <li> <a href="#"> Denims </a> </li>
                        <li> <a href="#"> Shoes </a> </li>
                    </ul>

                </li>
                <li><a href="Contact.jsp"><span></span>Contact</a></li>
            </ul>				




<!--            <div class="col-md-4 col-md-offset-1" style="padding-top: 7px">
                <div class="form-group input-group">

                    <input class="form-control" placeholder="Search" type="text"/>
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="glyphicon glyphicon-search"></i></button>
                    </span>
                </div>
            </div>-->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">               <!--data-toggle="dropdown"-->
                    <a href="#" class="dropdown-toggle" role="button" aria-expanded="false"  data-toggle="modal" data-target="<%if (userheader == null) {%>.bs-example-modal-cat<%}%>" id="user" value="<%if (userheader != null) {
                            out.write(userheader.getIduser());
                        } else {
                            out.write("Login");
                        }%>">Hi <%
                            if (userheader != null) {
                                out.write(userheader.getUname());
                            } else {
                                out.write("Login");
                            }%> <span class="caret"></span></a>
                        <%
                                    if (userheader != null) {%>
                    <ul class="dropdown-menu" role="menu">

                        <%
                                    if (userheader.getUtype().getUtype().equals("Admin")) {%>

                        <li><a href="adminPanel/sup.jsp">Admin Panel</a></li>
                            <%}%>
                        <li><a href="logout">Logout</a></li>
                    </ul>  
                    <%}%>
                </li>
                <a></a>
                <!--<li><a href="#" class="glyphicon glyphicon-envelope"></a></li>-->
                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
                            class="glyphicon glyphicon-envelope" style="margin-right: 5px"></span>Inbox<span class="label label-info" style="margin-left: 5px">32</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><span class="label label-warning">4:00 AM</span>Favourites Snippet</a></li>
                        <li><a href="#"><span class="label label-warning">4:30 AM</span>Email marketing</a></li>
                        <li><a href="#"><span class="label label-warning">5:00 AM</span>Subscriber focused email
                                design</a></li>
                        <li class="divider"></li>
                        <li><a href="#" class="text-center">View All</a></li>
                    </ul>
                </li>
                <li><a href="#"><span  class="glyphicon glyphicon-shopping-cart" style="margin-right: 5px"></span>Cart<span class="label label-warning" style="margin-right:  10px;margin-left: 5px">2</span></a>

                </li>
            </ul>
        </div><!-- /.nav-collapse -->
    </nav>
</div>
<!--<button type="button" class="btn btn-default myhover myBtnwidth150" data-toggle="modal" data-target=".bs-example-modal-cat">Add Sub Category</button>-->

<div class="modal fade bs-example-modal-cat" data-remodal-id="loginid" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
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
                                    <input type="text" required="" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
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
                                                <a href="http://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </form>
                            <form id="register-form" action="http://phpoll.com/register/process" method="post" role="form" style="display: none;">

                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="email" name="reemail" id="reemail" tabindex="2" class="form-control" placeholder="Confirm Email Address" value="">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="password" name="password" id="password" tabindex="3" class="form-control" placeholder="Password">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="text" name="fname" id="fname" tabindex="3" class="form-control" placeholder="First Name" value="">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" name="lname" id="lname" tabindex="3" class="form-control" placeholder="Last Name" value="">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="text" name="mobile" id="mobile" tabindex="3" class="form-control" placeholder="(+94) Mobile No" value="">
                                    </div>
                                </div>
                                <br>
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-sm-6 col-sm-offset-3">
                                            <input type="submit" name="register-submit" id="register-submit" tabindex="5" class="form-control btn btn-register" value="Register">
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