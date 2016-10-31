<%-- 
    Document   : testmess
    Created on : Oct 22, 2016, 10:47:24 AM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>JSP Page</title>
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
                for (var i = 0; i < input.files.length; i++) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        var elem = document.createElement("img");
                        elem.setAttribute("id", c);
                        elem.setAttribute("class", "myimgs");
                        elem.setAttribute("src", e.target.result);
                        elem.setAttribute("height", "100");
                        elem.setAttribute("width", "100");
                        elem.setAttribute("onclick", 'deleteimage(' + c + ')');
                        document.getElementById("myimg").appendChild(elem);
                        c++;
                    }
                    reader.readAsDataURL(input.files[i]);
                }
            }

            function deleteimage(x) {
                $("#" + x).remove();
            }

        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form enctype="multipart/form-data" method="post" id="uploadForm" action="fileupload">
            <div id="progressBox">
                <input disabled="disabled" id="fileName" placeholder="Choose File"/>
                <div id="upFile" class="btn btn-primary">
                    <span>Select</span>
                    <input onchange="readurl(this)" class="upload" type="file" name="myfile" id="selectFile" multiple/>
                </div>
                <br>
                <div id="message">sssss</div>
                <div id="myimg">

                </div>
            </div>
            <br>
            <input type="submit" class="btn btn-danger" value="Upload My Files"/>
        </form>
    </body>
</html>
