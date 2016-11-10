<%-- 
    Document   : product
    Created on : Oct 6, 2016, 11:43:35 PM
    Author     : Sevi
--%>

<%@page import="POJOS.User"%>
<%@page import="Src.privilege_class"%>
<%@page import="POJOS.TempSize"%>
<%@page import="POJOS.TempColor"%>
<%@page import="POJOS.Item"%>
<%@page import="java.util.List"%>
<%@page import="Src.objsave"%>
<%@page import="POJOS.Cat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #progressBox{
                width: 500px;
                height: auto;
            }
            #fileName{
                width: 304px;
            }
            #upFile{
                position: relative;
                overflow: hidden;
                margin: 10px;
            }
            .upload{
                opacity: 0;
                cursor: pointer;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                position: absolute;
            }
            .myimgs{
                margin-left: 10px;
                margin-top: 10px;
                cursor: pointer;
            }
        </style>
        <script type="text/javascript">
            function getFileName() {
                var fileName = document.getElementById("selectFile").value;
                var f = fileName.split("\\");

                document.getElementById("fileName").value = f[f.length - 1];
                var a = document.getElementById("selectFile").files;
                for (var i = 0; i < a.length; i++) {
                    //alert(a[i].name + "," + ((a[i].size) / 1024) / 1024);
                }
            }
            function readurl(input) {
                getFileName();
                var c = 0;
                if (input.files.length <= 5) {
                    for (var i = 0; i < input.files.length; i++) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            var elem = document.createElement("img");
                            elem.setAttribute("id", c);
                            elem.setAttribute("class", "myimgs");
                            elem.setAttribute("src", e.target.result);
                            elem.setAttribute("height", "75");
                            elem.setAttribute("width", "100");
                            elem.setAttribute("onclick", 'deleteimage(' + c + ')');
                            document.getElementById("myimg").appendChild(elem);
                            c++;
                        }
                        reader.readAsDataURL(input.files[i]);
                    }
                } else {
                    alert("Image Overloaded five images only");
                }
            }

            function deleteimage(x) {
                $("#" + x).remove();
            }

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
                xhttp.open("POST", "../category?subsearchcat=" + catid, true);
                xhttp.send();
            }
            function addcolor() {
                var color = document.getElementById('color').value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        sync_color_tb();
                        //alert(xhttp.responseText);

                        //document.getElementById('subcat').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../size_color?adcolor=" + color + "&addcolor=add", true);
                xhttp.send();
            }
            function addsize() {
                var size = document.getElementById('size').value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        sync_size_tb();
                        //alert(xhttp.responseText);

                        //document.getElementById('subcat').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../size_color?adsize=" + size + "&addsize=add", true);
                xhttp.send();
            }
            function sync_color_tb() {
                //alert("called");
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);

                        document.getElementById('colortb').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../size_color?synccolor=ok", true);
                xhttp.send();
            }
            function sync_size_tb() {
                //alert("called");
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);

                        document.getElementById('sizetb').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../size_color?syncsize=ok", true);
                xhttp.send();
            }

            subsearch();
        </script>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Product</strong></h3>
        <%if (request.getSession().getAttribute("user_obj").toString() != null) {
                privilege_class p = new privilege_class();
                User su = (User) request.getSession().getAttribute("user_obj");
                if (p.getPrivilage(su.getIduser().toString(), request.getRequestURI())) {%>
        <div class="col-md-7">
            <div class="panel panel-danger">
                <div class="panel-body">
                    <form action="../product" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                <label>Category Name : </label>
                            </div>
                            <div class="col-md-8">
                                <select class="form-control" id="catid" onchange="subsearch()" onclick="subsearch()" name="catid">
                                    <%
                                        List<Cat> list = objsave.getses().createCriteria(Cat.class).list();
                                        for (Cat cat : list) {
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
                                <select class="form-control" id="subcat" name="subcat">

                                </select>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                <label>Item Name : </label>  
                            </div>
                            <div class="col-md-8">
                                <input placeholder="Item Name" class="form-control" name="itemname" required="">
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                <label>Description : </label>  
                            </div>
                            <div class="col-md-8">
                                <textarea rows="5" class="form-control" placeholder="Item Description" name="description"></textarea>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                <label>Images : </label>  
                            </div>
                            <div class="col-md-8">
                                <div id="progressBox">
                                    <input disabled="disabled" id="fileName" placeholder="Choose File"/>
                                    <div id="upFile" class="btn btn-warning">
                                        <span>Select</span>
                                        <input onchange="readurl(this)" class="upload" type="file" name="fupload" id="selectFile" required="" multiple=""/>
                                    </div>
                                    <br>
                                    <div id="message"></div>
                                    <div id="myimg">

                                    </div>
                                </div>

                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                <label>Add Colors : </label>  
                            </div>
                            <div class="col-md-6">
                                <input placeholder="Color Name" class="form-control" id="color">
                            </div>
                            <div class="col-md-2">
                                <button class="btn btn-success btn-block" id="coloradd" onclick="addcolor()" type="button">Add</button>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                            </div>
                            <div class="col-md-6">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                    <th>Colors</th>
                                    </thead>
                                    <tbody id="colortb">
                                        <%
                                            List<TempColor> collist = objsave.getses().createCriteria(TempColor.class).list();
                                            for (TempColor tc : collist) {
                                        %>
                                        <tr>
                                            <td><%=tc.getColor()%></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                                <label>Add Sizes : </label>  
                            </div>
                            <div class="col-md-6">
                                <input placeholder="Size Name" class="form-control" name="sizename" id="size">
                            </div>
                            <div class="col-md-2">
                                <button class="btn btn-success btn-block" id="sizeadd" type="button" onclick="addsize()">Add</button>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4 mypadin7">
                            </div>
                            <div class="col-md-6">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                    <th>Sizes</th>
                                    </thead>
                                    <tbody id="sizetb">
                                        <%
                                            List<TempSize> sizlist = objsave.getses().createCriteria(TempSize.class).list();
                                            for (TempSize tc : sizlist) {
                                        %>
                                        <tr>
                                            <td><%=tc.getSize()%></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4 mypadin7">

                            </div>
                            <div class="col-md-8 ">
                                <div class="col-md-3 pull-right">

                                    <button class="btn btn-primary pull-right btn-block" onclick="save()">Save</button>
                                </div>
                                <div class="col-md-3 pull-right">

                                    <button class="btn btn-info pull-right btn-block" onclick="">Update</button>
                                </div>
                            </div>
                        </div>

                    </form>


                </div>

            </div>
        </div>
        <div class="col-md-5">
            <div class="row">
                <div style="display: block; max-height: 250px; overflow: hidden; overflow-y: scroll;">
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>Item</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Item> itemlist = objsave.getses().createCriteria(Item.class).list();
                                for (Item cat : itemlist) {
                            %>
                            <tr>
                                <td class="cat"><%=cat.getItemname()%></td>
                            </tr>
                            <%}%>


                        </tbody>
                    </table>
                </div>
            </div>
            <br/>
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
