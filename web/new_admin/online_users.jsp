<%-- 
    Document   : online_users
    Created on : Nov 19, 2016, 5:28:37 PM
    Author     : Sevi
--%>

<%@page import="POJOS.OnlineUsers"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.User"%>
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
        <h3 style="margin-top: -20px"><strong>Online Users</strong></h3>
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
                <tbody id="online_tbody">

                    <%
                        String currentpage = request.getParameter("pag");
                        Session s = objsave.getses();
                        Criteria c = s.createCriteria(OnlineUsers.class);

                        
                        List<OnlineUsers> us = c.list();
                        for (OnlineUsers u : us) {
                    %>
                    <tr>
                        <td><img src="../<%=u.getUser().getImg()%>" width="200" height="150"/></td>
                        <td><%=u.getUser().getFname()%></td>
                        <td><%=u.getUser().getMname()%></td>
                        <td><%=u.getUser().getLname()%></td>
                        <td><%=u.getUser().getNic()%></td>
                        <td><%=u.getUser().getMobile()%></td>
                        <td><%=u.getUser().getUtype().getUtype()%></td>
                        <!--<td><button class="btn btn-danger">Deactive</button></td>-->
                    </tr>
                    <%}%>
                </tbody>
            </table>

            
        </div>
        
    </body>
</html>
