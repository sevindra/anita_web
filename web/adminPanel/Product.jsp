<%-- 
    Document   : Product
    Created on : Nov 2, 2015, 3:09:07 AM
    Author     : Sevi
--%>

<%@page import="POJOS.Cat"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>

        <title>Product</title>
        <script type="text/javascript">
            function getSubCategory() {
                var xmlhttp;
                var xval = document.getElementById("cat").value;
                //alert(xval);
                if (window.ActiveXObject) {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                    //alert("active object");
                } else if (window.XMLHttpRequest) {
                    xmlhttp = new XMLHttpRequest();
                    //alert("XMlhttp");
                }
                //alert(xmlhttp.readyState);
                xmlhttp.onreadystatechange = function () {
                    //alert(xmlhttp.readyState);
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("subcat").innerHTML = xmlhttp.responseText;
                    }
                }
                xmlhttp.open("GET", "../SubCateSearch?id=" + xval, true);
                xmlhttp.send();
            }

            <%
    HttpSession hs = request.getSession();
    POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");
    if (user == null) {
        response.sendRedirect("../site/index.jsp");
    } else {
    }
            %>
            function readURL(input) {

                getFileName();

                var c = 0;

                for (var i = 0; i < input.files.length; i++) {

                    if (input.files[i] !== null) {

                        var reader = new FileReader();
                        reader.onload = function (e) {

                            var elem = document.createElement("img");
                            elem.setAttribute("id", c);
                            elem.setAttribute("class", "myimgs");
                            elem.setAttribute("src", e.target.result);
                            elem.setAttribute("height", "100");
                            elem.setAttribute("width", "100");
                            elem.setAttribute("onclick", 'deleteimage(' + c + ')');

                            document.getElementById("myimg").appendChild(elem);
                            c++;
                        }
                        reader.readAsDataURL(input.files[i]);

                    }
                }

            }

            function catsave(){
                
                xmlhttp.onreadystatechange = function () {
                    //alert(xmlhttp.readyState);
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                        //document.getElementById("subcat").innerHTML = xmlhttp.responseText;
                    }
                }
                var catname = document.getElementById("catname").value;
                

                xmlhttp.open("GET", "../cat_update?cat=" + catname, true);
                xmlhttp.send();
                
            }
        </script>
        <style type="text/css">
            .upload{
                opacity: 0;
                cursor: pointer;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                position: absolute;
            }
        </style>
    </head>
    <body onload="getSubCategory()">


        <div class="col-md-2 mypadin100">
            <a href="sup.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Supplier</strong></button></a> 
            <div class="myPadinTop5"></div>
            <a href="Product.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover mybtnselect"><strong>Product</strong></button></a> 
            <div class="myPadinTop5"></div>
            <a href="Grn.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>GRN</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="grn_return.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>GRN Return</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="store.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Store</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="settings.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Settings</strong></button></a>
            <div class="myPadinTop5"></div>
            <button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Report</strong></button>
        </div>
        <div class=" col-md-8 mypadin100">
            <div class="panel panel-danger">
                <div class="panel-heading"><h3 class="panel-title"><strong>Product Details</strong></h3></div>
                <div class="panel-body">
                    <form action="../product_save" method="get">
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-5 mypadin7">
                                    Category Name : 
                                </div>
                                <div class="col-md-7">
                                    <!--<input class="form-control" placeholder="Eenter Category Name"/>-->
                                    <select id="cat" onkeypress="getSubCategory()" onkeyup="getSubCategory()" onchange="getSubCategory()" class="form-control">
                                        <%  SessionFactory sf = controler.connector.getSessionFactory();
                                            Session s = sf.openSession();

                                            Criteria c = s.createCriteria(POJOS.Cat.class);
                                            c.addOrder(Order.asc("catname"));
                                            List<POJOS.Cat> li1 = c.list();
                                            for (POJOS.Cat cat : li1) {
                                        %>
                                        <option value="<%=cat.getIdcat()%>"><%=cat.getCatname()%></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>

                            <br/>
                            <div class="row">
                                <div class="col-md-5 mypadin7">
                                    Sub Cat Name : 
                                </div>
                                <div class="col-md-7">
                                    <!--<input class="form-control" placeholder="Enter Sub Category Name"/>-->
                                    <select id="subcat" class="form-control" name="subcat">

                                    </select>
                                </div>
                            </div>                    
                            <br/>
                            <div class="row">
                                <div class="col-md-5 mypadin7">
                                    Item Name : 
                                </div>
                                <div class="col-md-7">
                                    <input class="form-control" placeholder="Eenter  Item Name" name="pname"/>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-5 mypadin7">

                                </div>
                                <div id="myimg">

                                </div>
                            </div>  
                            <br>

                            <br>
                            <div class="row">
                                <div class="col-md-5 mypadin7">

                                </div>
                                <div class="col-md-7">
                                    <button class="btn btn-default myproductbtnwidth" name="save" value="save">Save</button>
                                    <button class="btn btn-info myproductbtnwidth">Update</button>
                                    <button class="btn btn-danger myproductbtnwidth">Delete</button>
                                </div>
                            </div>                    
                        </div>
                        <div class="col-md-4">

                            <div style="display: block; max-height: 300px; overflow: hidden; overflow-y: scroll;">
                                <table class="table table-responsive table-bordered table-hover table-striped">
                                    <tr>
                                        <th>Item Name</th>
                                    </tr>
                                    <tbody>
                                        <% Criteria c5 = s.createCriteria(POJOS.Item.class);
                                            c5.addOrder(Order.asc("itemname"));
                                            List<POJOS.Item> li5 = c5.list();
                                            for (POJOS.Item item : li5) {%>
                                        <tr>
                                            <td style="max-width: 100%;"><%=item.getItemname()%></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>          
                    </form>
                </div>
            </div>

        </div>
        <div class="col-md-2">
            <div class="mypadin100">
                <button type="button" class="btn btn-default myhover myBtnwidth150" data-toggle="modal" data-target=".bs-example-modal-cat">Add Category</button>
            </div>
            <div class="myPadinTop5"></div>
            <button type="button" class="btn btn-default myhover myBtnwidth150" data-toggle="modal" data-target=".bs-example-modal-subcat">Add Sub Category</button>
        </div>
        <div class="modal fade bs-example-modal-cat" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog mymodlewidth900">
                <!--<div class="modal-content">-->


                <div class="panel panel-default">
                    <div class="panel-heading"><h3 class="panel-title"><strong>Add Category </strong></h3></div>

                    <form action="../catagory_save" method="get">
                        <div class="panel-body">
                            <div class="col-md-12">
                                <div class="col-md-2 myPadinTop5">
                                    Category Name:
                                </div>
                                <div class="col-md-4">
                                    <input class="form-control" id="catname" placeholder="Enter Category Name" name="catname"/>
                                    <br>

                                    <button onclick="catsave()" class="btn btn-default btn-sm myproductbtnwidth" name="save" value="save">Save</button> 
                                    <button class="btn btn-info btn-sm myproductbtnwidth" name="update" value="update">Update</button>
                                    <button class="btn btn-danger btn-sm myproductbtnwidth" name="delete" value="delete">Delete</button>

                                </div>
                                <div class="col-md-6">

                                    <div style="display: block; max-height: 300px; overflow: hidden; overflow-y: scroll;">
                                        <table class="table table-responsive table-bordered table-hover table-striped">
                                            <tr>
                                                <th>Category Name</th>
                                            </tr>
                                            <tbody>
                                                <% Criteria c2 = s.createCriteria(POJOS.Cat.class);
                                                    c2.addOrder(Order.asc("catname"));
                                                    List<POJOS.Cat> li3 = c2.list();
                                                    for (POJOS.Cat cat : li3) {%>
                                                <tr>
                                                    <td style="max-width: 100%;"><%=cat.getCatname()%></td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>



                <!--</div>-->
            </div>
        </div>
        <div class="modal fade bs-example-modal-subcat" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg">
                <!--<div class="modal-content">-->

                <div class="panel panel-default">
                    <div class="panel-heading"><h3 class="panel-title"><strong>Add Sub Category </strong></h3></div>
                    <div class="panel-body">
                        <div class="col-md-12">
                            <div class="col-md-3">
                                <div class="myPadinTop5">
                                    Category Name:
                                </div>
                                <br>
                                <div style="padding-top: 15px;">
                                    Sub Category Name :
                                </div>
                            </div>
                            <form method="get" action="../Sub_Save">
                                <div class="col-md-4">
                                    <!--<input class="form-control" placeholder="Enter Category Name"/>-->
                                    <select name="cat" class="form-control">
                                        <%
//                                            SessionFactory sf = controler.connector.getSessionFactory();
//                                            Session s = sf.openSession();
//
//                                            Criteria c = s.createCriteria(POJOS.Cat.class);
//                                            List<POJOS.Cat> li1 = c.list();
                                            for (POJOS.Cat cat : li1) {
                                        %>
                                        <option value="<%=cat.getIdcat()%>"><%=cat.getCatname()%></option>
                                        <%}%>
                                    </select>
                                    <br>
                                    <input class="form-control" placeholder="Enter Sub Category Name" name="subcat"/>

                                    <br>
                                    <button class="btn btn-default btn-sm myproductbtnwidth" name="subsave" value="subsave">Save</button> 
                                    <button class="btn btn-info btn-sm myproductbtnwidth">Update</button>
                                    <button class="btn btn-danger btn-sm myproductbtnwidth">Delete</button>

                                </div>
                            </form>
                            <div class="col-md-5">
                                <div class="table-responsive">
                                    <div>
                                        <table class="table table-bordered table-hover table-striped">
                                            <tr>
                                                <th>Sub Category Name</th>
                                            </tr>
                                            <tbody style="display: block; max-height: 100px; max-width: 100%; overflow: hidden; overflow-y: scroll;">
                                                <% Criteria c4 = s.createCriteria(POJOS.Subcat.class);
                                                    c4.addOrder(Order.asc("subname"));
                                                    List<POJOS.Subcat> li4 = c4.list();
                                                    for (POJOS.Subcat subcat : li4) {%>
                                                <tr>
                                                    <td><%=subcat.getSubname()%></td>
                                                </tr>
                                                <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--</div>-->
            </div>
        </div>



        <script>
            var asderty = "<%=request.getParameter("as")%>";
            if (asderty == "5") {
                //document.write(asderty);
                document.write("<input type=\"hidden\" id=\"asdert\" data-toggle=\"modal\" data-target=\".bs-example-modal-cat\">");
                document.getElementById("asdert").click();
            }

            

        </script>
    </body>
</html>
