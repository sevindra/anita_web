<%-- 
    Document   : Item_details
    Created on : May 27, 2016, 9:19:03 AM
    Author     : Sevi
--%>

<%@page import="org.hibernate.SQLQuery"%>
<%@page import="POJOS.Stock"%>
<%@page import="POJOS.Advertisement"%>
<%@page import="POJOS.WatchList"%>
<%@page import="POJOS.Size"%>
<%@page import="POJOS.Color"%>
<%@page import="POJOS.State"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="POJOS.ItemImage"%>
<%@page import="Src.objsave"%>
<%@page import="POJOS.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<script src="zoom_js/jquery-1.8.3.min.js" type="text/javascript"></script>-->
        <%@include file="inc.jsp" %>
        <script src="zoom_js/jquery.elevateZoom-3.0.8.min.js" type="text/javascript"></script>
        <script src="zoom_js/jquery.elevatezoom.js" type="text/javascript"></script>
        <!-- Start WOWSlider.com HEAD section -->
        <link rel="stylesheet" type="text/css" href="item_view_slider/engine1/style.css" />
        <!--<script type="text/javascript" src="item_view_slider/engine1/jquery.js"></script>-->
        <!-- End WOWSlider.com HEAD section -->

        <script>
            <%
                String getitemid = request.getParameter("itemid");
                int i = Integer.parseInt(getitemid);

                Item item = (Item) objsave.ses.load(Item.class, i);
                Session ses = objsave.getses();

                Criteria c1 = ses.createCriteria(ItemImage.class);
                c1.add(Restrictions.eq("item", item));
                List<ItemImage> listi = c1.list();
                int topcount = listi.size();
            %>
            $(function () {
            <%
                for (int a = 0; a <= topcount; a++) {
            %>$("#zoom_<%=a%>").elevateZoom();<%
                }
            %>

                });</script>
        <script>
            var color;
            var size;
            $(function () {
                $('.color').hide();
                $('.size').hide();
            });
            function sizecolor() {

                color = $('.color_val').val();
                size = $('.size_val').val();
                if (color == "") {
                    //alert("color");
                    $('.color').show();
                } else {
                    $('.color').hide();
                }
                if (size == "") {
                    $('.size').show();
                } else {

                    $('.size').hide();
                }
                if (size != "") {
                    if (color != "") {
                        search_stock();
                    }
                }
            }
            function buysizecolor() {
                price();
                color = $('.color_val').val();
                size = $('.size_val').val();
                if (color == "") {
                    //alert("color");
                    $('.color').show();
                } else {
                    $('.color').hide();
                }
                if (size == "") {
                    $('.size').show();
                } else {

                    $('.size').hide();
                }
                if (size != "") {
                    if (color != "") {
                        buy();
                    }
                }
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
            jQuery(document).ready(function ($) {

                $('#myCarousel').carousel({
                    interval: 5000
                });
                //Handles the carousel thumbnails
                $('[id^=carousel-selector-]').click(function () {
                    var id_selector = $(this).attr("id");
                    try {
                        var id = /-(\d+)$/.exec(id_selector)[1];
                        console.log(id_selector, id);
                        jQuery('#myCarousel').carousel(parseInt(id));
                    } catch (e) {
                        console.log('Regex failed!', e);
                    }
                });
                // When the carousel slides, auto update the text
                $('#myCarousel').on('slid.bs.carousel', function (e) {
                    var id = $('.item.active').data('slide-number');
                    $('#carousel-text').html($('#slide-content-' + id).html());
                });
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
            function loginfirstbuy() {

            <%                        if (user == null) {%>////
                alert("Please Login First !");
            <%} else {
            %>buysizecolor()<%
                }%>

                }
                function check_to_watch() {

            <%                        if (user == null) {%>////
                    alert("Please Login First !");
            <%} else {
            %>
                    add_to_watch();
            <%
                }%>

                }
                function check_to_watch2() {

            <%                        if (user == null) {%>////
                    alert("Please Login First !");
            <%} else {
            %>

            <%
                }%>

                }



                var d = new Date();
                var monthNames;
                $(document).on('click', '.cat', function () {
                    //alert($(this).parent().html());
                    var catname = $(this).html();
                    var ar = catname.split(">");
                    var ar2 = ar[1];
                    var ar3 = ar2.split("<");
                    //alert(ar3[0]);
//                    $("#catname").val(ar3[0]);
//                    catid=ar3[0];

                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        //alert(xhttp.readyState);
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                            //alert(xhttp.responseText);
                            var day = xhttp.responseText;
                            var tomorrow = new Date();
                            tomorrow.setDate(parseInt(day) + 2 + tomorrow.getDate());
                            //tomorrow.setDate(day + tomorrow.getDate());
                            //alert(tomorrow.getDate() + " dddd-" + day);

                            monthNames = ["Jan:", "Feb:", "Mar:", "Apr:", "May:", "Jun:",
                                "Jul:", "Aug:", "Sep:", "Oct:", "Nov:", "Dec:"
                            ];
                            //alert(monthNames[d.getMonth()] + " " + tomorrow.getDate());
                            document.getElementById('day').innerHTML = monthNames[d.getMonth()] + " " + (d.getDate() + 2) + " and ";
                            document.getElementById('to').innerHTML = monthNames[d.getMonth()] + " " + tomorrow.getDate();
                        }
                    };
                    //alert(catid);
                    xhttp.open("POST", "astemate_date?state=" + ar3[0], true);
                    xhttp.send();
                });
                function setdel() {
                    //price();
                    var d = new Date();
                    var monthNames;
                    monthNames = ["Jan:", "Feb:", "Mar:", "Apr:", "May:", "Jun:",
                        "Jul:", "Aug:", "Sep:", "Oct:", "Nov:", "Dec:"
                    ];
                    document.getElementById('day').innerHTML = monthNames[d.getMonth()] + " " + (d.getDate() + 2) + " and "+monthNames[d.getMonth()]+" "+(d.getDate() + 4);
                }

                function add_to_watch() {
                    var itemid = <%=i%>

                    var xhttp = new XMLHttpRequest();
                    //alert(itemid);
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                            //alert(xhttp.responseText);
                            document.getElementById('watched').innerHTML = xhttp.responseText;
                        }
                    };
                    xhttp.open("POST", "add_to_watch_list?itemid=" + itemid + "&watch=ok", true);
                    xhttp.send();
                }
                function add_to_checkout() {
                    var itemid = <%=i%>

                    var xhttp = new XMLHttpRequest();
                    //alert(itemid);
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                            alert(xhttp.responseText);
                            //document.getElementById('watched').innerHTML = xhttp.responseText;
                        }
                    };
                    xhttp.open("POST", "checkout?itemid=" + itemid + "&watch=ok", true);
                    xhttp.send();
                }

                function cart_qty() {

                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
//                        alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                            alert("added to your cart");
                            document.getElementById('cartqty').innerHTML = xhttp.responseText;
                        }
                    };
                    xhttp.open("POST", "cart_qty?cart=ok", true);
                    xhttp.send();
                }
                function add_to_cart() {
                    var sizeid = document.getElementById('size').value;
                    var colorid = document.getElementById('color').value;
                    var qty = document.getElementById('qty').value;
//                        search_stock();
                    alert(sizeid + colorid + qty + stockid + "check one");
                    var xhttp = new XMLHttpRequest();
                    alert(sizeid + "-" + colorid + "-" + qty);
                    //console.info(sizeid+"-"+colorid+"-"+qty);
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
//                        alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                            alert("added to your cart");
                            //cart_qty();
                            //document.getElementById('watched').innerHTML = xhttp.responseText;
                        }
                    };
                    xhttp.open("POST", "add_to_cart?stockid=" + stockid + "&sizeid=" + sizeid + "&colorid=" + colorid + "&qty=" + qty, true);
                    xhttp.send();
                }
                function un_watch() {
                    var itemid = <%=i%>

                    var xhttp = new XMLHttpRequest();
                    //alert(itemid);
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                            //alert(xhttp.responseText);
                            document.getElementById('watched').innerHTML = xhttp.responseText;
                        }
                    };
            <%
                int uid;
                if (user == null) {
                    uid = 0;
                } else {
                    uid = user.getIduser();
                }
            %>
                    xhttp.open("POST", "add_to_watch_list?itemid=" + itemid + "&unwatch=ok&userid=" +<%=uid%>, true);
                    xhttp.send();
                }
                function qust() {
                    var itemid = document.getElementById('itemid').value;
                    var mes = document.getElementById('mes').value;
                    var xhttp = new XMLHttpRequest();
//                alert(itemid);
//                alert(mes);
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                            alert(xhttp.responseText);
                            //document.getElementById('watched').innerHTML = xhttp.responseText;
                        }
                    };
                    xhttp.open("POST", "item_qst?itemid=" + itemid + "&mes=" + mes, true);
                    xhttp.send();
                }

