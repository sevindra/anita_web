<%-- 
    Document   : daily_visited
    Created on : Nov 20, 2016, 6:06:55 PM
    Author     : Sevi
--%>

<%@page import="java.util.Date"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.LoginReg"%>
<%@page import="Src.objsave"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Daily Visited</strong></h3>
        <div class="col-md-12">
            <table class="table table-bordered table-responsive table-striped">
                <thead>
                <th>Image</th>
                <th>NIC</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Login Date</th>
                <th>Login Time</th>
                </thead>
                <tbody id="online_tbody">

                    <%
                        String currentpage = request.getParameter("pag");
                        Session s = objsave.getses();
                        Criteria c = s.createCriteria(LoginReg.class);

                        
                        c.add(Restrictions.eq("indate", new Date()));
                        List<LoginReg> us = c.list();
                        for (LoginReg u : us) {
                    %>
                    <tr>
                        <td><img src="../<%=u.getLogin().getUser().getImg()%>" width="150" height="100"/></td>
                        <td><%=u.getLogin().getUser().getNic()%></td>
                        <td><%=u.getLogin().getUser().getFname()%></td>
                        <td><%=u.getLogin().getUser().getLname()%></td>
                        <td><%=u.getLogin().getEmail()%></td>
                        <td><%=u.getIndate()%></td>
                        <td><%=u.getIntime()%></td>
                        <!--<td><button class="btn btn-danger">Deactive</button></td>-->
                    </tr>
                    <%}%>
                </tbody>
            </table>
            
        </div>
        
    </body>
</html>
