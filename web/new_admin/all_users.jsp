<%-- 
    Document   : all_users
    Created on : Nov 20, 2016, 8:56:14 AM
    Author     : Sevi
--%>

<%@page import="POJOS.Utype"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.User"%>
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
        <h3 style="margin-top: -20px"><strong>Users</strong></h3>
        <div class="col-md-12">
            <table class="table table-bordered table-responsive table-striped">
                <thead>
                <th>Image</th>
                <th>First Name</th>
                <th>Middle Name</th>
                <th>Last Name</th>
                <th>NIC</th>
                <th>Mobile</th>
                <th>Role</th>
                </thead>
                <%
                    //Utype ut=(Utype)objsave.getses().load(Utype.class, 4);
                    Session s = objsave.getses();
                    Criteria c = s.createCriteria(User.class);
                    //c.add(Restrictions.eq("utype", ut));
                    List<User> us = c.list();
                    for (User u : us) {
                %>
                <tr>
                    <td><img src="../<%=u.getImg()%>" width="200" height="150"/></td>
                    <td><%=u.getFname()%></td>
                    <td><%=u.getMname() %></td>
                    <td><%=u.getLname() %></td>
                    <td><%=u.getNic() %></td>
                    <td><%=u.getMobile() %></td>
                    <td><%=u.getUtype().getUtype() %></td>
                    <td><button class="btn btn-danger">Deactive</button></td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
