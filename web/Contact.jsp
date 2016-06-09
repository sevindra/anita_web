<%-- 
    Document   : Contact
    Created on : May 10, 2016, 10:34:35 PM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>Contact</title>
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
        <%@include file="site/header.jsp" %>
        <div class="row my-div-center my-text-center">
            <label class="my-title-size">Contact Us</label>
        </div>

        <div class="col-md-12">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <p class="my-text-center">Thank you for visiting the Anita Designer Wear website. We value your thoughts, suggestions and 
                        comments regarding any aspect of the Anita experience. Please contact us by completing the form below. 
                        You will receive a reply from us shortly. </p>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="col-md-12">
                <div class="col-lg-5 thumbnail">
                    <div style="text-decoration:none; overflow:hidden; height:500px; width:1350px; max-width:100%;" >
                        <div id="embed-map-canvas" style="height:100%; width:100%;max-width:100%;">
                            <iframe style="height:100%;width:100%;border:0;" frameborder="0" src="https://www.google.com/maps/embed/v1/place?q=Anita+Designer+Wear,+Desinghe+Mawatha,+Sri+Jayawardenepura+Kotte,+Western+Province,+Sri+Lanka&key=AIzaSyAN0om9mFmy1QN6Wf54tXAowK4eT0ZUPrU"></iframe>
                        </div>
                        <a class="google-maps-html" href="https://www.dog-checks.com" id="make-map-information">www.dog-checks.com</a>
                        <style>#embed-map-canvas .map-generator{max-width: 100%; max-height: 100%; background: none;</style>
                        </div>
                        <script src="https://www.dog-checks.com/google-maps-authorization.js?id=3ab9ea2f-0df1-6384-49d9-e29d65561851&c=google-maps-html&u=1462903926" defer="defer" async="async"></script>

                    </div>
                    <div class="col-md-7">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="col-md-6">
                                    <div class="row">
                                        <label>Name</label>
                                    </div>
                                    <div class="row">
                                        <input type="text" required="" tabindex="1" class="form-control" placeholder="Name" value="">
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <label>Email</label>
                                    </div>
                                    <div class="row">
                                        <input type="text" required="" tabindex="2" class="form-control" placeholder="Email" value="">
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <label>Phone</label>
                                    </div>
                                    <div class="row">
                                        <input type="text" required="" tabindex="3" class="form-control" placeholder="Phone" value="">
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <label>Subject</label>
                                    </div>
                                    <div class="row">
                                        <input type="text" required="" tabindex="4" class="form-control" placeholder="Subject" value="">
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <label>Message</label>
                                    </div>
                                    <div class="row">
                                        <textarea rows="5" cols="40" placeholder="Message" class="form-control"></textarea>
                                    </div>
                                    <br/>
                                    <div class="pull-right">
                                        <button class="btn btn-primary my-btn-width">Send</button>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="panel panel-danger">
                                        <div class="panel-body">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <label>ADDRESS</label>
                                                    <br/>
                                                    44, Vimukthi Mawatha, Pelawatta, Battaramulla.
                                                </div>   
                                                <br/>
                                                <div class="row">
                                                    <label>TELEPHONE</label>
                                                    <br/>
                                                    +94716048774 / +94714066566 / +94112073508
                                                </div> 
                                                <br/>
                                                <div class="row">
                                                    <label>FAX</label>
                                                    <br/>
                                                    +94112073508
                                                </div>
                                                <br/>
                                                <div class="row">
                                                    <label>EMAIL</label>
                                                    <br/>
                                                    anitadwear@gmail.com
                                                </div>
                                            </div>                                        
                                        </div>
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
