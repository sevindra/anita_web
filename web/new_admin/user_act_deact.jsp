<%-- 
    Document   : user_act_deact
    Created on : Nov 15, 2016, 6:20:38 PM
    Author     : Sevi
--%>

<%@page import="POJOS.Addres"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.User"%>
<%@page import="POJOS.Utype"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Src.objsave"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>User Active / Deactive</strong></h3>
        <div class="col-md-12">
            <table class="table table-bordered table-responsive table-striped">
                <thead>
                <th>Image</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address</th>
                <th>NIC</th>
                <th>Mobile</th>
                <th>User Type</th>
                <th>Status</th>
                </thead>
                <%
                Utype uty = (Utype) objsave.getses().load(Utype.class, 4);
                    Session s = objsave.getses();
                    Criteria c = s.createCriteria(User.class);
                    c.add(Restrictions.eq("status", 1));
                    c.add(Restrictions.not(Restrictions.eq("utype", uty)));
                    List<User> us = c.list();
                    for (User u : us) {
                %>
                <tr>
                    <td><img src="../<%=u.getImg()%>" width="200" height="150"/></td>
                    <td><%=u.getFname()%></td>
                    <td><%=u.getLname() %></td>
                    <td></td>
                    <td><%=u.getNic() %></td>
                    <td><%=u.getMobile() %></td>
                    <td></td>
                    <td><button class="btn btn-danger">Deactive</button></td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
