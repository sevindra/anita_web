<%-- 
    Document   : invoice
    Created on : Dec 9, 2016, 11:09:44 PM
    Author     : Sevi
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.InvoiceItem"%>
<%@page import="POJOS.Login"%>
<%@page import="Src.objsave"%>
<%@page import="POJOS.Invoice"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoice</title>
        <%@include file="inc.jsp" %>
        <script>
            function inprint(){
                window.print();
            }
        </script>
    </head>
    <body>
        <%
        Invoice i=(Invoice)objsave.getses().load(Invoice.class, Integer.parseInt(request.getParameter("inid").toString()));
        %>
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="invoice-title">
                        <h2>Invoice<button class="btn btn-default" style="margin-left: 20px" onclick="inprint()">Print</button><a href="index.jsp"><button class="btn btn-primary" style="margin-left: 20px">Home</button></a></h2><h3 class="pull-right">Order # <%="000"+i.getInvoiceNo() %></h3>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-xs-6">
                            <address>
                                <strong>Billed To:</strong><br>
                                <%=i.getUser().getFname()+" "+i.getUser().getLname() %><br>
                                <%=i.getBillAddress() %><br>
                                <%=i.getBillCity() %><br>
                                <%=i.getBillZip() %>
                            </address>
                        </div>
                        <div class="col-xs-6 text-right">
                            <address>
                                <strong>Delivery To:</strong><br>
                                <%=i.getUser().getFname()+" "+i.getUser().getLname() %><br>
                                <%=i.getDelAddress() %><br>
                                <%=i.getDelCitiy() %><br>
                                <%=i.getDelZip() %>
                            </address>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6">
                            <address>
                                <strong>Payment Method:</strong><br>
                                Card <%=i.getCardDetails().getCardNo() %><br>
                                <%
                                Login l=(Login)objsave.getses().load(Login.class, Integer.parseInt(i.getUser().getIduser().toString()));
                                %>
                                <%=l.getEmail() %>
                            </address>
                        </div>
                        <div class="col-xs-6 text-right">
                            <address>
                                <strong>Order Date:</strong><br>
                                <%=i.getDate().toString() %><br><br>
                            </address>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>Order summary</strong></h3>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-condensed">
                                    <thead>
                                        <tr>
                                            <td><strong>Item</strong></td>
                                            <td class="text-center"><strong>Price</strong></td>
                                            <td class="text-center"><strong>Quantity</strong></td>
                                            <td class="text-right"><strong>Totals</strong></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        List<InvoiceItem> ii=objsave.getses().createCriteria(InvoiceItem.class).add(Restrictions.eq("invoice", i)).list();
                                        for(InvoiceItem iit:ii){
                                        %>
                                        <tr>
                                            <td><%=iit.getItem().getItemname() %></td>
                                            <td class="text-center"><%=iit.getPrice() %></td>
                                            <td class="text-center"><%=iit.getQty() %></td>
                                            <td class="text-right"><%=iit.getTotal() %></td>
                                        </tr>
                                        <%}%>
                                        <tr>
                                            <td class="thick-line"></td>
                                            <td class="thick-line"></td>
                                            <td class="thick-line"></td>
                                            <td class="thick-line"></td>
                                            <!--<td class="thick-line text-center"><strong>Subtotal</strong></td>-->
                                            <!--<td class="thick-line text-right">$670.99</td>-->
                                        </tr>
                                        <tr>
                                            <td class="no-line"></td>
                                            <td class="no-line"></td>
                                            <td class="no-line"></td>
                                            <td class="no-line"></td>
                                            <!--<td class="no-line text-center"><strong>Delivery</strong></td>-->
                                            <!--<td class="no-line text-right">$15</td>-->
                                        </tr>
                                        <tr>
                                            <td class="no-line"></td>
                                            <td class="no-line"></td>
                                            <td class="no-line text-center"><strong>Total</strong></td>
                                            <td class="no-line text-right"><strong><%=i.getTotal() %></strong></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
