<%-- 
    Document   : admin_user_message
    Created on : Oct 22, 2016, 12:03:19 PM
    Author     : Sevi
--%>

<%@page import="Src.privilege_class"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Message"%>
<%@page import="Src.objsave"%>
<%@page import="POJOS.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            <%
                String userid = request.getParameter("userid");
            %>

            function adimin_msge_to_cus(uid) {
                var message_btn = document.getElementById('message_btn').innerHTML;
                var message = document.getElementById('admin_msg').value;
                var uid = uid;


                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        sync_table();
                        alert(xhttp.responseText);
                        document.getElementById('admin_msg').innerHTML="";
                    }
                };
                xhttp.open("POST", "../admin_msg?user_message=" + message + "&message_btn=" + message_btn + "&uid=" + uid, true);
                xhttp.send();
            }
            
            function sync_table() {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('meslist').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../syn_message?userid=<%=userid%>", true);
                xhttp.send();
            }
        </script>
    </head>
    <body  id="meslist">
        <%if (request.getSession().getAttribute("user_obj").toString() != null) {
               privilege_class p = new privilege_class();
                User su = (User) request.getSession().getAttribute("user_obj");
                if (p.getPrivilage(su.getIduser().toString(), request.getRequestURI())) {%>
        <%
            HttpSession hsheader = request.getSession();
            POJOS.User userheader = (POJOS.User) hsheader.getAttribute("user_obj");
            User u = (User) objsave.getses().load(User.class, Integer.parseInt(userid));
            
        %>
        <h3 style="margin-top: -20px"><a href="#" onclick="messages()"><span class="glyphicon glyphicon-arrow-left"></span></a><strong>Messages - <%=u.getFname()%></strong></h3>
        <div class="col-md-8 col-md-offset-1">
            <%

                String sql = "SELECT * FROM message WHERE mfrom='" + u.getIduser() + "' OR mto='" + u.getIduser() + "'";
                SQLQuery query = objsave.getses().createSQLQuery(sql);
                query.addEntity(Message.class);
                List<Message> list = query.list();
                //List<Message> list = objsave.getses().createCriteria(Message.class).add(Restrictions.or(Restrictions.eq("userByMto", user),Restrictions.eq("userByMfrom", user))).list();
                for (Message mes : list) {
            %>
            <div class="row">
                <div class="col-md-2">
                    
                    <img src="<%if (mes.getUtype().getIdutype() != 4) {
                            out.write("../img/anita.ico");
                        } else {
                            out.write("../" + u.getImg());
                        }%>" style="width: 50px"/>
                </div>
                <div class="col-md-6">
                    <p style="text-align: justify"><%=mes.getMessage()%></p>
                </div>
            </div>
            <%}%>
            <br/>
            <div class="col-md-10 col-md-offset-1">
                <div class="row">
                    <textarea class="form-control" rows="5" id="admin_msg"></textarea>
                </div>
                <br/>
                <div class="row text-right">
                    <button class="btn btn-primary" style="width: 100px" id="message_btn" onclick="adimin_msge_to_cus('<%=u.getIduser()%>')">Send</button>
                </div>
            </div>
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
