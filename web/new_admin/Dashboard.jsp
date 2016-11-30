<%-- 
    Document   : Dashboard
    Created on : Sep 23, 2016, 11:32:21 AM
    Author     : Sevi
--%>

<%@page import="POJOS.Question"%>
<%@page import="POJOS.LoginReg"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="POJOS.OnlineUsers"%>
<%@page import="Src.privilege_class"%>
<%@page import="POJOS.WatchList"%>
<%@page import="POJOS.Utype"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.User"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="Src.objsave"%>
<%@page import="POJOS.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            google.charts.setOnLoadCallback(drawChart);
        </script>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Dashboard</strong></h3>
        <% //if (request.getSession().getAttribute("user_obj").toString() != null) {
            //  privilege_class p = new privilege_class();
            //   User su = (User) request.getSession().getAttribute("user_obj");
            //   if (p.getPrivilage(su.getIduser().toString(), request.getRequestURI())) {%>
        <div class="row">
            <div class="col-md-3">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-comments fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <%
                                    Session ses = objsave.getses();
                                    Criteria c = ses.createCriteria(Message.class);
                                    Utype uty = (Utype) objsave.getses().load(Utype.class, 4);
                                    c.add(Restrictions.eq("utype", uty));
                                    c.setProjection(Projections.sum("newmes"));
                                    int coun = Integer.parseInt(c.uniqueResult().toString());
                                %>
                                <div><strong style="font-size: 35px"><%=coun%></strong></div>
                                <div><strong>Messages</strong></div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer" onclick="messages()">
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
                                <i class="fa fa-user-secret fa-5x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <%
                                    Criteria c1 = ses.createCriteria(OnlineUsers.class);
                                    c1.setProjection(Projections.count("user"));
                                    int online = Integer.parseInt(c1.uniqueResult().toString());
                                %>
                                <div><strong style="font-size: 35px"><%=online%></strong></div>
                                <div><strong>Online Users</strong></div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer" onclick="online_users()">
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
                                <%
                                    Criteria uc = ses.createCriteria(User.class);
                                    Utype ut = (Utype) ses.load(Utype.class, 4);
                                    uc.add(Restrictions.eq("utype", ut));
                                    uc.setProjection(Projections.count("utype"));
                                    int users = Integer.parseInt(uc.uniqueResult().toString());
                                %>
                                <div><strong style="font-size: 35px"><%=users%></strong></div>
                                <div><strong>Total Users</strong></div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer" onclick="all_users()">
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
                                <%
                                    Date d = new Date();
                                    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
                                    String date = sd.format(d);
                                    Date toda = sd.parse(date);
                                    Criteria lrc = objsave.getses().createCriteria(LoginReg.class);
                                    lrc.add(Restrictions.eq("indate", toda));
                                    lrc.setProjection(Projections.count("login"));
                                    int daily = Integer.parseInt(lrc.uniqueResult().toString());
                                %>


                                <div><strong style="font-size: 35px"><%=daily%></strong></div>
                                <div><strong>Daily Visited</strong></div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer" onclick="daily_visited()">
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
                                <%
                                    Criteria watc = ses.createCriteria(WatchList.class);
                                    watc.setProjection(Projections.count("item"));
                                    int watchcount = Integer.parseInt(watc.uniqueResult().toString());
                                %>
                                <div><strong style="font-size: 35px"><%=watchcount%></strong></div>
                                <div><strong>Watched Items</strong></div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer" onclick="watched_item()">
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
                                <%
                                    Criteria quc = ses.createCriteria(Question.class);
                                    quc.setProjection(Projections.count("item"));
                                    int qucount = Integer.parseInt(quc.uniqueResult().toString());
                                %>
                                <div><strong style="font-size: 35px"><%=qucount%></strong></div>
                                <div><strong>Questions</strong></div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer" onclick="question()">
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
        <%//} else {
        %>
        <!--        <div class="col-md-12" style='position:absolute;z-index:0;left:0;top:0;width:100%;height:100%'>
                    <img src='../img/no_access.jpg' style='width:100%;height:450px' alt='[]' />
                </div>-->
        <%
            //    }
            //   }%>
    </body>
</html>
