<%-- 
    Document   : admin_message
    Created on : Oct 22, 2016, 11:05:20 AM
    Author     : Sevi
--%>

<%@page import="POJOS.User"%>
<%@page import="Src.privilege_class"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.Message"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Src.objsave"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Messages</strong></h3>
        <%if (request.getSession().getAttribute("user_obj").toString() != null) {
                 privilege_class p = new privilege_class();
                 User su = (User) request.getSession().getAttribute("user_obj");
                 if (p.getPrivilage(su.getIduser().toString(), request.getRequestURI())) {%>
        <div class="container-fluid">
            <div class="container">

                <div class="row">

                    <div class="col-md-12">
                        <!-- Nav tabs -->
                        <div class="">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#home" data-toggle="tab"><span class="glyphicon glyphicon-inbox"></span>Messages</a>
                                </li>
                                <!--                                <li>
                                                                    <a href="#profile" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>Message from ANITA</a>
                                                                </li>-->
                                <!--                                <li>
                                                                    <a href="#messages" data-toggle="tab"><span class="glyphicon glyphicon-inbox"></span>Sent</a></li>-->

                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="home">
                                    <div class="list-group">
                                        <%

                                            String sql = "SELECT * FROM message where utype_idutype=1 or utype_idutype=2 or utype_idutype=3 ORDER BY idmessage DESC";
                                            SQLQuery query = objsave.getses().createSQLQuery(sql);
                                            query.addEntity(Message.class);
                                            List<Message> list = query.list();
                                            //List<Message> list = objsave.getses().createCriteria(Message.class).add(Restrictions.or(Restrictions.eq("userByMto", user),Restrictions.eq("userByMfrom", user))).list();
                                            for (Message me : list) {
                                        %>
                                        <a href="#" class="list-group-item <%if (me.getNewmes() == 1) {
                                                out.write("read");
                                            }%>" onclick="admin_user_message('<%=me.getUserByMto().getIduser()%>')">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox">
                                                </label>
                                            </div>
                                            <span class="glyphicon glyphicon-star-empty"></span><span class="name" style="min-width: 120px;
                                                                                                      display: inline-block;"><%=me.getUserByMto().getFname()%></span> <span class=""></span>
                                            <span class="text-muted" style="font-size: 11px;"></span> <span
                                                class="badge"><%=me.getTime() + " " + me.getDate()%></span> <span class="pull-right"></span>
                                        </a>
                                        <%}%>
                                        <!--                                        <a href="#" class="list-group-item read">
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
                                                                                </a>-->
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
        <%} else {
        %>
                <div class="col-md-12" style='position:absolute;z-index:0;left:0;top:0;width:100%;height:100%'>
                    <img src='../img/no_access.jpg' style='width:100%;height:450px' alt='[]' />
                </div>
        <%
               }
                 }%>
    </body>
</html>
