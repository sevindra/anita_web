<%-- 
    Document   : item_question
    Created on : Nov 20, 2016, 6:23:26 PM
    Author     : Sevi
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.ItemImage"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="POJOS.Item"%>
<%@page import="POJOS.Question"%>
<%@page import="java.util.List"%>
<%@page import="Src.objsave"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Item Question</strong></h3>
        <div class="col-md-12">
            <table class="table table-bordered table-responsive table-striped">
                <thead>
                <th>Image</th>
                <th>Item Name</th>
                <th>Question</th>
                <th>User Name</th>
                <th>User NIC</th>
                <th>Mobile</th>
                <th>Mobile 2</th>
                <th>Action</th>
                </thead>
                <%
                List<Question> list=objsave.getses().createCriteria(Question.class).list();
                for(Question wl:list){
                %>
                <tr>
                    <%
                    Item i =(Item)objsave.getses().load(Item.class, wl.getItem().getIditem());
                    
                    Criteria c1 = objsave.getses().createCriteria(ItemImage.class);
                                        c1.add(Restrictions.eq("item", i));
                                        //c1.setFirstResult(1);
                                        c1.setMaxResults(1);
                                        List<ItemImage> itemimage = c1.list();
                                        for (ItemImage im : itemimage) {
                    %>
                    <td><img src="../<%=im.getUrl()%>" width="150" height="100"/></td>
                    <%}%>
                    <td><%=wl.getItem().getItemname() %></td>
                    <td><%=wl.getQuestion() %></td>
                    <td><%=wl.getUser().getFname()+" "+wl.getUser().getLname() %></td>
                    <td><%=wl.getUser().getNic() %></td>
                    <td><%=wl.getUser().getMobile() %></td>
                    <td><%=wl.getUser().getMobile2() %></td>
                    <td><button class="btn btn-warning btn-block">Send Message</button></td>
                </tr>
                <%}%>
            </table>
    </body>
</html>
