<%-- 
    Document   : test
    Created on : Jun 5, 2016, 6:34:41 PM
    Author     : Sevi
--%>

<%@page import="POJOS.Advertisement"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.User"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="Src.objsave"%>
<%@page import="POJOS.Message"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <!-- Start WOWSlider.com HEAD section -->
        <link rel="stylesheet" type="text/css" href="message_slider_data/engine1/style.css" />
        <script type="text/javascript" src="message_slider_data/engine1/jquery.js"></script>
        <!-- End WOWSlider.com HEAD section -->
        <script>

            function adimin_msge() {
                //alert("okk");
                var message_btn = document.getElementById('message_btn').innerHTML;
                var message = document.getElementById('user_message').value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                        alert(xhttp.responseText);
                        //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("POST", "user_message?user_message=" + message + "&message_btn=" + message_btn, true);
                xhttp.send();
            }
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


            function load_messages() {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                        alert(xhttp.responseText);
                        //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("POST", "user_message?loadmes=ok", true);
                xhttp.send();
            }
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="site/header.jsp" %>
        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <!-- Start WOWSlider.com BODY section -->
                        <div id="wowslider-container1">
                            <div class="ws_images"><ul>
                                    <%
                                        List<Advertisement> liad = objsave.getses().createCriteria(Advertisement.class).add(Restrictions.eq("page", "message")).list();
                                        for (Advertisement itemad : liad) {
                                    %>
                                    <li><img src="<%=itemad.getUrl()%>" alt="" title="" id="wows1_0"/></li>
                                        <%}%>
                                </ul></div>
                            <div class="ws_bullets">
                                <!--                                <div>
                                                                    <a href="#" title=""><span><img src="message_slider_data/data1/tooltips/56cca3711500002b000b08aa.jpg" alt=""/>1</span></a>
                                                                    <a href="#" title=""><span><img src="message_slider_data/data1/tooltips/1963cocacolaadvertisement.jpg" alt=""/>2</span></a>
                                                                    <a href="#" title=""><span><img src="message_slider_data/data1/tooltips/brand.jpg" alt=""/>3</span></a>
                                                                    <a href="#" title=""><span><img src="message_slider_data/data1/tooltips/maxresdefmault.jpg" alt=""/>4</span></a>
                                                                    <a href="#" title=""><span><img src="message_slider_data/data1/tooltips/nikerun.jpg" alt=""/>5</span></a>
                                                                    <a href="#" title=""><span><img src="message_slider_data/data1/tooltips/shirtworksnew.png" alt=""/>6</span></a>
                                                            <div class="ws_shadow"></div>
                                                        </div>	-->
                                <script type="text/javascript" src="message_slider_data/engine1/wowslider.js"></script>
                                <script type="text/javascript" src="message_slider_data/engine1/script.js"></script>
                                <!-- End WOWSlider.com BODY section -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="col-md-8 col-md-offset-2" id="loadmessage">
                        <%

                            User u = (User) request.getSession().getAttribute("user_obj");
                            String uid=u.getIduser().toString();
                            //out.write(uid);
                            String sql = "SELECT * FROM message WHERE mto='" + uid + "' OR mfrom='" + uid + "'";
                            SQLQuery query = objsave.getses().createSQLQuery(sql);
                            query.addEntity(Message.class);
                            List<Message> list = query.list();
                            //List<Message> list = objsave.getses().createCriteria(Message.class).add(Restrictions.or(Restrictions.eq("userByMto", user),Restrictions.eq("userByMfrom", user))).list();
                            for (Message mes : list) {
                        %>

                        <div class="row">
                            <div class="col-md-2">
                                <script>
            alert(<%=mes.getMessage()%>);
                                </script>
                                <img src="<%if (mes.getUtype().getIdutype() == 4) {
                                        out.write(user.getImg());
                                    } else {
                                        out.write("img/anita.ico");
                                    }%>" style="width: 50px"/>
                            </div>
                            <div class="col-md-6">
                                <p style="text-align: justify"><%=mes.getMessage()%></p>
                            </div>
                        </div>
                        <br/>
                        <%

                            }%>
                        <!--                <div class="row">
                                            <div class="col-md-11 text-right">
                                                <p>smkscm mkmkmksmc mc kd mck mk</p>
                                            </div>
                                            <div class="col-md-1">
                                                <img src="img/anita.ico" style="width: 50px"/>
                                            </div>
                                        </div>-->
                        <br/>
                        <div class="col-md-10 col-md-offset-1">
                            <div class="row">
                                <textarea class="form-control" rows="5" id="user_message"></textarea>
                            </div>
                            <br/>
                            <div class="row text-right">
                                <button class="btn btn-primary" style="width: 100px" id="message_btn" onclick="adimin_msge()">Send</button>
                            </div>
                        </div>
                    </div>
                </div>
                <br/>

                <%@include file="site/footer.jsp" %>
                </body>
                </html>
