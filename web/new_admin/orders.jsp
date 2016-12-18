<%-- 
    Document   : orders
    Created on : Dec 13, 2016, 12:41:53 AM
    Author     : Sevi
--%>

<%@page import="POJOS.User"%>
<%@page import="Src.privilege_class"%>
<%@page import="POJOS.Invoice"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.ItemImage"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Item"%>
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
                        document.getElementById('otb').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../oder_approve?oid=" + b, true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Orders</strong></h3>
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
                    <th>Card No</th>
                    <th>Bill Address</th>
                    <th>City</th>
                    <th>Zip</th>
                    <th>Total</th>
                    <th>Approve</th>
                </tr>
                <tbody id="otb">
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
                        <td><%=item.getCardDetails().getCardNo()%></td>
                        <td><%=item.getBillAddress()%></td>
                        <td><%=item.getBillCity()%></td>
                        <td><%=item.getBillZip()%></td>
                        <td><%=item.getTotal()%></td>
                        <%
                            if (item.getStatus().toString().equals("1")) {
                        %>
                        <td id="btn_active">
                            <button class="btn btn-success btn-block" onclick="sttechg('<%=item.getIdinvoice()%>')">Approve</button>
                        </td>
                        <%
                        } else if (item.getComp().toString().equals("1")) {
                        %>
                        <td id="btn_deactive">
                            <button class="btn btn-warning btn-block">Approved</button>
                        </td>
                        <%} else {
                        %>
                        <td id="btn_deactive">
                            <button class="btn btn-warning btn-block" onclick="sttechg('<%=item.getIdinvoice()%>')">Approved</button>
                        </td>
                        <%
                            }%>
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
