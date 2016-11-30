<%-- 
    Document   : main
    Created on : Sep 21, 2016, 12:28:13 PM
    Author     : Sevi
--%>

<%@page import="java.util.Calendar"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Src.objsave"%>
<%@page import="POJOS.Stock"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ANITA ADMIN</title>
        <%@include file="inc.jsp" %>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <noscript>
        <META HTTP-EQUIV="Refresh" CONTENT="0;URL=../error_javascript.jsp">
        </noscript>
        <script>
            <%
                HttpSession hsheader = request.getSession();
                POJOS.User userheader = (POJOS.User) hsheader.getAttribute("user_obj");

                if (userheader == null) {
                    response.sendRedirect("../404.jsp");
                } else {
                    if (userheader.getUtype().getUtype().equals("Super Admin") | userheader.getUtype().getUtype().equals("Admin") | userheader.getUtype().getUtype().equals("User")) {

                    } else {
                        response.sendRedirect("../404.jsp");
                    }
                }

                if (request.getParameter("product") != null) {
                    if (request.getParameter("product").equals("add")) {
            %>
            product();
            <%}
                }%>

            google.charts.load('current', {
                'packages': ['bar']});
            google.charts.setOnLoadCallback(drawChart);




            function drawChart() {
            <%
                Date date = new Date(); // your date
                Calendar cal = Calendar.getInstance();
                cal.setTime(date);
                int year = cal.get(Calendar.YEAR);
                int month = cal.get(Calendar.MONTH);
                month=month+1;
                //int day = cal.get(Calendar.DAY_OF_MONTH);
                
                String d1 = year+"-"+month+"-01";
                String d2 = year+"-"+month+"-30";
                SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
                Date sDate = sd.parse(d1);
                Date eDate = sd.parse(d2);
                Criteria c = objsave.getses().createCriteria(Stock.class);
                c.add(Restrictions.ge("date", sDate));
                c.add(Restrictions.lt("date", eDate));
                c.setProjection(Projections.sum("price"));
                double coun = Double.parseDouble(c.uniqueResult().toString());

            %>
                var data = google.visualization.arrayToDataTable([
                    ['2016', 'Sales', 'Expenses', 'Profit'],
//                    ['Jan', 1000, 400, 200],
//                    ['Feb', 1170, 460, 250],
//                    ['March', 660, 1120, 300],
//                    ['April', 1030, 540, 350],
//                    ['May', 1030, 540, 350],
//                    ['Jun', 1030, 540, 350],
                    ['Jul', 0, 0, 0],
                    ['Aug', 0, 0, 0],
                    ['Sep', 0, 0, 0],
                    ['Oct', 0, 0, 0],
                    ['Nov', 0, <%=coun%>, 0],
                    ['Dec', 0, 0, 0]
                ]);

                var options = {
                    chart: {
                        title: 'Company Performance',
                        subtitle: 'Sales, Expenses, and Profit: 2014-2017',
                    },
                    bars: 'vertical',
                    vAxis: {format: 'decimal'},
                    height: 400,
                    colors: ['#1b9e77', '#d95f02', '#7570b3']
                };

                var chart = new google.charts.Bar(document.getElementById('chart_div'));

                chart.draw(data, google.charts.Bar.convertOptions(options));

                var btns = document.getElementById('btn-group');

                btns.onclick = function (e) {

                    if (e.target.tagName === 'BUTTON') {
                        options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
                        chart.draw(data, google.charts.Bar.convertOptions(options));
                    }
                }
            }
            function question() {
                $('#admin_body').load('item_question.jsp');
            }
            function add_supplier() {
                $('#admin_body').load('Add_supplier.jsp');
            }
            function Dashboard() {
                $('#admin_body').load('Dashboard.jsp');
            }
            function sup_active_deactive() {
                $('#admin_body').load('sup_active_deactive.jsp');
            }
            function category() {
                $('#admin_body').load('category.jsp');
            }
            function subcategory() {
                $('#admin_body').load('sub_category.jsp');
            }
            function product() {
                $('#admin_body').load('product.jsp');
            }
            function product_active_deactive() {
                $('#admin_body').load('product_active_deactive.jsp');
            }
            function add_stock() {
                $('#admin_body').load('add_stock.jsp');
            }
            function messages() {
                $('#admin_body').load('admin_message.jsp');
            }
            function admin_user_message(v) {
                alert(v);
                $('#admin_body').load('admin_user_message.jsp?userid=' + v);

            }
            function add_advertisement() {
                $('#admin_body').load('add_advertisement.jsp');
            }
            function add_privilege() {
                $('#admin_body').load('add_privelage.jsp');
            }
            function add_user() {
                $('#admin_body').load('Add_user.jsp');
            }
            function user_act_deact() {
                $('#admin_body').load('user_act_deact.jsp');
            }
            function online_users() {
                $('#admin_body').load('online_users.jsp');
            }
            function watched_item() {
                $('#admin_body').load('watched_item.jsp');
            }
            function all_users() {
                $('#admin_body').load('all_users.jsp');
            }
            function daily_visited() {
                $('#admin_body').load('daily_visited.jsp');
            }

            function msg_read() {
                var msgid = document.getElementById('msgid').value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                        alert(xhttp.responseText);
                        //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../user_message?read=ok&msgid=" + msgid, true);
                xhttp.send();
            }


        </script>
    </head>
    <body onload="Dashboard();">
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <img src="../img/anita.ico" style="width: 50px; height: 40px; float: left; padding-top: 3px; min-height: 50px; padding-left: 5px; margin-right: 7px"><a class="navbar-brand" href="../index.jsp"><strong style="color: red">ANITA DESIGNER WEAR</strong></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <!--                        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                                <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>-->
                        <li class="">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="fa fa-bell glyphicon_margin"></span> Notification<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a id="watch" href="#"><span class="glyphicon glyphicon-user"></span> Message</a></li>
                                <li><a id="watch" href="#"><span class="fa fa-gear glyphicon_margin"></span> Email</a></li>
                                <li><a href="#"><span class="fa fa-shopping-cart glyphicon_margin"></span> Orders</a></li>
                                <li><a href="#"><span class="fa fa-database glyphicon_margin"></span> Low Stock</a></li>
                                <li><a href="#"><span class="fa fa-eye glyphicon_margin"></span> Watched Items</a></li>
                                <li><a href="#"><span class="fa fa-users glyphicon_margin"></span> Total Users</a></li>
                                <li><a href="#"><span class="fa fa-user glyphicon_margin"></span> Daily Visited</a></li>
                                <li><a href="#"><span class="fa fa-question glyphicon_margin"></span> Questions</a></li>

                            </ul>
                        </li>
                        <li class="">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-user"></span><%                                if (userheader != null) {
                                    out.print(userheader.getFname());
                                } else {
                                    out.print("user null");
                                }
                                %><span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a id="watch" href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                                <li><a id="watch" href="#"><span class="fa fa-gear glyphicon_margin"></span> Settings</a></li>
                                <li class="divider"></li>
                                <li><a href="../logout?user=admin"><span class="fa fa-power-off glyphicon_margin"></span> Logout</a></li>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="col-md-2 mypadin35">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a onclick="Dashboard();" href="#"><span class="fa fa-dashboard glyphicon_margin"></span> DashBoard</a>
                        </h4>
                    </div>

                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#cat2"><span class="fa fa-truck glyphicon_margin"></span> Add Stock</a>
                        </h4>
                    </div>
                    <div id="cat2" class="panel-collapse collapse">
                        <ul class="list-group">
                            <a href="#"><li class="list-group-item" onclick="add_stock()">GRN</li></a>
                            <li class="list-group-item">Two</li>
                            <li class="list-group-item">Three</li>
                        </ul>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#cat3"><span class="glyphicon glyphicon-pencil"></span> Product</a>
                        </h4>
                    </div>
                    <div id="cat3" class="panel-collapse collapse">
                        <ul class="list-group">
                            <li class="list-group-item"><a onclick="category()" href="#">Category</a></li>
                            <li class="list-group-item"><a onclick="subcategory()" href="#">Sub Category</a></li></li>
                            <li class="list-group-item"><a onclick="product()" href="#">Product</a></li></li>
                            <li class="list-group-item"><a onclick="product_active_deactive()" href="#">Active/Deactive</a></li></li>
                        </ul>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#cat4"><span class="glyphicon glyphicon-briefcase"></span> Supplier</a>
                        </h4>
                    </div>
                    <div id="cat4" class="panel-collapse collapse">
                        <ul class="list-group">
                            <li class="list-group-item"><a onclick="add_supplier();" href="#">Add Supplier</a></li>
                            <li class="list-group-item"><a onclick="sup_active_deactive();" href="#">Active/Deactive</a></li>
                        </ul>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#cat5"><span class="fa fa-calculator glyphicon_margin"></span> Report</a>
                        </h4>
                    </div>
                    <div id="cat5" class="panel-collapse collapse">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="#">one</a></li>
                            <li class="list-group-item">Two</li>
                            <li class="list-group-item">Three</li>
                        </ul>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#cat6"><span class="fa fa-newspaper-o glyphicon_margin"></span> Advertisement</a>
                        </h4>
                    </div>
                    <div id="cat6" class="panel-collapse collapse">
                        <ul class="list-group">
                            <li class="list-group-item"><a onclick="add_advertisement()" href="#">Add Advertisement</a></li>
                            <li class="list-group-item"><a href="#">Active/Deactive</a></li>
                        </ul>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapse7"><span class="fa fa-calculator glyphicon_margin"></span> User Management</a>
                        </h4>
                    </div>
                    <div id="collapse7" class="panel-collapse collapse">
                        <ul class="list-group">
                            <li class="list-group-item"><a onclick="add_user()" href="#">Add User</a></li>
                            <li class="list-group-item"><a onclick="user_act_deact()" href="#">Act / Deactive</a></li>
                            <li class="list-group-item"><a onclick="add_privilege()" href="#">User privilege</a></li>
                        </ul>
                    </div>
                </div>
            </div> 
        </div>

        <div class="col-md-10 mypadin35" id="admin_body">


        </div>
    </body>
</html>
