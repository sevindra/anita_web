<%-- 
    Document   : category
    Created on : Oct 6, 2016, 10:21:35 PM
    Author     : Sevi
--%>

<%@page import="Src.privilege_class"%>
<%@page import="POJOS.User"%>
<%@page import="POJOS.Cat"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Src.objsave"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>

            var catid;
            var gotcatid;
            function save() {
                var savebtn = document.getElementById('savebtn').innerHTML;
                var catname = document.getElementById('catname').value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        sync_table();
                        alert(xhttp.responseText);
                        $('#catname').val("");
                        $('#catname').focus();
                        //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?savebtn=" + savebtn + "&catname=" + catname, true);
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
                        document.getElementById('cattable').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?searchtf=" + search + "&search=ok", true);
                xhttp.send();
            }
            $(document).ready(function () {
                $(document).on('click', '.cat', function () {
                    //alert($(this).parent().html());
                    var catname = $(this).parent().html();
                    var ar = catname.split(">");
                    var ar2 = ar[1];
                    var ar3 = ar2.split("<");
                    //alert(ar3[0]);
                    $("#catname").val(ar3[0]);
                    catid = ar3[0];

                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        //alert(xhttp.readyState);
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                            //alert(xhttp.responseText);
                            gotcatid = xhttp.responseText;
                            //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                        }
                    };
                    //alert(catid);
                    xhttp.open("POST", "../category?catupdate=" + catid, true);
                    xhttp.send();
                });
            });

            function update() {
                var catname = document.getElementById('catname').value;
                var updatebtn = document.getElementById('updatebtn').innerHTML;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        sync_table();
                        $('#catname').val("");
                        alert(xhttp.responseText);
                        //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?updatebtn=" + updatebtn + "&updatecatid=" + gotcatid + "&catname=" + catname, true);
                xhttp.send();
            }

            function sync_table() {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('cattable').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?synctb=ok", true);
                xhttp.send();
            }

            function sttechg(b) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.status);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('cattable').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?catid=" + b+"&statusupdate=ok", true);
                xhttp.send();
            }

        </script>

    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Category</strong></h3>
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
                            <input placeholder="Category Name" class="form-control" id="catname">
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-4 mypadin7">

                        </div>
                        <div class="col-md-8 ">
                            <div class="col-md-3 pull-right">

                                <button class="btn btn-primary pull-right btn-block" onclick="save()" id="savebtn">Save</button>
                            </div>
                            <div class="col-md-3 pull-right">

                                <button class="btn btn-info pull-right btn-block" onclick="update()" id="updatebtn">Update</button>
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
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody id="cattable">
                            <%
                                List<Cat> list = objsave.getses().createCriteria(Cat.class).list();
                                for (Cat cat : list) {
                            %>
                            <tr>
                                <td class="cat"><%=cat.getCatname()%></td>
                                <%
                                    if (cat.getStatus().toString().equals("1")) {
                                %>
                                <td id="btn_active">
                                    <button class="btn btn-success btn-block" onclick="sttechg('<%=cat.getIdcat()%>')">Active</button>
                                </td>
                                <%
                                } else {
                                %>
                                <td id="btn_deactive">
                                    <button class="btn btn-danger btn-block" onclick="sttechg('<%=cat.getIdcat()%>')">Deactive</button>
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
