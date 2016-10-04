<%-- 
    Document   : sup_active_deactive
    Created on : Sep 25, 2016, 9:29:25 AM
    Author     : Sevi
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="Src.objsave"%>
<%@page import="POJOS.Supplier"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            
            function sttechg(b){
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                        //alert(xhttp.status);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('sup_table').innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../sup_active_deactive?supid="+b, true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Suppler Active / Deactive</strong></h3>
        <div class="col-md-12">
            <table class="table table-hover table-striped table-bordered myborder" id="sup_table">
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Company Name</th>
                    <th>Contact No1</th>
                    <th>Contact No2</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>State</th>
                    <th>Act/Deact</th>
                </tr>
                <%
                    Session ses = objsave.getses();
                    Criteria c = ses.createCriteria(Supplier.class);
                    List<Supplier> list = c.list();
                    for (Supplier sup : list) {
                %>
                <tr>
                    <td><%=sup.getFname() %></td>
                    <td><%=sup.getLname() %></td>
                    <td><%=sup.getCname()%></td>
                    <td><%=sup.getContact1()%></td>
                    <td><%=sup.getContact2()%></td>
                    <td><%=sup.getEmail()%></td>
                    <td><%=sup.getAddress1()+" "+sup.getAddress2()+" "+sup.getAddress3() %></td>
                    <td><%=sup.getState().getState() %></td>
                    <%
                    if(sup.getStatus().toString().equals("1")){
                    %>
                    <td id="btn_active">
                        <button class="btn btn-success btn-block" onclick="sttechg('<%=sup.getIdsupplier() %>')">Active</button>
                    </td>
                    <%
                    }else{
                    %>
                    <td id="btn_deactive">
                        <button class="btn btn-danger btn-block" onclick="sttechg('<%=sup.getIdsupplier() %>')">Deactive</button>
                    </td>
                    <%}%>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
