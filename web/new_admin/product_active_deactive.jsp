<%-- 
    Document   : product_active_deactive
    Created on : Oct 7, 2016, 12:33:01 AM
    Author     : Sevi
--%>

<%@page import="POJOS.Subcat"%>
<%@page import="Src.privilege_class"%>
<%@page import="POJOS.User"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.ItemImage"%>
<%@page import="POJOS.Item"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Supplier"%>
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
            function search() {
                var pname = document.getElementById('iname').value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //sync_table();
                        //alert(xhttp.responseText);
//                        $('#catname').val("");
//                        $('#catname').focus();
                        document.getElementById('tble').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../search?pname=" + pname + "&search=ok", true);
                xhttp.send();
            }
            
            function sttechg(b) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.status);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('tble').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../search?itemid=" + b + "&pstatus=ok", true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Product Activate / Deactivate</strong></h3>
        <%if (request.getSession().getAttribute("user_obj").toString() != null) {
                 privilege_class p = new privilege_class();
                  User su = (User) request.getSession().getAttribute("user_obj");
                  if (p.getPrivilage(su.getIduser().toString(), request.getRequestURI())) {%>
        <div class="col-md-12">
            <div class="col-md-12">
                <div class="row">

                    <div class="col-md-2">
                        <h5><strong>Item Name</strong></h5>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" placeholder="Item Name" id="iname" onkeyup="search()"/>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-default btn-block" onclick="search()">Search</button>
                    </div>
                </div>
            </div>
            <br/>
            <br/>
            <br/>
            <table class="table table-hover table-striped table-bordered" id="sup_table">
                <thead>
                <th>Item Name</th>
                <th>Sub Category</th>
                <th>Description</th>
                <th>Image</th>
                <th>Act/Deact</th>
                </thead>
                <tbody id="tble">

                    <%
                        Session ses = objsave.getses();
                        Criteria c = ses.createCriteria(Item.class);
                        List<Item> list = c.list();
                        for (Item item : list) {
                    %>
                    <tr>
                        <td><%=item.getItemname()%></td>
                        <td><%=item.getSubcat().getSubname()%></td>
                        <td><%=item.getDescription()%></td>
                        <%
                            Criteria c1 = ses.createCriteria(ItemImage.class);
                            c1.add(Restrictions.eq("item", item));
                            //c1.setFirstResult(1);
                            c1.setMaxResults(1);
                            List<ItemImage> itemimage = c1.list();
                            for (ItemImage i : itemimage) {
                        %><td><img src="<%out.write("../" + i.getUrl());%>" width="200" height="150"/></td><%
                            }
                            %>



                        <%
                            if (item.getStatus().toString().equals("1")) {
                        %>
                        <td id="btn_active">
                            <button class="btn btn-success btn-block" onclick="sttechg('<%=item.getIditem() %>')">Active</button>
                        </td>
                        <%
                        } else {
                        %>
                        <td id="btn_deactive">
                            <button class="btn btn-danger btn-block" onclick="sttechg('<%=item.getIditem() %>')">Deactive</button>
                        </td>
                        <%}%>
                    </tr>
                </tbody>
                <%}%>
            </table>
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
