<%-- 
    Document   : delivery
    Created on : Dec 13, 2016, 1:10:25 AM
    Author     : Sevi
--%>

<%@page import="POJOS.User"%>
<%@page import="Src.privilege_class"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.Invoice"%>
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
            function sttechg(b) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.status);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('dtb').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../delivery?did=" + b, true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Delivery List</strong></h3>
        <%if (request.getSession().getAttribute("user_obj").toString() != null) {
                privilege_class p = new privilege_class();
                User su = (User) request.getSession().getAttribute("user_obj");
                if (p.getPrivilage(su.getIduser().toString(), request.getRequestURI())) {%>
        <div class="col-md-12">
            <table class="table table-hover table-striped table-bordered" id="sup_table">
                <tr>
                    <th>#Order</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>User name</th>
                    <th>Delivery Address</th>
                    <th>City</th>
                    <th>Zip</th>
                    <th>Total</th>
                    <th>Approve</th>
                    <th>Status</th>
                </tr>
                <tbody id="dtb">
                    <%
                        Session ses = objsave.getses();
                        Criteria c = ses.createCriteria(Invoice.class);
                        List<Invoice> list = c.list();
                        for (Invoice item : list) {
                    %>
                    <tr>
                        <td><%=item.getInvoiceNo()%></td>
                        <td><%=item.getDate()%></td>
                        <td><%=item.getTime()%></td>
                        <td><%=item.getUser().getFname() + " " + item.getUser().getLname()%></td>
                        <td><%=item.getDelAddress()%></td>
                        <td><%=item.getDelCitiy()%></td>
                        <td><%=item.getDelZip()%></td>
                        <td><%=item.getTotal()%></td>
                        <%
                            if (item.getDelivery().toString().equals("1")) {
                        %>
                        <td id="btn_active">
                            <button class="btn btn-success btn-block" onclick="sttechg('<%=item.getIdinvoice()%>')">Delivery</button>
                        </td>
                        <%
                        } else if (item.getComp().toString().equals("1")) {
                        %>
                        <td id="btn_deactive">
                            <button class="btn btn-danger btn-block">Completed</button>
                        </td>
                        <%} else if (item.getDelivery().toString().equals("1") && item.getComp().toString().equals("1")) {
                        %>
                        <td id="btn_deactive">
                            <button class="btn btn-danger btn-block" >Completed</button>
                        </td>
                        <%
                        } else {
                        %>
                        <td id="btn_active">
                            <button class="btn btn-info btn-block">Not Approved</button>
                        </td>
                        <%
                        }%>
                        <%
                            if (item.getComp().toString().equals("1")) {
                        %>
                        <td id="btn_active">
                            <h4><span class="label label-lg label-warning">Delivered</span></h4>
                        </td>
                        <%
                        } else {
                        %>
                        <td id="btn_deactive">
                            <h4><span class="label label-lg label-warning">Not Delivered</span></h4>

                        </td>
                        <%}%>
                    </tr>
                    <%}%>
                </tbody>
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
