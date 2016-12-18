<%-- 
    Document   : sub_category
    Created on : Oct 6, 2016, 11:37:17 PM
    Author     : Sevi
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="Src.privilege_class"%>
<%@page import="POJOS.User"%>
<%@page import="POJOS.Subcat"%>
<%@page import="POJOS.Cat"%>
<%@page import="Src.objsave"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            var subcatid;
            var gotsubcatid;
            $(document).ready(function () {
                $(document).on('click', '.subcat', function () {
                    //alert($(this).parent().html());
                    var catname = $(this).parent().html();
                    var ar = catname.split(">");
                    var ar2 = ar[3];
                    var ar3 = ar2.split("<");
                    var cat1=ar[1];
                    var cat2=cat1.split("<");
                    //alert("ar2-"+cat2[0]);
                    $("#subcatname").val(ar3[0]);
                    subcatid = ar3[0];

                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        //alert(xhttp.readyState);
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                            //alert(xhttp.responseText);
                            gotsubcatid = xhttp.responseText;
//                    alert(gotsubcatid);
                            //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                        }
                    };
                    xhttp.open("POST", "../category?subcatupdate=" + subcatid+"&updatesubcatcatid="+cat2[0], true);
                    xhttp.send();
                });
            });


            function save() {
                var savebtn = document.getElementById('subsave').innerHTML;
                var subcatname = document.getElementById('subcatname').value;
                var catid = document.getElementById('catid').value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(catid+"ff");
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        sync_table();
                        alert(xhttp.responseText);
                        $('#subcatname').val("");
                        $('#subcatname').focus();

                        //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?subsave=" + savebtn + "&subcatname=" + subcatname + "&catid=" + catid, true);
                xhttp.send();

            }

            function update() {
                var subcatname = document.getElementById('subcatname').value;
                var updatebtnsubcat = document.getElementById('updatebtnsubcat').innerHTML;
                var catid = document.getElementById('catid').value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(gotsubcatid);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        sync_table();
                        $('#subcatname').val("");
                        alert(xhttp.responseText);
                        //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?updatebtnsubcat=" + updatebtnsubcat + "&updatesubcatid=" + gotsubcatid + "&subcatname=" + subcatname + "&catid=" + catid, true);
                xhttp.send();
            }
            function sync_table() {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('subcattb').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?synctbsubcat=ok", true);
                xhttp.send();
            }

            function search() {
                //var savebtn = document.getElementById('savebtn').innerHTML;
                var search = document.getElementById('search').value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //sync_table();
//                        alert(xhttp.responseText);
//                        $('#catname').val("");
//                        $('#catname').focus();
                        document.getElementById('subcattb').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?searchtf=" + search + "&searchsubcat=ok", true);
                xhttp.send();
            }

            function sttechg(b) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.status);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('subcattb').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?subcatid=" + b + "&statusupdatesubcat=ok", true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Sub Category</strong></h3>
        <%if (request.getSession().getAttribute("user_obj").toString() != null) {
                  privilege_class p = new privilege_class();
                  User su = (User) request.getSession().getAttribute("user_obj");
                  if (p.getPrivilage(su.getIduser().toString(), request.getRequestURI())) {%>
        <div class="col-md-7">
            <div class="panel panel-danger">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4 mypadin7">
                            <label>Category Name : </label>  
                        </div>
                        <div class="col-md-8">
                            <select class="form-control" id="catid">
                                <%
                                    List<Cat> list = objsave.getses().createCriteria(Cat.class).add(Restrictions.eq("status", 1)).list();
                                    for (Cat cat : list) {
                                %>
                                <option value="<%=cat.getIdcat()%>"><%=cat.getCatname()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-4 mypadin7">
                            <label>Sub Category Name : </label>  
                        </div>
                        <div class="col-md-8">
                            <input placeholder="Sub Category Name" class="form-control" id="subcatname">
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-4 mypadin7">

                        </div>
                        <div class="col-md-8 ">
                            <div class="col-md-3 pull-right">

                                <button class="btn btn-primary pull-right btn-block" onclick="save()" id="subsave">Save</button>
                            </div>
                            <div class="col-md-3 pull-right">

                                <button class="btn btn-info pull-right btn-block" onclick="update()" id="updatebtnsubcat">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="row">
                <div class="col-md-3">
                    <h5>Search :</h5>
                </div>
                <div class="col-md-9">
                    <input placeholder="Search" class="form-control" onkeyup="search()" id="search">
                </div>
            </div>
            <br/>
            <div class="row">
                <div style="display: block; max-height: 300px; overflow: hidden; overflow-y: scroll;">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Category</th>
                                <th>Sub Category</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody id="subcattb">
                            <%
                                List<Subcat> tlist = objsave.getses().createCriteria(Subcat.class).list();
                                for (Subcat subcat : tlist) {
                            %>
                            <tr>
                                <td class="subcat"><%=subcat.getCat().getCatname()%></td>
                                <td class="subcat"><%=subcat.getSubname()%></td>
                                <%
                                    if (subcat.getStatus().toString().equals("1")) {
                                %>
                                <td id="btn_active">
                                    <button class="btn btn-success btn-block" onclick="sttechg('<%=subcat.getIdsubcat()%>')">Active</button>
                                </td>
                                <%
                                } else {
                                %>
                                <td id="btn_deactive">
                                    <button class="btn btn-danger btn-block" onclick="sttechg('<%=subcat.getIdsubcat()%>')">Deactive</button>
                                </td>
                                <%}%>
                            </tr>
                            <%}%>


                        </tbody>
                    </table>
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
