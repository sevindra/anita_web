<%-- 
    Document   : index
    Created on : 30-Dec-2015, 22:36:26
    Author     : Sevi
--%>

<%@page import="org.hibernate.criterion.Subqueries"%>
<%@page import="com.mysql.jdbc.Constants"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.criterion.ProjectionList"%>
<%@page import="java.io.Console"%>
<%@page import="POJOS.Stock"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.ItemImage"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="Src.objsave"%>
<%@page import="POJOS.Item"%>
<%@page import="Src.current_url"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@include file="inc.jsp" %>
        <!-- Start WOWSlider.com HEAD section -->
        <link rel="stylesheet" type="text/css" href="engine1/style.css" />
        <script type="text/javascript" src="engine1/jquery.js"></script>
        <!-- End WOWSlider.com HEAD section -->
        <title>Anita Designer wear</title>
        <script>
            document.addEventListener('contextmenu', event => event.preventDefault());
            <%
                String uri = request.getScheme() + "://"
                        + request.getServerName()
                        + ("http".equals(request.getScheme()) && request.getServerPort() == 80 || "https".equals(request.getScheme()) && request.getServerPort() == 443 ? "" : ":" + request.getServerPort())
                        + request.getRequestURI()
                        + (request.getQueryString() != null ? "?" + request.getQueryString() : "");
                current_url url = new current_url();
                url.setUrl(uri);
                System.out.print("this current ur- " + uri);
                HttpSession currurl = request.getSession();
                currurl.setAttribute("currenturl", uri);

            %>
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





            <%                HttpSession hs = request.getSession();
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
        <!-- Start WOWSlider.com BODY section -->
        <div id="wowslider-container1">
            <div class="ws_images"><ul>
                    <li><img src="data1/images/madmenbbbanner.jpg" alt="" title="" id="wows1_0"/></li>
                    <li><img src="data1/images/04.jpg" alt="" title="" id="wows1_1"/></li>
                    <li><img src="data1/images/01.jpg" alt="" title="" id="wows1_2"/></li>
                    <li><img src="data1/images/men_page_banner2.jpg" alt="" title="" id="wows1_3"/></li>
                    <li><img src="data1/images/02.jpg" alt="" title="" id="wows1_4"/></li>
                    <li><a href="#"><img src="data1/images/mensclothingbanner1.jpg" alt="bootstrap carousel" title="" id="wows1_5"/></a></li>
                    <li><img src="data1/images/03.jpg" alt="" title="" id="wows1_6"/></li>
                </ul></div>
            <div class="ws_bullets"><div>
                    <a href="#" title=""><span><img src="data1/tooltips/madmenbbbanner.jpg" alt=""/>1</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/04.jpg" alt=""/>2</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/01.jpg" alt=""/>3</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/men_page_banner2.jpg" alt=""/>4</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/02.jpg" alt=""/>5</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/mensclothingbanner1.jpg" alt=""/>6</span></a>
                    <a href="#" title=""><span><img src="data1/tooltips/03.jpg" alt=""/>7</span></a>
                </div></div><div class="ws_script" style="position:absolute;left:-99%"></div>
            <div class="ws_shadow"></div>
        </div>	
        <script type="text/javascript" src="engine1/wowslider.js"></script>
        <script type="text/javascript" src="engine1/script.js"></script>
        <!-- End WOWSlider.com BODY section -->

        <br/>
        <div class="container-fluid">
            <div class="row">
                <%@include file="site/Category.jsp" %>

                <div class="col-md-9">
                    <!--                    <div class="panel panel-default">
                                            <div class="panel-body">-->
                    <%
                        String currentpage = request.getParameter("pag");

                        Session ses = objsave.getses();
                        Criteria cr = ses.createCriteria(Stock.class);
                        cr.setProjection(Projections.groupProperty("item"));
//                        cr.setProjection(Projections.rowCount());
                        //cr.addOrder(Order.desc("idproduct"));
                        //out.write(cr.setProjection(Projections.rowCount()).toString());
                        if (currentpage != null) {
                            if (currentpage.equals("1")) {
                                cr.setMaxResults(3);
                            } else {
                                cr.setFirstResult((Integer.parseInt(request.getParameter("pag")) * 3) - 3);
                                cr.setMaxResults(3);
                            }
                        } else {
                            cr.setMaxResults(3);
                        }

                        List<Item> l = cr.list();
                        for (Item item : l) {%>
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="thumbnail" style="position: relative">
                                    <%
                                        Criteria c1 = ses.createCriteria(ItemImage.class);
                                        c1.add(Restrictions.eq("item", item));
                                        //c1.setFirstResult(1);
                                        c1.setMaxResults(1);
                                        List<ItemImage> itemimage = c1.list();
                                        for (ItemImage i : itemimage) {
                                    %>
                                    <a href="<%out.write("Item_details.jsp?itemid=" + item.getIditem());%>"><img src="<%out.write(i.getUrl());%>"/></a>
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
                                            <a class="btn btn-success btn-block" href="<%out.write("Item_details.jsp?itemid=" + item.getIditem());%>"><strong>View</strong></a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <% }%>
                    <!--                        </div>
                                        </div>-->
                </div>
                <div class="text-center">
                    <%
                        int items = 0;
                        int pages = 0;
//                        Criteria cr1 = ses.createCriteria(Stock.class);
                        //cr1.setProjection(Projections.groupProperty("item"));

//                        ProjectionList projectionList = Projections.projectionList();
//                        projectionList.add(Projections.groupProperty("item"));
//                        cr1.setProjection(projectionList);
//                        cr1.setProjection(Projections.rowCount());
//                Product pr=(Product)cr.uniqueResult();
//                        items = Integer.parseInt(cr1.uniqueResult().toString());
                        String sql = "SELECT * FROM stock group by iditem";
                        SQLQuery query = objsave.getses().createSQLQuery(sql);
                        query.addEntity(Stock.class);
                        //items = Integer.parseInt(query.uniqueResult().toString());
                        List<Stock> sa=query.list();
                        for(Stock a:sa){
                        items=a.getItem().getIditem();
                        }
//                        Criteria nativeCriteria = objsave.createCriteria(Stock.class, Constants.SUB_PROFESSIONAL);
//        nativeCriteria.add(Subqueries.propertyEq(Constants.SUB_PROFESSIONAL + "." + Constants.HCP_ID, criteria));
//        nativeCriteria.setProjection(Projections.projectionList().add(Projections.rowCount()));
//        rowCount = (Long) nativeCriteria.uniqueResult();
                        pages = items / 3;
                        if (items % 3 > 0) {
                            pages += 1;
                        }
                        // out.print(pages + "");

                        for (int i = 1; i <= pages; i++) {
                    %><a href="index.jsp?pag=<%=i%>"><button class="btn btn-default" style="margin-left: 5px; margin-right: 5px; margin-bottom: 10px; color: red"><%out.print(i);%></button></a><%
                        }
                        %>
                </div>

            </div>
        </div>



        <%@include file="site/footer.jsp" %>
        <script>
            $(document).ready(function () {


                $(".bs-example-modal-cat").modal();


            });
        </script>

    </body>
</html>
