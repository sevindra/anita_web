<%-- 
    Document   : Contact
    Created on : May 10, 2016, 10:34:35 PM
    Author     : Sevi
--%>

<%@page import="Src.email"%>
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

            function mail() {
                var ename = document.getElementById('ename').value;
                var email = document.getElementById('eemail').value;
                var phone = document.getElementById('ephone').value;
                var subject = document.getElementById('esubject').value;
                var message = document.getElementById('emessage').value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
//                        alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                        //alert(xhttp.responseText);

                        document.getElementById('sende').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "admin_email?ename=" + ename + "&email=" + email + "&phone=" + phone + "&subject=" + subject + "&message=" + message + "&mail=ok", true);
                xhttp.send();
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
                    <script src='https://maps.googleapis.com/maps/api/js?v=3.exp&key= AIzaSyDj-0OFGfS8broQ_wsZ9MyJGg05Vd42AGA '></script><div style='overflow:hidden;height:400px;width:600px;'><div id='gmap_canvas' style='height:400px;width:600px;'></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div> <a href='https://embed-map.org/'>google map for my website</a> <script type='text/javascript' src='https://embedmaps.com/google-maps-authorization/script.js?id=5e82de199aa08578b6f635056e25f91a7d4fa945'></script><script type='text/javascript'>function init_map() {
                var myOptions = {zoom: 17, center: new google.maps.LatLng(6.894126356317753, 79.93437198657762), mapTypeId: google.maps.MapTypeId.ROADMAP};
                map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
                marker = new google.maps.Marker({map: map, position: new google.maps.LatLng(6.894126356317753, 79.93437198657762)});
                infowindow = new google.maps.InfoWindow({content: '<strong>Anita Designer Wear</strong><br>626/1A, Desinghe Mawatha, Sri Jayawardenepura Kotte 10120<br>1120 Colombo<br>'});
                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.open(map, marker);
                });
                infowindow.open(map, marker);
            }
            google.maps.event.addDomListener(window, 'load', init_map);</script>
                </div>
                <div class="col-md-7">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="col-md-6">
                                <div class="row">
                                    <label>Name</label>
                                </div>
                                <div class="row">
                                    <input type="text" required="" tabindex="1" class="form-control" placeholder="Name" value="" id="ename">
                                </div>
                                <br/>
                                <div class="row">
                                    <label>Email</label>
                                </div>
                                <div class="row">
                                    <input type="text" required="" tabindex="2" class="form-control" placeholder="Email" value="" id="eemail">
                                </div>
                                <br/>
                                <div class="row">
                                    <label>Phone</label>
                                </div>
                                <div class="row">
                                    <input type="text" required="" tabindex="3" class="form-control" placeholder="Phone" value="" id="ephone">
                                </div>
                                <br/>
                                <div class="row">
                                    <label>Subject</label>
                                </div>
                                <div class="row">
                                    <input type="text" required="" tabindex="4" class="form-control" placeholder="Subject" value="" id="esubject">
                                </div>
                                <br/>
                                <div class="row">
                                    <label>Message</label>
                                </div>
                                <div class="row">
                                    <textarea rows="5" cols="40" placeholder="Message" class="form-control" id="emessage"></textarea>
                                </div>
                                <br/>
                                <div class="row">
                                    <div class="col-md-12" id="sende">
                                    </div>
                                </div>
                                <br/>
                                <div class="pull-right">
                                    <button class="btn btn-primary my-btn-width" onclick="mail()">Send</button>
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
