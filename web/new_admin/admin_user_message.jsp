<%-- 
    Document   : admin_user_message
    Created on : Oct 22, 2016, 12:03:19 PM
    Author     : Sevi
--%>

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
    </head>
    <body>
        <%
    HttpSession hsheader = request.getSession();
    POJOS.User userheader = (POJOS.User) hsheader.getAttribute("user_obj");

            %>
            <h3 style="margin-top: -20px"><a href="#" onclick="messages()"><span class="glyphicon glyphicon-arrow-left"></span></a><strong>Messages - <%=userheader.getFname()%></strong></h3>
        <div class="col-md-8 col-md-offset-1">
            <%
                
                User u=(User)request.getSession().getAttribute("user_obj");
                    String sql = "SELECT * FROM message WHERE mfrom='"+u.getIduser()+"' OR mto='"+u.getIduser()+"'";
                    SQLQuery query = objsave.getses().createSQLQuery(sql);
                    query.addEntity(Message.class);
                    List<Message> list = query.list();
                    //List<Message> list = objsave.getses().createCriteria(Message.class).add(Restrictions.or(Restrictions.eq("userByMto", user),Restrictions.eq("userByMfrom", user))).list();
                    for (Message mes : list) {
                %>
                <div class="row">
                    <div class="col-md-1">
                        <img src="<%if(mes.getUserByMfrom().getUtype().getUtype().equals("Customer")){%>../img/anita.ico<%}%>" style="width: 50px"/>
                    </div>
                    <div class="col-md-11">
                        <p><%=mes.getMessage()%></p>
                    </div>
                </div>
                <%}%>
                <br/>
                <div class="col-md-10 col-md-offset-1">
                    <div class="row">
                        <textarea class="form-control" rows="5" id="user_message"></textarea>
                    </div>
                    <br/>
                    <div class="row text-right">
                        <button class="btn btn-primary" style="width: 100px" id="message_btn" onclick="send_message()">Send</button>
                    </div>
                </div>
            </div>
    </body>
</html>