//                    function search_stock_id() {
//                        var sizeid = document.getElementById('size').value;
//                        var colorid = document.getElementById('color').value;
//                        var pid = document.getElementById('pid').value;
//                        var xhttp = new XMLHttpRequest();
//                        alert(sizeid+colorid+pid);
//                                alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
//                        xhttp.onreadystatechange = function () {
//                            if (xhttp.readyState === 4 && xhttp.status === 200) {
//
//                                alert("stockid get"+xhttp.responseText);
//                                stockid = xhttp.responseText;
//                            }
//                        };
//                        xhttp.open("POST", "search_stockid?size=" + sizeid + "&color=" + colorid + "&pid=" + pid + "&searchstock=ok", true);
//                        xhttp.send();
//                    }

                var stockid;
                function search_stock() {
                    var sizeid = document.getElementById('size').value;
                    var colorid = document.getElementById('color').value;
                    var pid = document.getElementById('pid').value;
                    var xhttp = new XMLHttpRequest();
                    alert("Count:" + sizeid + colorid + pid);
                    var xhttp = new XMLHttpRequest();
                    //console.info(sizeid+"-"+colorid+"-"+qty);

                    xhttp.onreadystatechange = function () {
                        alert(xhttp.readyState + "-" + xhttp.status);
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            alert("stockid get" + xhttp.responseText);
                            stockid = xhttp.responseText;
                            add_to_cart();
                        }
                    };
                    xhttp.open("POST", "search_stockid?size=" + sizeid + "&color=" + colorid + "&pid=" + pid + "&searchstock=ok", true);
                    xhttp.send();
                }

                function price() {
                    var sizeid = document.getElementById('size').value;
                    var colorid = document.getElementById('color').value;
                    var pid = document.getElementById('pid').value;
                    var xhttp = new XMLHttpRequest();
                    //alert("mes");
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                            //alert(xhttp.responseText);
                            document.getElementById('pr').innerHTML = "LKR. " + xhttp.responseText;
                            document.getElementById('pr2').value = xhttp.responseText;
                        }
                    };
                    xhttp.open("POST", "item_price?size=" + sizeid + "&color=" + colorid + "&pid=" + pid + "&getprice=ok", true);
                    xhttp.send();
                }
                function buy() {
                    var sizeid = document.getElementById('size').value;
                    var colorid = document.getElementById('color').value;
                    var pid = document.getElementById('pid').value;
                    var qty = document.getElementById('qty').value;
                    var xhttp = new XMLHttpRequest();
                    //alert("mes");
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
//                        success:function(response) {
                            window.location.href = "checkout.jsp";
                            //alert("ok");
//                        }
                            //alert(xhttp.responseText);
//                        document.getElementById('pr').innerHTML ="LKR. "+ xhttp.responseText;
//                        document.getElementById('pr2').value = xhttp.responseText;
                        }
                    };
                    xhttp.open("POST", "buy?size=" + sizeid + "&color=" + colorid + "&pid=" + pid + "&qty=" + qty + "&getprice=ok", true);
                    xhttp.send();
                }
                function check_qty() {
                    var sizeid = document.getElementById('size').value;
                    var colorid = document.getElementById('color').value;
                    var pid = document.getElementById('pid').value;
                    var qty = document.getElementById('qty').value;
                    var xhttp = new XMLHttpRequest();
                    //alert("mes");
                    xhttp.onreadystatechange = function () {
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
//                        success:function(response) {
                            //window.location.href = "checkout.jsp";
                            //alert("ok");
//                        }
//                            alert(xhttp.responseText);
                        document.getElementById('check_qty').innerHTML =xhttp.responseText;
                       // cal();
//                        document.getElementById('pr2').value = xhttp.responseText;
                        }
                    };
                    xhttp.open("POST", "buy?size=" + sizeid + "&color=" + colorid + "&pid=" + pid + "&qty=" + qty + "&checkqty=ok", true);
                    xhttp.send();
                }

                function checkInp()
                {
                    $('#qty').bind('keyup paste', function () {
                        this.value = this.value.replace(/[^0-9]/g, '');
                    });
                 //check_qty();   
                }
                function cal()
                {
                    price();
                   var pric= document.getElementById('pr2').value;
                   var qty= document.getElementById('qty').value;
                    alert(pric+qty);
                   document.getElementById('pr').value=pric*qty;
                   document.getElementById('pr2').value=pric*qty;
                }

                //alert("The current month is " + monthNames[d.getMonth()]);
        </script>

        <title>Item Name</title>
    </head>
    <body onload="setdel()">
        <%@include file="site/header.jsp" %>
        <%@include file="site/search_bar.jsp" %>
        <br/>
        <br/>
        <br/>
        <div class="col-md-12">
            <!--<button onclick="search_stock_id()">aaa</button>-->
            <!--<form>-->
            <div class="row">
                <div class="col-md-5">
                    <div class="col-md-12" id="slider" style="margin-top: 20px">
                        <!-- Top part of the slider -->
                        <div class="row">
                            <div class="col-md-12" id="carousel-bounding-box">
                                <div class="carousel slide" id="myCarousel">
                                    <!-- Carousel items -->
                                    <div class="carousel-inner">
                                        <%
                                            topcount = 0;
                                            for (ItemImage ii : listi) {
                                        %>
                                        <div class="<%if (topcount == 0) {
                                                out.write("active");
                                            }%> item" data-slide-number="<%=topcount%>">
                                            <img id="zoom_<%=topcount%>" src="<%=ii.getUrl()%>" data-zoom-image="<%=ii.getUrl()%>">
                                        </div>
                                        <%
                                                topcount++;
                                            }%>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="col-md-12" style="margin-top: 20px">
                            <div class='row' style="text-align: center">
                                <%  Criteria c0 = ses.createCriteria(ItemImage.class);
                                    c0.add(Restrictions.eq("item", item));
                                    List<ItemImage> list = c0.list();
                                    int coun = 0;
                                    for (ItemImage itemimagee : list) {

                                %>
                                <div class="" style="width: 15%;display: inline-block">
                                    <a class="thumbnail" id="<%="carousel-selector-" + coun%>"><img src="<%out.write(itemimagee.getUrl());%>"></a>
                                </div> 
                                <script>
                                    $(function () {
                                        $("#zoom_01").elevateZoom();
                                    });</script>
                                    <%coun++;
                                    }%>


                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-7">
                    <div class="row">
                        <h3><%=item.getItemname()%></h3>
                        <div style="border: solid 1px #cccccc"></div>  
                    </div>
                    <div class="col-md-7">
                        <br/>
                        <div class="row">
                            <div class="col-md-3 text-right">
                                <h5>Color : </h5> 
                            </div>
                            <div class="col-md-9">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <select class="form-control color_val" required="" name="color" id="color" onchange="price()">
                                            <option value="">-Select-</option>
                                            <%
                                                //List<Color> clist = objsave.getses().createCriteria(Color.class).add(Restrictions.eq("item", item))).list();
