<%-- 
    Document   : add_stock
    Created on : Oct 9, 2016, 8:55:14 AM
    Author     : Sevi
--%>

<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="POJOS.TempGrnItem"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.Supplier"%>
<%@page import="POJOS.Item"%>
<%@page import="POJOS.Cat"%>
<%@page import="java.util.List"%>
<%@page import="Src.objsave"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script>
            function add() {
                var pid = document.getElementById("pname").value;
                var cost = document.getElementById("cost").value;
                var price = document.getElementById("price").value;
                var qty = document.getElementById("qty").value;
                var dis = document.getElementById("dis").value;
                var tot = document.getElementById("tot").value;
                var color = document.getElementById("foundcolor").value;
                var size = document.getElementById("foundsize").value;
                var addbtn = document.getElementById("addbtn").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        alert(pid + ", " + cost + ", " + price + ", " + qty + ", " + dis + ", " + tot + ", " + color + ", " + size + ", " + addbtn);
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        sync_table();
                        subtot();
                        //alert(xhttp.responseText);
                        //document.getElementById('foundcolor').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../grn?pid=" + pid + "&cost=" + cost + "&price=" + price + "&qty=" + qty + "&dis=" + dis + "&tot=" + tot + "&color=" + color + "&size=" + size + "&addbtn=" + addbtn, true);
                xhttp.send();
                subtot();
            }






            function foundcolor() {
                var pid = document.getElementById("pname").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('foundcolor').innerHTML = xhttp.responseText;
                        foundsize();
                    }
                };
                xhttp.open("POST", "../size_color?pid=" + pid + "&color=color", true);
                xhttp.send();
            }
            function foundsize() {

                var pid = document.getElementById("pname").value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('foundsize').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../size_color?pid=" + pid + "&size=size", true);
                xhttp.send();
            }
            foundcolor();

            function caltot() {
                var cost = document.getElementById("cost").value;
                var qty = document.getElementById("qty").value;
                if (!(cost == "" && qty == "")) {
                    var total = (cost * qty);

                    $("#tot").val(total);
                }



            }
            var itemid;
            $(document).ready(function () {
                $(document).on('click', '.it', function () {
                    //alert($(this).parent().html());
                    var catname = $(this).parent().parent().html();
                    var ar = catname.split(">");
                    var ar2 = ar[1];
                    var ar3 = ar2.split("<");
                    //alert(ar3[0]);
                    itemid = ar3[0];


                    var rembtn = document.getElementById('rembtn').value;
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        //alert(xhttp.readyState);
                        if (xhttp.readyState === 4 && xhttp.status === 200) {
                            //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                            console.log('call sync');
                            sync_table();
                            //alert(xhttp.responseText);
                            //gotcatid=xhttp.responseText;
                            //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                        }
                    };
                    //alert(catid);
                    xhttp.open("POST", "../grn?itemid=" + itemid + "&rembtn=" + rembtn, true);
                    xhttp.send();
                });
            });

            function subtot() {
                //alert("ok");
            <%
                    long t =(Long) objsave.getses().createCriteria(TempGrnItem.class).setProjection(Projections.rowCount()).uniqueResult();
                    if (!(t==0)) {
                        double tot = (Double) objsave.getses().createCriteria(TempGrnItem.class).setProjection(Projections.sum("total")).uniqueResult();
                    
            %>
                $('#totalam').val(<%=tot%>);
                <%}else{
                    %>
                $('#totalam').val("0");                            
                    <%    
                    }%>
            }
            function sync_table() {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('tbl').innerHTML = xhttp.responseText;
                        subtot();
                    }
                };
                xhttp.open("POST", "../grn?synctb=ok", true);
                xhttp.send();
            }


            function save() {
                var grnid = document.getElementById('grnid').value;
                var supid = document.getElementById('supid').value;
                var totalam = document.getElementById('totalam').value;
                var xhttp = new XMLHttpRequest();
                
                if(grnid===""){
                    alert("Empty grnid");
                }else{
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        sync_table();
                        alert(xhttp.responseText);
                        //document.getElementById('tbl').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../grn?grnsave=save&grnid=" + grnid + "&supid=" + supid + "&totalam=" + totalam, true);
                xhttp.send();
                }
            }
            subtot();
        </script>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Goods Receive Note</strong></h3>
        <div class="col-md-12">
            <div class="panel panel-danger">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-1">
                            <label class="mypadin7">GRN No:</label>
                        </div>
                        <div class="col-md-2">
                            <input placeholder="GRN No" class="form-control" id="grnid" required=""/>
                        </div>
                        <div class="col-md-1">
                            <button class="btn btn-default btn-block">Search</button>
                        </div>
                        <div class="col-md-1">
                        </div>
                        <div class="col-md-2">
                            <label class="mypadin7">Supplier Name:</label>
                        </div>
                        <div class="col-md-3">
                            <select class="form-control" id="supid">
                                <%
                                    List<Supplier> list = objsave.getses().createCriteria(Supplier.class).add(Restrictions.eq("status", 1)).list();
                                    for (Supplier sup : list) {
                                %>
                                <option value="<%=sup.getIdsupplier()%>"><%=sup.getFname()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <br/>
                    <div class="col-md-12" style="border: #ff9999 solid 1px"></div>
                    <br/>
                    <div class="row">
                        <div class="col-md-3">
                            <select class="form-control" id="pname" onchange="foundcolor()">
                                <%
                                    List<Item> listi = objsave.getses().createCriteria(Item.class).add(Restrictions.eq("status", 1)).list();
                                    for (Item item : listi) {

                                %>
                                <option value="<%=item.getIditem()%>"><%=item.getItemname()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control" placeholder="Cost" id="cost" onkeyup="caltot()"/>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control" placeholder="Retail Price" id="price"/>
                        </div>
                        <div class="col-md-1">
                            <input class="form-control" placeholder="Qty" id="qty" onkeyup="caltot()"/>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control" placeholder="Discount" id="dis"/>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control" placeholder="Total" id="tot" disabled=""/>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-1">
                            <label class="mypadin7">Color :</label>
                        </div>
                        <div class="col-md-3">
                            <select class="form-control" id="foundcolor">

                            </select>
                        </div>
                        <div class="col-md-1">
                            <label class="mypadin7">Size :</label>
                        </div>
                        <div class="col-md-3">
                            <select class="form-control" id="foundsize">

                            </select>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-default btn-block" onclick="add()" id="addbtn" value="add">Add</button>
                        </div>
                    </div>
                    <br/>
                    <table id="list" class="table table-bordered table-hover table-striped">
                        <thead>
                            <tr>

                                <th style="text-align: center">ID</th>
                                <th style="width: 300px; text-align: center">Description</th>
                                <th style="text-align: center">Cost</th>
                                <th style="text-align: center">Retail Price</th>
                                <th style="text-align: center">Qty</th>
                                <th style="text-align: center">Discount</th>
                                <th style="text-align: center">Total</th>
                                <th style="text-align: center">Color</th>
                                <th style="text-align: center">Size</th>
                                <th style="text-align: center">Remove</th>
                            </tr>
                        </thead>
                        <tbody id="tbl">
                            <tr>
                                <%
                                    List<TempGrnItem> tblist = objsave.getses().createCriteria(TempGrnItem.class).list();
                                    for (TempGrnItem item : tblist) {
                                %>
                                <td><%=item.getIdtempGrnItem()%></td>
                                <td><%=item.getItem().getItemname()%></td>
                                <td style="text-align: right"><%=item.getCost()%></td>
                                <td style="text-align: right"><%=item.getPrice()%></td>
                                <td><%=item.getQty()%></td>
                                <td><%=item.getDiscount()%></td>
                                <td style="text-align: right"><%=item.getTotal()%></td>
                                <td><%=item.getColor().getColor()%></td>
                                <td><%=item.getSize().getSize()%></td>
                                <td><button class="btn btn-default myhover btn-block it" id="rembtn" value="remove">Remove</button></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <br/>
                    <div class="row">
                        <div class="col-md-1 mypadin7">
                            <label>Total :</label>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control" id="totalam" required=""/>
                        </div>
                        <div class="col-md-2 pull-right">
                            <button class="btn btn-default btn-block" onclick="save()" id="grnsave" value="save">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
