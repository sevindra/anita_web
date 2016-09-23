<%-- 
    Document   : main
    Created on : Sep 21, 2016, 12:28:13 PM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="inc.jsp" %>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script>
            google.charts.load('current', {'packages': ['bar']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['2016', 'Sales', 'Expenses', 'Profit'],
                    ['Jan', 1000, 400, 200],
                    ['Feb', 1170, 460, 250],
                    ['March', 660, 1120, 300],
                    ['April', 1030, 540, 350],
                    ['May', 1030, 540, 350],
                    ['Jun', 1030, 540, 350],
                    ['Jul', 1030, 540, 350],
                    ['Aug', 1030, 540, 350],
                    ['Sep', 1030, 540, 350],
                    ['Oct', 1030, 540, 350],
                    ['Nov', 1030, 540, 350],
                    ['Dec', 1030, 540, 350]
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
        </script>
    </head>
    <body>
        <%@include file="admin_header.jsp" %>


        <%@include file="admin_left_panel.jsp" %>
        <div class="col-md-9 mypadin35">
            <h3 style="margin-top: -20px"><strong>Dashboard</strong></h3>
            
            <div class="row">
                <div class="col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div><strong style="font-size: 35px">26</strong></div>
                                    <div><strong>Messages</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-envelope-o fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div><strong style="font-size: 35px">10</strong></div>
                                    <div><strong>Email</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div><strong style="font-size: 35px">10</strong></div>
                                    <div><strong>Orders</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-users fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div><strong style="font-size: 35px">120</strong></div>
                                    <div><strong>Total Users</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="glyphicon glyphicon-user fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div><strong style="font-size: 35px">26</strong></div>
                                    <div><strong>Daily Visited</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-database fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div><strong style="font-size: 35px">10</strong></div>
                                    <div><strong>Low Stock</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-eye fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div><strong style="font-size: 35px">120</strong></div>
                                    <div><strong>Watched Items</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-question fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div><strong style="font-size: 35px">10</strong></div>
                                    <div><strong>Questions</strong></div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>


            </div>

            <div id="chart_div" class="col-md-12"></div>
            <br/>
            <!--            <div id="btn-group">
                            <button class="button button-blue" id="none">No Format</button>
                            <button class="button button-blue" id="scientific">Scientific Notation</button>
                            <button class="button button-blue" id="decimal">Decimal</button>
                            <button class="button button-blue" id="short">Short</button>
                        </div>-->

        </div>
    </body>
</html>
