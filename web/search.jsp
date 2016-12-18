<%-- 
    Document   : search
    Created on : Dec 6, 2016, 4:48:38 PM
    Author     : Sevi
--%>

<%@page import="POJOS.ItemImage"%>
<%@page import="org.hibernate.criterion.MatchMode"%>
<%@page import="POJOS.Item"%>
<%@page import="Src.objsave"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="inc.jsp" %>

    </head>
    <body>
        <%@include file="site/header.jsp" %>
        <%@include file="site/search_bar.jsp" %>
        <%@include file="site/Category.jsp" %>
        <br/>
        <br/>
        <br/>
        <div class="col-md-9">
            <%
                Criteria csear = objsave.getses().createCriteria(Item.class).add(Restrictions.like("itemname", request.getParameter("name").toString(), MatchMode.ANYWHERE));
                List<Item> list = csear.list();
                if (list.size() != 0) {
                    // out.write("OK");
                    for (Item iitem : list) {

            %>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="thumbnail" style="position: relative">
                            <%                                        Criteria c1 = objsave.getses().createCriteria(ItemImage.class);
                                c1.add(Restrictions.eq("item", iitem));
                                //c1.setFirstResult(1);
                                c1.setMaxResults(1);
                                List<ItemImage> itemimage = c1.list();
                                for (ItemImage i : itemimage) {
                            %>
                            <a href="<%out.write("Item_details.jsp?itemid=" + iitem.getIditem());%>"><img src="<%out.write(i.getUrl());%>"/></a>
                            <img src="img/new.png" style="position: absolute; right: 0px;top: 0;"/>
                            <%}%>
                        </div>
                        <div class="col-md-12" style="height: 100px; margin-top: -30px">
                            <h3><%=iitem.getItemname()%></h3>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <p style="text-align: justify; height: 50px" ><%=iitem.getDescription()%></p>
                                <div class="col-md-8 col-md-offset-2">
                                    <a class="btn btn-success btn-block" href="<%out.write("Item_details.jsp?itemid=" + iitem.getIditem());%>"><strong>View</strong></a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
                //out.write("OKe");

            %>
<!--                <form method="get" action="search.jsp">
                    <div class="col-md-10">
                        <div class="input-group" style="margin-left: 100px">
                            <input id="search" class="form-control input-lg" placeholder="Search Product" name="name">
                            <div class="input-group-btn">
                                <button class="btn btn-default btn-lg" type="submit">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </div>
                            <div class="input-group-btn">
                                <button class="btn btn-default btn-lg" type="submit" style="width: 100px; font-size: small">
                                    By Category
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
                <br/>
                <br/>
                <br/>-->
            <div class="col-md-8 col-md-offset-2">
                <div class="alert alert-info">
                    <center>


                        <h3> Your search - <strong><%=request.getParameter("name")%></strong> - did not match any Item.</h3>
                    </center>
                    <div class="col-md-offset-2">
                        <br/>
                        <strong>Suggestions:</strong>
                        <br/>
                        <br/>
                        Make sure that all words are spelled correctly.
                        <br/>
                        Try different keywords.
                        <br/>
                        Try more general keywords.
                    </div>


                </div>
            </div>
            <%}%>
        </div>
    </body>
</html>
