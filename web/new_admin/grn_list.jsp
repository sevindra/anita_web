<%-- 
    Document   : grn_list
    Created on : Dec 13, 2016, 1:33:11 AM
    Author     : Sevi
--%>

<%@page import="POJOS.User"%>
<%@page import="Src.privilege_class"%>
<%@page import="POJOS.Grn"%>
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
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>GRN List</strong></h3>
        <%if (request.getSession().getAttribute("user_obj").toString() != null) {
                privilege_class p = new privilege_class();
               User su = (User) request.getSession().getAttribute("user_obj");
               if (p.getPrivilage(su.getIduser().toString(), request.getRequestURI())) {%>
        <div class="col-md-12">
            <table class="table table-hover table-striped table-bordered" id="sup_table">
                <tr>
                    <th>#GRN</th>
                    <th>Suppler</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Total Amount</th>
                </tr>
                <%
                    Session ses = objsave.getses();
                    Criteria c = ses.createCriteria(Grn.class);
                    //c.add(Restrictions.eq("status", 0));
                    List<Grn> list = c.list();
                    for (Grn item : list) {
                %>
                <tr>
                    <td><%=item.getGrnidreal() %></td>
                    <td><%=item.getSupplier().getFname()+" "+item.getSupplier().getLname() %></td>
                    <td><%=item.getDate() %></td>
                    <td><%=item.getTime() %></td>
                    <td><%=item.getTotal() %></td>
                    
                </tr>
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
