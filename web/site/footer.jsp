<%-- 
    Document   : Category
    Created on : May 22, 2016, 10:46:11 PM
    Author     : Sevi
--%>
<%
    HttpSession hs1 = request.getSession();
    POJOS.User user1 = (POJOS.User) hs1.getAttribute("user_obj");

%>
<footer>
    <div class="footer" id="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    <h3> SERVICE </h3>
                    <ul>
                        <li> <a href="#"> New Products</a> </li>
                        <li> <a href="#"> Checkout </a> </li>
                        <li> <a href="#"> Cart </a> </li>
                        <li> <a href="#"> Watched List </a> </li>
                        <li> <a href="#"> Purchase </a> </li>
                        <li> <a href="#"> Contact Us </a> </li>
                        <li> <a href="<%if (user1 != null) {%>#<%}%>" data-toggle="modal" data-target="<%if (user1 == null) {%>.bs-example-modal-cat<%}%>"><%if (user1 != null) {%><a href="logout">Logout</a><%} else {%>Login<%}%></a> </li>

                    </ul>
                </div>
                <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    <h3> QUICK SHOPPING </h3>
                    <ul>
                        <li> <a href="#"> Men </a> </li>
                        <li> <a href="#"> Women </a> </li>
                        <li> <a href="#"> Kids </a> </li>
                        <li> <a href="#"> Toys </a> </li>
                        <li> <a href="#"> Bags </a> </li>
                        <li> <a href="#"> Shoes </a> </li>
                    </ul>
                </div>
                <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    <h3> POLICIES </h3>
                    <ul>
                        <li> <a href="#"> Terms of Use </a> </li>
                        <li> <a href="#"> Privacy Policy </a> </li>
                        <li> <a href="#"> Refund Policy </a> </li>
                        
                    </ul>
                </div>
                <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    <h3> ABOUT Anita </h3>
                    <ul>
                        <li> <a href="#"> Company Information </a> </li>
                        <li> <a href="#"> Careers </a> </li>
                        <li> <a href="#"> Store Location </a> </li>
                        <li> <a href="#"> Copyright </a> </li>
                    </ul>
                </div>
                <div class="col-lg-3  col-md-3 col-sm-6 col-xs-12 ">
                    <h3> Social </h3>
                    <!--                            <ul>
                                                    <li>
                                                        <div class="input-append newsletter-box text-center">
                                                            <input type="text" class="full text-center form-control" placeholder="Email ">
                                                            <button class="btn  bg-gray" type="button"> Lorem ipsum <i class="fa fa-long-arrow-right"> </i> </button>
                                                        </div>
                                                    </li>
                                                </ul>-->
                    <ul class="social">
                        <li> <a href="http://www.facebook.com"> <i class=" fa fa-facebook">   </i> </a> </li>
                        <li> <a href="http://www.twitter.com"> <i class="fa fa-twitter">   </i> </a> </li>
                        <li> <a href="#"> <i class="fa fa-google-plus">   </i> </a> </li>
                        <li> <a href="http://www.youtube.com"> <i class="fa fa-youtube">   </i> </a> </li>
                    </ul>
                </div>
            </div>
            <!--/.row--> 
        </div>
        <!--/.container--> 
    </div>
    <!--/.footer-->

    <div class="footer-bottom">
        <div class="container">
            <p class=""> Copyright © 2016 Anita Designer wear (Pvt) Ltd, All Rights Reserved. </p>
            <a id="back-to-top" href="#" class="btn btn-danger btn-lg back-to-top" role="button" title="Click to return on the top page" data-toggle="tooltip" data-placement="left" style="margin-left: 50px; float: right"><span class="glyphicon glyphicon-chevron-up"></span></a>
            <div class="pull-right">
                <ul class="nav nav-pills payments">
                    <li><i class="fa fa-cc-visa"></i></li>
                    <li><i class="fa fa-cc-mastercard"></i></li>
                    <li><i class="fa fa-cc-amex"></i></li>
                    <li><i class="fa fa-cc-paypal"></i></li>
                </ul> 
            </div>
            <a class="pull-left" href="#" style="font-size: 12px; margin-top: -50px; margin-right: 80%"> WEB DESIGNED BY CYGNETIC</a>
        </div>
    </div>
    <!--/.footer-bottom--> 
</footer>
