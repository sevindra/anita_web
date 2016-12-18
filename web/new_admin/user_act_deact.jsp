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
        <script>
            function sttechg(b) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
//                    alert("ok");
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('uatb').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../user_act_deac?uid=" + b, true);
                xhttp.send();
            }
        </script>
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
                <tbody id="uatb">
                    <%
                    
                Utype uty = (Utype) objsave.getses().load(Utype.class, 4);
                User newu=(User)objsave.getses().createCriteria(User.class).add(Restrictions.eq("utype",uty)).uniqueResult();
                    Session s = objsave.getses();
                    Criteria c = s.createCriteria(User.class);
                    //c.add(Restrictions.not(Restrictions.eq("user", newu)));
                    List<User> us = c.list();
                    for (User u : us) {
                        
                        Addres a=(Addres)objsave.getses().createCriteria(Addres.class).add(Restrictions.and(Restrictions.eq("user", u),Restrictions.eq("status", 1),Restrictions.eq("primaryAddress", 1))).uniqueResult();
                        
                %>
                <tr>
                    <td><img src="../<%=u.getImg()%>" width="200" height="150"/></td>
                    <td><%=u.getFname()%></td>
                    <td><%=u.getLname() %></td>
                    <td><%if(a!=null){out.write(a.getAddress()+" "+a.getCity());} %></td>
                    <td><%=u.getNic() %></td>
                    <td><%=u.getMobile() %></td>
                    <td><%=u.getUtype().getUtype() %></td>
                    <%
                        if (u.getStatus().toString().equals("1")) {
                    %>
                    <td id="btn_active">
                        <button class="btn btn-success btn-block" onclick="sttechg('<%=u.getIduser() %>')">Active</button>
                    </td>
                    <%
                    } else {
                    %>
                    <td id="btn_deactive">
                        <button class="btn btn-danger btn-block" onclick="sttechg('<%=u.getIduser() %>')">Deactive</button>
                    </td>
                    <%}%>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
