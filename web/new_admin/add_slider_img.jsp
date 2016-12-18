<%-- 
    Document   : add_slider_img
    Created on : Dec 6, 2016, 7:15:05 PM
    Author     : Sevi
--%>

<%@page import="POJOS.User"%>
<%@page import="Src.privilege_class"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            <style>

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
    <script>
        function getFileName() {
            var fileName = document.getElementById("selectFile").value;
            var f = fileName.split("\\");
            //alert("ok");

//                document.getElementById("fileName").value = f[f.length - 1];
//                var a = document.getElementById("selectFile").files;
//                for (var i = 0; i < a.length; i++) {
//                    //alert(a[i].name + "," + ((a[i].size) / 1024) / 1024);
//                }
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
                        elem.setAttribute("height", "150");
                        elem.setAttribute("width", "150");
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
    </script>
</head>
<body>
    <h3 style="margin-top: -20px"><strong>Add Image to Slider</strong></h3>
    <%if (request.getSession().getAttribute("user_obj").toString() != null) {
             privilege_class p = new privilege_class();
              User su = (User) request.getSession().getAttribute("user_obj");
              if (p.getPrivilage(su.getIduser().toString(), request.getRequestURI())) {%>
    <div class="col-md-6">
        <div class="panel panel-danger">
            <form action="../advertisement_up"  id="upload-form" class="upload-box" method="post" enctype="multipart/form-data">
                <div class="panel-body">

                    <div class="row">
                        <div class="col-md-4 mypadin7">
                            <label>Required Image size :</label>
                        </div>
                        <div class="col-md-8">
                            <h5 style="color: #666666" id="imgsize">850 px X 200 px</h5>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-md-4 mypadin7">
                            <label>Images : </label>  
                        </div>
                        <div class="col-md-8">
                            <label class="btn btn-info btn-file">
                                Browse <input onchange="readurl(this)" class="upload" type="file" accept="image/png, image/jpeg, image/gif" name="fupload" id="selectFile" multiple=""/>
                            </label>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-4 mypadin7">
                        </div>
                        <div class="col-md-8">
                            <div id="myimg">

                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-4 mypadin7">
                        </div>
                        <div class="col-md-8">
                            <button class="btn btn-primary pull-right" type="submit">Save</button>
                        </div>

                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel panel-danger">
            <div class="panel-body">
                <div class="thumbnail">
                    <img src="../img/sliderbac.png"/>
                </div>
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
