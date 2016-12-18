<%-- 
    Document   : adsearch
    Created on : Dec 12, 2016, 3:08:36 PM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="inc.jsp" %>
        <script>
            function subsearch() {
                var catid = document.getElementById('catid').value;
                var xhttp = new XMLHttpRequest();
                //alert("xhttp.readyState"ok);
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('subcat').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "category?subsearchcat=" + catid, true);
                xhttp.send();
            }
            function adsearch() {
                var catid = document.getElementById('catid').value;
                var subcat = document.getElementById('subcat').value;
                var pnam = document.getElementById('pnam').value;
                var xhttp = new XMLHttpRequest();
                //alert("xhttp.readyState"ok);
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        alert(xhttp.responseText);
                        //document.getElementById('subcat').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "search?search=ok&catid="+catid+"&subcat="+subcat+"&pname="+pnam, true);
                xhttp.send();
            }
//            subsearch();
        </script>
    </head>
    <body>
        <%@include file="site/header.jsp" %>
        <%@include file="site/Category.jsp" %>
        <div class="col-md-9">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-3">
                        <select class="form-control" id="catid" onchange="subsearch()" onclick="subsearch()" name="catid">
                            <%
                                List<Cat> list = objsave.getses().createCriteria(Cat.class).list();
                                for (Cat cat : list) {
                            %>

                            <option value="<%=cat.getIdcat()%>"><%=cat.getCatname()%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="form-control" id="subcat" name="subcat">

                        </select>
                    </div>
                    <div class="col-md-4">
                        <input placeholder="Name" class="form-control" id="pnam"/>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-default btn-block" onclick="adsearch()">Search</button>
                    </div>
                </div>
            </div>
            <div class="col-md-12">

            </div>
        </div>
    </body>
</html>
