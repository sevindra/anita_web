<%-- 
    Document   : sub_category
    Created on : Oct 6, 2016, 11:37:17 PM
    Author     : Sevi
--%>

<%@page import="POJOS.Subcat"%>
<%@page import="POJOS.Cat"%>
<%@page import="Src.objsave"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function save() {
                var savebtn= document.getElementById('subsave').innerHTML;
                var subcatname= document.getElementById('subcatname').value;
                var catid= document.getElementById('catid').value;

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(catid+"ff");
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        alert(xhttp.responseText);
                        $('#subcatname').val("");
                        $('#subcatname').focus();
                        //document.getElementById('sup_table').innerHTML=xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../category?subsave="+savebtn+"&subcatname="+subcatname+"&catid="+catid, true);
                xhttp.send();
            }

        </script>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Sub Category</strong></h3>
        <div class="col-md-7">
            <div class="panel panel-danger">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4 mypadin7">
                            <label>Category Name : </label>  
                        </div>
                        <div class="col-md-8">
                            <select class="form-control" id="catid">
                                <%
                                List<Cat> list = objsave.getses().createCriteria(Cat.class).list();
                                for(Cat cat:list){
                                %>
                                <option value="<%=cat.getIdcat()%>"><%=cat.getCatname()%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-4 mypadin7">
                            <label>Sub Category Name : </label>  
                        </div>
                        <div class="col-md-8">
                            <input placeholder="Sub Category Name" class="form-control" id="subcatname">
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-4 mypadin7">

                        </div>
                        <div class="col-md-8 ">
                            <div class="col-md-3 pull-right">

                                <button class="btn btn-primary pull-right btn-block" onclick="save()" id="subsave">Save</button>
                            </div>
                            <div class="col-md-3 pull-right">

                                <button class="btn btn-info pull-right btn-block" onclick="">Update</button>
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
                            <th>Sub Category</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        List<Subcat> tlist=objsave.getses().createCriteria(Subcat.class).list();
                        for(Subcat subcat:tlist){
                        %>
                        <tr>
                            <td><%=subcat.getSubname()%></td>
                        </tr>
                        <%}%>


                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
