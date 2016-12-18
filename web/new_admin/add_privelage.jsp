<%-- 
    Document   : add_privelage
    Created on : Nov 8, 2016, 9:36:29 PM
    Author     : Sevi
--%>

<%@page import="POJOS.User"%>
<%@page import="Src.privilege_class"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="POJOS.PagesHasUtype"%>
<%@page import="Src.objsave"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Utype"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function save_privileges() {
                var utype = document.getElementById('user_type').value;
                var page = document.getElementById('page').value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
            sync_table();            
            alert(xhttp.responseText);

                        //document.getElementById('subcat').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../privileges?utype=" + utype + "&page=" + page + "&save_privilage=ok", true);
                xhttp.send();
            }
            function delete_privileges(p) {



                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
            sync_table();            
            alert(xhttp.responseText);

                        //document.getElementById('subcat').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../privileges?privilege=" + p + "&delete_privilage=ok", true);
                xhttp.send();
            }
            function sync_table() {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('adptb').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?synctbprivilage=ok", true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Add Privilege</strong></h3>
        <%if (request.getSession().getAttribute("user_obj").toString() != null) {
                privilege_class p = new privilege_class();
                User su = (User) request.getSession().getAttribute("user_obj");
                if (p.getPrivilage(su.getIduser().toString(), request.getRequestURI())) {%>
        <div class="col-md-12">
            <div class="panel panel-danger">
                <div class="panel-heading"><strong>Restriction By User Type</strong></div>
                <div class="panel-body">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-4">
                                <h5><strong>User Type</strong></h5>
                            </div>
                            <div class="col-md-6">
                                <select class="form-control" id="user_type">
                                    <%
                                        List<Utype> ut = objsave.getses().createCriteria(Utype.class).list();
                                        for (Utype utype : ut) {
                                    %>
                                    <option value="<%=utype.getIdutype()%>"><%=utype.getUtype()%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4">
                                <h5><strong>Pages</strong></h5>
                            </div>
                            <div class="col-md-6">
                                <select class="form-control" id="page">
                                    <%
                                        File folder = new File("C:/Users/Sevi/Documents/NetBeansProjects/anita_web/web/new_admin");
                                        File[] listOfFiles = folder.listFiles();

                                        for (int i = 0; i < listOfFiles.length; i++) {
                                            if (listOfFiles[i].isFile()) {
                                    %> <option value="<%=listOfFiles[i].getName()%>"><%=listOfFiles[i].getName()%></option><%
                                                //System.out.println("File " + listOfFiles[i].getName());
                                            } else if (listOfFiles[i].isDirectory()) {
                                                // System.out.println("Directory " + listOfFiles[i].getName());
                                            }
                                        }
                                    %>

                                </select>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-6">
                                <button class="btn btn-primary pull-right" onclick="save_privileges()" id="save_privilage">Save</button>
                            </div>
                        </div>
                        <br/>
                    </div>
                    <div class="col-md-6" style="display: block; max-height: 550px; overflow: hidden; overflow-y: scroll;">
                        <table class="table table-bordered table-responsive table-striped">
                            <thead>
                            <th>User Type</th>
                            <th>Pages</th>
                            <th>Delete</th>
                            </thead> 
                            <tbody id="adptb">
                                <%
                                    List<PagesHasUtype> ph = objsave.getses().createCriteria(PagesHasUtype.class).addOrder(Order.asc("utype")).list();
                                    for (PagesHasUtype phu : ph) {
                                %>
                                <tr>
                                    <td><%=phu.getUtype().getUtype()%></td>
                                    <td><%=phu.getPages().getPageName()%></td>
                            <input id="phuid" type="hidden" value="<%=phu.getIdpagesHasUtype()%>"/>
                            <td><button class="btn btn-danger pull-right" onclick="delete_privileges('<%=phu.getIdpagesHasUtype()%>')">Delete</button></td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
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
