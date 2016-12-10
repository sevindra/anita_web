<%-- 
    Document   : item
    Created on : May 22, 2016, 10:09:33 PM
    Author     : Sevi
--%>


<%@page import="POJOS.ItemImage"%>
<%@page import="POJOS.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>Product Details</title>
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
        <div>
            <%@include file="site/header.jsp" %>
        </div>

        <div>
            <%@include file="site/Category.jsp" %>
        </div>
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-body">
                    <%
                        Cat cat = (Cat) objsave.getses().createCriteria(Cat.class).add(Restrictions.eq("catname", request.getParameter("catname"))).uniqueResult();
                        Criteria sucri=objsave.getses().createCriteria(Subcat.class);
                        sucri.add(Restrictions.eq("cat", cat));
                        sucri.add(Restrictions.eq("subname", request.getParameter("subcatname").toString()));
                        Subcat subcat = (Subcat)sucri.uniqueResult();
                        
                        
                        List<Item> subli = objsave.getses().createCriteria(Item.class).add(Restrictions.eq("subcat", subcat)).list();

                        for (Item item:subli) {
                    
                    %>
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="thumbnail" style="position: relative">
                                    <%
                                        Criteria c1 = objsave.getses().createCriteria(ItemImage.class);
                                        c1.add(Restrictions.eq("item", item));
                                        //c1.setFirstResult(1);
                                        c1.setMaxResults(1);
                                        List<ItemImage> itemimage = c1.list();
                                        for (ItemImage i : itemimage) {
                                    %>
                                    <a href="<%out.write("Item_details.jsp?itemid="+item.getIditem());%>"><img src="<%out.write(i.getUrl());%>"/></a>
                                    <img src="img/new.png" style="position: absolute; right: 0px;top: 0;"/>
                                    <%}%>
                                </div>
                                <div class="col-md-12" style="height: 100px; margin-top: -30px">
                                    <h3><%=item.getItemname()%></h3>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <p style="text-align: justify; height: 50px" ><%=item.getDescription()%></p>
                                        <div class="col-md-8 col-md-offset-2">
                                            <a class="btn btn-success btn-block" href="<%out.write("Item_details.jsp?itemid="+item.getIditem());%>"><strong>View</strong></a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </body>
</html>
