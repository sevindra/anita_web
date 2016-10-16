<%-- 
    Document   : category
    Created on : Oct 6, 2016, 10:21:35 PM
    Author     : Sevi
--%>

<%@page import="POJOS.Cat"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Src.objsave"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            
            var catid;
            var gotcatid;
            function save() {
                var savebtn= document.getElementById('savebtn').innerHTML;
                var catname= document.getElementById('catname').value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        sync_table();
                        alert(xhttp.responseText);
                        $('#catname').val("");
                        $('#catname').focus();
                        //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?savebtn="+savebtn+"&catname="+catname, true);
                xhttp.send();
            }
            $(document).ready(function() {
                $(document).on('click', '.cat', function() {
                    //alert($(this).parent().html());
                    var catname=$(this).parent().html();
                    var ar=catname.split(">");
                   var ar2=ar[1];
                   var ar3=ar2.split("<");
                    //alert(ar3[0]);
                    $("#catname").val(ar3[0]);
                    catid=ar3[0];
                    
                   var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        gotcatid=xhttp.responseText;
                        //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                    }
                };
                    //alert(catid);
                xhttp.open("POST", "../category?catupdate="+catid, true);
                xhttp.send(); 
                });
            });
            
            function update() {
                var catname= document.getElementById('catname').value;
                var updatebtn= document.getElementById('updatebtn').innerHTML;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        sync_table();
                        alert(xhttp.responseText);
                        //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?updatebtn="+updatebtn+"&updatecatid="+gotcatid+"&catname="+catname, true);
                xhttp.send();
            }
            
            function sync_table() {
                
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('cattable').innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?synctb=ok", true);
                xhttp.send();
            }
            
             
        </script>

    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Category</strong></h3>
        <div class="col-md-7">
            <div class="panel panel-danger">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4 mypadin7">
                            <label>Category Name : </label>  
                        </div>
                        <div class="col-md-8">
                            <input placeholder="Category Name" class="form-control" id="catname">
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-4 mypadin7">

                        </div>
                        <div class="col-md-8 ">
                            <div class="col-md-3 pull-right">

                                <button class="btn btn-primary pull-right btn-block" onclick="save()" id="savebtn">Save</button>
                            </div>
                            <div class="col-md-3 pull-right">

                                <button class="btn btn-info pull-right btn-block" onclick="update()" id="updatebtn">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div style="display: block; max-height: 300px; overflow: hidden; overflow-y: scroll;">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Category</th>
                        </tr>
                    </thead>
                    <tbody id="cattable">
                        <%
                        List<Cat> list=objsave.getses().createCriteria(Cat.class).list();
                        for(Cat cat:list){
                        %>
                        <tr>
                            <td class="cat"><%=cat.getCatname()%></td>
                        </tr>
                        <%}%>


                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
