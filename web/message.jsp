<%-- 
    Document   : test
    Created on : Jun 5, 2016, 6:34:41 PM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
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
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="site/header.jsp" %>
        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-body text-center" style="height: 200px">
                        advertisement
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="container">

                <div class="row">

                    <div class="col-md-12">
                        <!-- Nav tabs -->
                        <div class="">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#home" data-toggle="tab"><span class="glyphicon glyphicon-inbox"></span>Chat</a>
                                </li>
                                <li>
                                    <a href="#profile" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>Message from ANITA</a>
                                </li>
                                <li>
                                    <a href="#messages" data-toggle="tab"><span class="glyphicon glyphicon-inbox"></span>Sent</a></li>
                                <!--                                <li>
                                                                    <a href="#settings" data-toggle="tab"><span class="glyphicon glyphicon-plus no-margin"></span></a>
                                                                </li>-->
                                <button class="btn btn-danger pull-right" data-toggle="collapse" data-target="#demo">COMPOSE</button>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="home">
                                    <div class="list-group">
                                        <a href="#" class="list-group-item">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox">
                                                </label>
                                            </div>
                                            <span class="glyphicon glyphicon-star-empty"></span><span class="name" style="min-width: 120px;
                                                                                                      display: inline-block;">Bhaumik Patel</span> <span class="">This is big title</span>
                                            <span class="text-muted" style="font-size: 11px;">- Hi hello how r u ?</span> <span
                                                class="badge">12:10 AM</span> <span class="pull-right"></span>
                                        </a>
                                        <a href="#" class="list-group-item read">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox">
                                                </label>
                                            </div>
                                            <span class="glyphicon glyphicon-star-empty"></span><span class="name" style="min-width: 120px;
                                                                                                      display: inline-block;">Bhaumik Patel</span> <span class="">This is big title</span>
                                            <span class="text-muted" style="font-size: 11px;">- Hi hello how r u ?</span> <span
                                                class="badge">12:10 AM</span> <span class="pull-right"></span>
                                        </a>
                                        <a href="#" class="list-group-item read">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox">
                                                </label>
                                            </div>
                                            <span class="glyphicon glyphicon-star"></span><span class="name" style="min-width: 120px;
                                                                                                display: inline-block;">Bhaumik Patel</span> <span class="">This is big title</span>
                                            <span class="text-muted" style="font-size: 11px;">- Hi hello how r u ?</span> <span
                                                class="badge">12:10 AM</span> <span class="pull-right"></span>
                                        </a>
                                    </div>
                                </div>
                                <div class="tab-pane fade in" id="profile">
                                    <div class="list-group">
                                        <div class="list-group-item">
                                            <span class="text-center">This tab is empty.</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade in" id="messages">
                                    ...</div>
                                <div class="tab-pane fade in" id="settings">
                                    This tab is empty.</div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div id="demo" class="collapse">
                <div class="col-md-8">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <textarea rows="5" cols="40" placeholder="Message" class="form-control"></textarea>
                                </div> 
                            </div>
                            <br/>
                            <div class="row col-md-8">
                                <div class="col-md-3">
                                    <button class="btn btn-danger btn-block pull-right"><strong>Send</strong></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="site/footer.jsp" %>
    </body>
</html>