//                                                Criteria crs = objsave.getses().createCriteria(Stock.class);
//                                                crs.add(Restrictions.eq("item", item));
//                                                crs.add(Restrictions.eq("status", 1));
//                                                crs.setProjection(Projections.groupProperty("item"));
                                            
                                                String sql = "SELECT * FROM stock where iditem='" + item.getIditem() + "' group by color_idcolor";
                                                SQLQuery query = objsave.getses().createSQLQuery(sql);
                                                query.addEntity(Stock.class);
                                                List<Stock> clist = query.list();
                                                for (Stock cl : clist) {
                                                    //crs.add(Restrictions.eq("color",cl.getIdcolor()));
%>
                                            <option value="<%=cl.getColor().getIdcolor()%>"><%=cl.getColor().getColor()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 text-right">

                            </div>
                            <div class="col-md-9">
                                <div class="col-md-10 color">
                                    <span class="glyphicon glyphicon-remove-sign myred"></span><strong class="myred">Please select color</strong>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 text-right">
                                <h5>Size : </h5> 
                            </div>
                            <div class="col-md-9">
                                <div class="col-md-10">
                                    <div class="">
                                        <select class="form-control size_val" required="" name="size" id="size" onchange="price()">
                                            <option value="">-Select-</option>
                                            <%
//                                                List<Size> zlist = objsave.getses().createCriteria(Size.class).add(Restrictions.eq("item", item)).list();
                                                String sqlz = "SELECT * FROM stock where iditem='" + item.getIditem() + "' group by size_idsize";
                                                SQLQuery queryz = objsave.getses().createSQLQuery(sqlz);
                                                queryz.addEntity(Stock.class);
                                                List<Stock> zlist=queryz.list();
                                                for (Stock zl : zlist) {
                                                    //crs.add(Restrictions.eq("size", zl.getIdsize()));
%>
                                            <option value="<%=zl.getSize().getIdsize() %>"><%=zl.getSize().getSize() %></option>
                                            <%}%>
                                        </select>

                                    </div>
                                </div>
                                <div class="col-md-1"  style="margin-left: -30px; margin-top: 3px">
                                    <span class="input-group-addon">
                                        <a href="#" data-toggle="modal" data-target="#myModal"><span class="fa fa-info"></span></a>
                                    </span>
                                </div>
                            </div>
                            <div id="myModal" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <!--<img src="img/size.PNG" class="img-responsive"/>-->
                                            <table class="table table-striped table-bordered">
                                                <thead>
                                                <th>Size</th>
                                                <th>Shoulder Wide</th>
                                                <th>Chest</th>
                                                <th>Length</th>
                                                <th>Sleeve</th>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>SL XS</td>
                                                        <td>40cm</td>
                                                        <td>92cm</td>
                                                        <td>65cm</td>
                                                        <td>61cm</td>
                                                    </tr>
                                                    <tr>
                                                        <td>SL S</td>
                                                        <td>42cm</td>
                                                        <td>96cm</td>
                                                        <td>70cm</td>
                                                        <td>65cm</td>
                                                    </tr>
                                                    <tr>
                                                        <td>SL M</td>
                                                        <td>44cm</td>
                                                        <td>100cm</td>
                                                        <td>75cm</td>
                                                        <td>69cm</td>
                                                    </tr>
                                                    <tr>
                                                        <td>SL L</td>
                                                        <td>46cm</td>
                                                        <td>104cm</td>
                                                        <td>80cm</td>
                                                        <td>73cm</td>
                                                    </tr>
                                                    <tr>
                                                        <td>SL XL</td>
                                                        <td>48cm</td>
                                                        <td>108cm</td>
                                                        <td>85cm</td>
                                                        <td>77cm</td>
                                                    </tr>
                                                    <tr>
                                                        <td>SL 2XL</td>
                                                        <td>50cm</td>
                                                        <td>112cm</td>
                                                        <td>90cm</td>
                                                        <td>81cm</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div id="myModal2" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <%
                                                        Criteria c12 = ses.createCriteria(ItemImage.class);
                                                        c12.add(Restrictions.eq("item", item));
                                                        //c1.setFirstResult(1);
                                                        c12.setMaxResults(1);
                                                        List<ItemImage> itemimage = c12.list();
                                                        for (ItemImage i2 : itemimage) {
                                                    %><img src="<%out.write(i2.getUrl());%>" width="200" height="150"/><%
                                                        }
                                                    %>
                                                </div>
                                                <div class="col-md-8">
                                                    <h4><%=item.getItemname()%></h4>
                                                    <div style="border: solid 1px #cccccc"></div>
                                                    <br/>
                                                    <input type="hidden" id="itemid" value="<%=item.getIditem()%>"/>
                                                    <textarea class="form-control" placeholder="Message" id="mes"></textarea>
                                                    <br/>
                                                    <button class="btn btn-primary pull-right" onclick="qust()">Send</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 text-right">

                            </div>
                            <div class="col-md-9">
                                <div class="col-md-10 size">
                                    <span class="glyphicon glyphicon-remove-sign myred"></span><strong class="myred">Please select size</strong>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 text-right">
                                <h5>Qty : </h5> 
                            </div>
                            <div class="col-md-9">
                                <div class="col-md-4">
                                    <input type="text" placeholder="Qty" class="form-control" name="qty" required="" value="1" id="qty" onkeypress="checkInp()" onkeyup="check_qty()"/>

                                </div>
                                <div class="col-md-8" id="check_qty">
                                    <!--<h5 style="color: #00cc33" ><strong>Out of Stock</strong></h5>-->
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="well">
                                <div class="row">
                                    <div class="col-md-3 text-right">
                                        <h5>Price : </h5>
                                    </div> 
                                        <%
                                            Criteria cl = ses.createCriteria(Stock.class);
                                            cl.add(Restrictions.eq("item", item));
                                            //c1.setFirstResult(1);
                                            cl.setMaxResults(1);
                                            List<Stock> sd = cl.list();
                                            for (Stock i2 : sd) {

                                        %>
                                    <div class="col-md-4">

                                        <h4><strong>LKR. </strong><strong id="pr"><%out.write(i2.getPrice().toString());%></strong></h4>
                                    </div>
                                        <input type="hidden" name="pr2"id="pr2" value="<%out.write(i2.getPrice().toString());%>"/>
                                        <%
                                            }%>
                                    <div class="col-md-4">
                                        <button class="btn btn-primary form-control" onclick="loginfirstbuy()" type="submit">Buy It Now</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 text-right">

                                    </div> 
                                    <div class="col-md-4">
                                        
                                        <!--<h5>1 Watching</h5>-->

                                    </div>
                                    <div class="col-md-4">
                                        <button class="btn btn-success form-control" onclick="sizecolor();">Add To Cart</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 text-right">

                                    </div> 
                                    <div class="col-md-4">

                                    </div>
                                    <div class="col-md-5" id="watched">
                                        <%                                                WatchList watchitem = (WatchList) objsave.getses().createCriteria(WatchList.class).add(Restrictions.and(Restrictions.eq("item", item), Restrictions.eq("user", user))).uniqueResult();
                                            if (watchitem == null) {

                                        %>
                                        <a href="#" onclick="check_to_watch()"><h6><span class="glyphicon glyphicon-eye-open"></span>Add to watch list </h6></a>
                                        <a href="#" data-toggle="modal" data-target="<%if (user != null) {%>#myModal2<%}%>" onclick="check_to_watch2()"><h6><span class="glyphicon glyphicon-question-sign"></span>Question about this item</h6></a>

                                        <%} else {%>
                                        <a href="#" onclick="un_watch()"><h6><span class="glyphicon glyphicon-eye-open"></span>Watched<span class="glyphicon glyphicon-ok" style="color: #00cc33; margin-left: 10px"></span></h6></a>
                                        <a href="#" data-toggle="modal" data-target="<%if (user != null) {%>#myModal2<%}%>" onclick="check_to_watch2()"><h6><span class="glyphicon glyphicon-question-sign"></span>Question about this item</h6></a>
                                                    <%}%>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1">
                                        <h5><strong>Description</strong></h5>
                                        <%=item.getDescription()%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 text-right">
                                <h5>Delivery : </h5> 
                            </div>
                            <div class="col-md-9">
                                <h5>Western - Rs.150<a href="#" data-toggle="collapse" data-target="#demo"><span class="fa fa-plus-square" style="margin-left: 10px"></span></a></h5>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 text-right">

                            </div>
                            <div class="col-md-9">
                                <div class="collapse" id="demo">
                                    <table class="table table-striped table-condensed table-responsive table-hover">
                                        <thead>
                                        <th>Province</th>
                                        <th>LKR.</th>
                                        </thead>
                                        <tbody>
                                            <%
                                                List<State> liststate = objsave.getses().createCriteria(State.class).list();
                                                for (State state : liststate) {
                                            %>
                                            <tr class="cat">
                                                <td><%=state.getState()%></td>
                                                <td><%=state.getDeliveryPrice()%></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table> 
                                </div>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-md-3 text-right">
                                <h5></h5> 
                            </div>
                            <div class="col-md-9">
                                <h5>Estimated between <strong id="day"></strong><strong id="to"></strong></h5>
                                <h6 style="color: #666666">Delivery within 2 days after receiving cleared payment</h6>
                            </div>
                        </div>

                    </div>
                    <br/>
                    <div class="col-md-5">
                        <div class="panel panel-default">
                            <div class="panel-body text-center">
                                Advertisement
                                <!-- Start WOWSlider.com BODY section -->
                                <div id="wowslider-container1">
                                    <div class="ws_images"><ul>
                                            <%
                                                List<Advertisement> liad = objsave.getses().createCriteria(Advertisement.class).add(Restrictions.eq("page", "itemview")).list();
                                                for (Advertisement itemad : liad) {
                                            %>
                                            <li><img src="<%=itemad.getUrl()%>" alt="" title="" id="wows1_0"/></li>
                                                <%}%>
                                            <!--                                                <li><img src="item_view_slider/data1/images/d262648a8026f7b2c8a70a32b1c54a56.jpg" alt="" title="" id="wows1_1"/></li>
                                                                                            <li><a href=""><img src="item_view_slider/data1/images/summerclearanceclothingsale.jpg" alt="wow slider" title="" id="wows1_2"/></a></li>
                                                                                            <li><img src="item_view_slider/data1/images/tumblr_ndbebxkbni1qivqslo1_1280.jpg" alt="" title="" id="wows1_3"/></li>-->
                                        </ul></div>
                                    <div class="ws_bullets">
                                        <!--                                            <div>
                                                                                        <a href="#" title=""><span><img src="item_view_slider/data1/tooltips/advertisement_image1_010062.jpg" alt=""/>1</span></a>
                                                                                        <a href="#" title=""><span><img src="item_view_slider/data1/tooltips/d262648a8026f7b2c8a70a32b1c54a56.jpg" alt=""/>2</span></a>
                                                                                        <a href="#" title=""><span><img src="item_view_slider/data1/tooltips/summerclearanceclothingsale.jpg" alt=""/>3</span></a>
                                                                                        <a href="#" title=""><span><img src="item_view_slider/data1/tooltips/tumblr_ndbebxkbni1qivqslo1_1280.jpg" alt=""/>4</span></a>
                                                                                        <div class="ws_shadow"></div>
                                                                                    </div>	-->
                                        <script type="text/javascript" src="engine1/wowslider.js"></script>
                                        <script type="text/javascript" src="engine1/script.js"></script>
                                        <!-- End WOWSlider.com BODY section -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        Criteria stcri = objsave.getses().createCriteria(Stock.class);
                        stcri.add(Restrictions.eq("item", item));
                        stcri.add(Restrictions.eq("item", item));
                    %>

                    <input type="hidden" name="pid" value="<%=item.getIditem()%>" id="pid"/>
                    <input type="hidden" name="stockid" value="" id="stockid"/>
                </div>

            </div>
            <!--</form>-->
        </div>
        <div class="container-fluid">

        </div>
        <%@include file="site/footer.jsp" %>
    </body>
</html>
