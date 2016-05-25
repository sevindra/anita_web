<%-- 
    Document   : Grn
    Created on : Nov 8, 2015, 8:31:21 AM
    Author     : Sevi
--%>

<%@page import="java.awt.event.KeyEvent"%>
<%@page import="java.awt.Event"%>
<%@page import="POJOS.Stock"%>
<%@page import="org.hibernate.criterion.Order"%>
<%@page import="POJOS.Grn"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>GRN</title>
    </head>
    <body onload="grnid()">
        <script>
            var xmlhttp;
//                var xval = document.getElementById("cost").value;
//                alert(xval);
            if (window.ActiveXObject) {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                //alert("active object");
            } else if (window.XMLHttpRequest) {
                xmlhttp = new XMLHttpRequest();
                //alert("XMlhttp");
            }
            // $(document).ready(function () {
            function saveitem() {

                //alert(xmlhttp.readyState);
                xmlhttp.onreadystatechange = function () {
                    //alert(xmlhttp.readyState);
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
                        //document.getElementById("subcat").innerHTML = xmlhttp.responseText;
                    }
                }
                var pid = document.getElementById("pname").value;
                var cost = document.getElementById("cost").value;
                var rprice = document.getElementById("rprice").value;
                var qty = document.getElementById("qty").value;
                var dis = document.getElementById("dis").value;
                var grnid = document.getElementById("grnid").value;
                var sup = document.getElementById("sup").value;
                var total = document.getElementById("total").value;

                xmlhttp.open("GET", "../item_save?cost=" + cost + "&rprice=" + rprice + "&qty=" + qty + "&sup=" + sup + "&dis=" + dis + "&grnid=" + grnid + "&pid=" + pid + "&total=" + total, true);
                xmlhttp.send();
                //alert(pid + " " + rprice + " " + qty + " " + dis);
                cleartf();
            }
            
            <%
            HttpSession hs =request.getSession();
            POJOS.User user = (POJOS.User)hs.getAttribute("user_obj");
            if(user==null){
            response.sendRedirect("../site/index.jsp");
            }else{
            }
            %>
                
            ///////////////////////////////////
            function grnid() {
                $("#dis").val('0');
                $("#pname").focus();
            <%
                SessionFactory sf = controler.connector.getSessionFactory();
                Session ses = sf.openSession();
                Criteria cr = ses.createCriteria(POJOS.Grn.class);
                cr.addOrder(Order.desc("grnid"));
                cr.setMaxResults(1);
                POJOS.Grn grn = (Grn) cr.uniqueResult();
                int grnid = 0;%>

            <%if (grn == null) {
                    grnid = 1;
                } else {
                    grnid += 1;
                }

            %>

                $(function () {

                    $("#grnid").val('<%=grnid%>');
                })

            }


            //})
            function cleartf() {

                $("#cost").val('');
                $("#barcode").val('');
                $("#rprice").val('');
                $("#qty").val('');
                $("#dis").val('0');
                $("#total").val('');

            }
            function AddData() {

                var x = document.getElementById("qty").value;
                var y = document.getElementById("pname").value;
                var letters = '/^[a-zA-Z]+$/';

                if ((parseInt(x) != (x)) && (y == parseInt(y))) {
                    alert("Wrong Value Entered");
                } else {
                    //alert("ok");
                    var rows = "";
                    var pid = document.getElementById("pname").value;
                    var pid1 = document.getElementById("pname");
                    //var barcode = document.getElementById("barcode").value;
                    var pname = pid1.options[pid1.selectedIndex].text;
                    var stockid = document.getElementById("grnid").value;
                    var cost = document.getElementById("cost").value;
                    var rprice = document.getElementById("rprice").value;
                    var qty = document.getElementById("qty").value;
                    var dis = document.getElementById("dis").value;
                    var total = document.getElementById("total").value;
                    //var total = (rprice * qty) * dis / 100;

                    rows += "<td>" + stockid + "</td><td>" + pid + "</td><td>" + pname + "</td><td style='text-align: right'>" + cost + "</td>\n\
                <td style='text-align: right'>" + rprice + "</td><td style='text-align: right'>" + qty + "</td>\n\
<td style='text-align: right'>" + dis + "</td>\n\
<td class='combat' style='text-align: right'>" + total + "</td>\n\
<td><button class='btn btn-sm btn-default form-control myhover rem' value='remove'><strong>Delete</strong></button></td>";

                    var tbody = document.querySelector("#list tbody");
                    var tr = document.createElement("tr");

                    tr.innerHTML = rows;
                    tbody.appendChild(tr)

                    //
                }
                calsum();
                //cleartf();

            }

            function ResetForm() {
                document.getElementById("person").reset();
            }
            $(document).on('click', '.rem', function () {
                $(this).parent().parent().remove();
                calsum();
            });

            var sum = 0;
            function calsum() {

                $('tr').each(function () {
                    //the value of sum needs to be reset for each row, so it has to be set inside the row loop

                    //find the combat elements in the current row and sum it 
                    $(this).find('.combat').each(function () {
                        var combat = $(this).text();
                        if (!isNaN(combat) && combat.length !== 0) {
                            sum += parseFloat(combat);
                            //alert(sum);
                        }
                    });
                    //set the value of currents rows sum to the total-combat element in the current row
                    $("#totalam").val(sum);

                });
                sum = 0;

            }
            function caltot() {
                var rprice = document.getElementById("rprice").value;
                var qty = document.getElementById("qty").value;
                var dis = document.getElementById("dis").value;
                var total = (rprice * qty);

                var distotal = (total * dis) / 100;
                total = (total - distotal);
                $("#total").val(total);


            }
            function caltotall() {
//                var rprice = document.getElementById("rprice").value;
//                var qty = document.getElementById("qty").value;
                var totdis = document.getElementById("totdis").value;
                var total = document.getElementById("totalam").value;

                var distotal = (total * totdis) / 100;
                total = (total - distotal);
                $("#netam").val(total);
                $("#disam").val(distotal);


            }
            function balance() {
                var cash = document.getElementById("cash").value;
                var net = document.getElementById("netam").value;

                var bal = cash - net;
                $("#bal").val(bal);

            }
            function focuscost(e) {
                if (e.keyCode == 13) {
                    $("#cost").focus();
                    return false;
                }
            }
            function runScript(e) {
                if (e.keyCode == 13) {
                    AddData();
                    saveitem();
                    $("#pname").focus();
                    return false;
                }
            }
            function focusrprice(e) {
                if (e.keyCode == 13) {
                    $("#rprice").focus();
                    return false;
                }
            }
            function focusbarcode(e) {
                if (e.keyCode == 13) {
                    $("#cost").focus();
                    return false;
                }
            }
            function focusqty(e) {
                if (e.keyCode == 13) {
                    $("#qty").focus();
                    return false;
                }
            }
            function focusdis(e) {
                if (e.keyCode == 13) {
                    $("#dis").focus();

                    return false;
                }
            }

        </script>
        <div class="col-md-2 mypadin100">

            <a href="sup.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Supplier</strong></button></a> 
            <div class="myPadinTop5"></div>
            <a href="Product.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Product</strong></button></a> 
            <div class="myPadinTop5"></div>
            <a href="Grn.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover mybtnselect"><strong>GRN</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="grn_return.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>GRN Return</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="store.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Store</strong></button></a>
            <div class="myPadinTop5"></div>
            <a href="settings.jsp"><button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Settings</strong></button></a>
            <div class="myPadinTop5"></div>
            <button class="btn btn-sm btn-default form-control myBtnHight50 myhover"><strong>Report</strong></button>
        </div>
        <div class="mypadin100 col-md-10">



            <label><%if(user!=null){out.write(user.getUname());}else{out.write("Gust");}%></label>
            <div class="panel panel-danger">
                <div class="panel-heading"><h3 class="panel-title"><strong>Good Receive Note</strong></h3></div>
                <div class="panel-body">
                    <form action="../grn_save" method="get">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-3">


                                    <div class="col-md-7">
                                        <input class="form-control" name="grnid" id="grnid" placeholder="GRN No"/>


                                    </div>
                                    <div class="col-md-1">
                                        <button class="btn btn-default myhover">Search</button>
                                    </div>

                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-5 mypadin7">
                                        Suppler Name:
                                    </div>  
                                    <div class="col-md-7">
                                        <select class="form-control" id="sup" name="sup">
                                            <%  Criteria c = ses.createCriteria(POJOS.Supplier.class);
                                                List<POJOS.Supplier> li1 = c.list();
                                                for (POJOS.Supplier sup : li1) {
                                            %>
                                            <option value="<%=sup.getIdsupplier()%>"><%=sup.getComname()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-5 mypadin7">
                                        Payment Type:
                                    </div>
                                    <div class="col-md-7">
                                        <select class="form-control" name="payment">
                                            <option>Cash</option>
                                            <option>Card</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <form id="person">
                            <div class="row mypadin7">
                                <div class="col-md-3">
                                    <!--<input class="form-control" id="pname" placeholder="Product Name"/>-->
                                    <select id="pname" name="pname" class="form-control" onkeypress="return focuscost(event)">
                                        <%
                                            Criteria c1 = ses.createCriteria(POJOS.Item.class);
                                            c1.addOrder(Order.asc("itemname"));
                                            List<POJOS.Item> li2 = c1.list();
                                            for (POJOS.Item item : li2) {
                                        %>
                                        <option value="<%=item.getIditem()%>"><%=item.getItemname()%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-md-2">
                                    <input class="form-control" id="cost" onkeypress="return focusrprice(event)" placeholder="Cost"/>
                                </div>

                                <div class="col-md-2">
                                    <input class="form-control" id="rprice" name="rprice" onkeypress="return focusqty(event)" placeholder="Retail Price"/>
                                </div>
                                <div class="col-md-2">
                                    <input class="form-control" id="qty" onkeypress="return focusdis(event)" placeholder="Qty"/>
                                </div>
                                <div class="col-md-1">
                                    <input class="form-control" id="dis" onkeyup="caltot()" onkeypress="return runScript(event);
                                            saveitem()" placeholder="Discount"/>
                                </div>
                                <div class="col-md-2">
                                    <input class="form-control" id="total" disabled="" style="text-align: right" placeholder="Total"/>
                                </div>
                            </div>



                            <br>
                            <div class="row mypadin7">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                                        <div id="tab">
                                            <table id="list" class="table table-bordered table-hover table-striped">
                                                <thead>
                                                    <tr>
                                                        <th style="text-align: center">Stock ID</th>
                                                        <th style="text-align: center">Itemcode</th>
                                                        <th style="width: 300px; text-align: center">Description</th>
                                                        <th style="text-align: center">Cost</th>
                                                        <th style="text-align: center">Retail Price</th>
                                                        <th style="text-align: center">Qty</th>
                                                        <th style="text-align: center">Discount</th>
                                                        <th style="text-align: center">Total</th>
                                                        <th style="text-align: center">Remove</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-2 mypadin7" style="width: 130px;">
                                        Total Amount :
                                    </div>
                                    <div class="col-md-3">
                                        <input class="form-control" disabled="" name="totalam" id="totalam" placeholder=""/>
                                    </div>
                                    <div class="col-md-1 mypadin7" style="width: 120px;">
                                        Cash :
                                    </div>
                                    <div class="col-md-3">
                                        <input class="form-control" id="cash" name="cash" onkeyup="balance()" placeholder=""/>
                                    </div>

                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-2 mypadin7" style="width: 130px;">
                                        Total Discount :
                                    </div>
                                    <div class="col-md-3">
                                        <input class="form-control" id="totdis" onkeyup="caltotall()" placeholder=""/>
                                    </div>
                                    <div class="col-md-1 mypadin7" style="width: 120px;">
                                        Balance :
                                    </div>
                                    <div class="col-md-3">
                                        <input class="form-control" disabled="" name="bal" id="bal" placeholder=""/>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-2 mypadin7" style="width: 130px;">
                                        Net Amount :
                                    </div>
                                    <div class="col-md-3">
                                        <input class="form-control" disabled="" id="netam" placeholder=""/>
                                    </div>
                                    <div class="col-md-1 mypadin7" style="width: 120px;">
                                        Dis Amount :
                                    </div>
                                    <div class="col-md-3">
                                        <input class="form-control" disabled="" id="disam" placeholder=""/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div style="height: 53px;">

                                </div>
                                <div>
                                    <button class="btn btn-default myBtnwidth150">Delete GRN</button>

                                </div>
                                <br>
                                <div>
                                    <button class="btn btn-default myBtnwidth150">Clear Table</button>
                                    <button class="btn btn-default myBtnwidth150">Print</button>
                                </div>
                            </div>
                            <div style="height: 53px;">

                            </div>
                            <div class="col-md-2">
                                <button class="btn btn-default myBtnwidth150 mysavebtnsize" type="submit" name="btn" value="save" id="save">Save/Print</button>
                            </div>
                        </form>
                </div>

            </div>

        </div>

    </body>
</html>
