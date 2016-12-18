<%-- 
    Document   : Add_user
    Created on : Nov 10, 2016, 9:14:23 AM
    Author     : Sevi
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.State"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Src.objsave"%>
<%@page import="POJOS.Utype"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.User"%>
<%@page import="Src.privilege_class"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>

            //....................file upload
            $(document).on('click', '#close-preview', function () {
                $('.image-preview').popover('hide');
                // Hover befor close the preview
                $('.image-preview').hover(
                        function () {
                            $('.image-preview').popover('show');
                        },
                        function () {
                            $('.image-preview').popover('hide');
                        }
                );
            });

            $(function () {
                // Create the close button
                var closebtn = $('<button/>', {
                    type: "button",
                    text: 'x',
                    id: 'close-preview',
                    style: 'font-size: initial;',
                });
                closebtn.attr("class", "close pull-right");
                // Set the popover default content
                $('.image-preview').popover({
                    trigger: 'manual',
                    html: true,
                    title: "<strong>Preview</strong>" + $(closebtn)[0].outerHTML,
                    content: "There's no image",
                    placement: 'bottom'
                });
                // Clear event
                $('.image-preview-clear').click(function () {
                    $('.image-preview').attr("data-content", "").popover('hide');
                    $('.image-preview-filename').val("");
                    $('.image-preview-clear').hide();
                    $('.image-preview-input input:file').val("");
                    $(".image-preview-input-title").text("Browse");
                });
                // Create the preview image
                $(".image-preview-input input:file").change(function () {
                    var img = $('<img/>', {
                        id: 'dynamic',
                        width: 250,
                        height: 200
                    });
                    var file = this.files[0];
                    var reader = new FileReader();
                    // Set preview image into the popover data-content
                    reader.onload = function (e) {
                        $(".image-preview-input-title").text("Change");
                        $(".image-preview-clear").show();
                        $(".image-preview-filename").val(file.name);
                        img.attr('src', e.target.result);
                        $(".image-preview").attr("data-content", $(img)[0].outerHTML).popover("show");
                    }
                    reader.readAsDataURL(file);
//                    alert(file);
                });
            });


            function User_save() {
                //alert("called");
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        alert(xhttp.responseText);

                        //document.getElementById('colortb').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../admin_add_user", true);
                xhttp.send();
            }

            $(function () {
                $('#upload-form').ajaxForm({
                    success: function (msg) {
                        alert("File has been uploaded successfully");
                    },
                    error: function (msg) {
                        $("#upload-error").text("Couldn't upload file");
                    }
                });
            });
        </script>
        <script type="text/javascript">
            function getFileName() {
                var fileName = document.getElementById("selectFile").value;
                var f = fileName.split("\\");

                document.getElementById("fileName").value = f[f.length - 1];
                var a = document.getElementById("selectFile").files;
                for (var i = 0; i < a.length; i++) {
                    alert(a[i].name + "," + ((a[i].size) / 1024) / 1024);
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
                    };
                    reader.readAsDataURL(input.files[i]);
                }
            }

            function deleteimage(x) {
                $("#" + x).remove();
            }

            $(function () {
                $('#upload-form').ajaxForm({
                    success: function (msg) {
                        document.getElementById('fname').value = "";
                        document.getElementById('mname').value = "";
                        document.getElementById('lname').value = "";
                        document.getElementById('address').value = "";
                        document.getElementById('city').value = "";
                        document.getElementById('mobile').value = "";
                        document.getElementById('mobile2').value = "";
                        document.getElementById('email').value = "";
                        document.getElementById('pass').value = "";
//                        document.getElementById('cpass').value = "";
                        sync_table();
                        alert("File has been uploaded successfully");
                    },
                    error: function (msg) {
                        $("#upload-error").text("Couldn't upload file");
                    }
                });
            });

            function sync_table() {

                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    //alert(xhttp.readyState);
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
                        //alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);
                        //alert(xhttp.responseText);
                        document.getElementById('udb').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "../search?synuser=ok", true);
                xhttp.send();
            }
        </script>
    </head>
    <body>
        <h3 style="margin-top: -20px"><strong>Add User</strong></h3>
        <%if (request.getSession().getAttribute("user_obj").toString() != null) {
                privilege_class p = new privilege_class();
                User su = (User) request.getSession().getAttribute("user_obj");
                if (p.getPrivilage(su.getIduser().toString(), request.getRequestURI())) {%>
        <div class="col-md-7">
            <div class="panel panel-danger">
                <div class="panel-heading"><strong>Add User</strong></div>
                <div class="panel-body">

                    <form action="../admin_add_user"  id="upload-form" class="upload-box" method="post" enctype="multipart/form-data">
                        <span id="upload-error" class="error">${uploadError}</span>
                        <div class="row">
                            <div class="col-md-4">
                                <h5><strong>Name : </strong></h5>
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" placeholder="First Name" name="fname" required="" id="fname"/>
                                <br/>
                                <input class="form-control" placeholder="Midle Name" name="mname" id="mname"/>
                                <br/>
                                <input class="form-control" placeholder="Last Name" name="lname" required="" id="lname"/>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4">
                                <h5><strong>Address : </strong></h5>
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" placeholder="Address" name="address" required="" id="address"/>
                                <br/>
                                <input class="form-control" placeholder="City" name="city" required="" id="city"/>                            
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4">
                                <h5><strong>State</strong></h5>
                            </div>
                            <div class="col-md-8">
                                <select name="state" class="form-control" required="">   
                                    <%
                                        Session ses = controler.connector.getSessionFactory().openSession();
                                        Criteria c1 = ses.createCriteria(State.class);
                                        List<State> li1 = c1.list();
                                        for (State state : li1) {
                                    %>
                                    <option value="<%=state.getIdstate()%>"><%=state.getState()%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4">
                                <h5><strong>Mobile : </strong></h5>
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" placeholder="Mobile No1" name="mobile" required="" id="mobile"/>                    
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" placeholder="Mobile No2" name="mobile2" id="mobile2"/>                    
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4">
                                <h5><strong>Email : </strong></h5>
                            </div>
                            <div class="col-md-8">
                                <input placeholder="Email" name="email" required="" class="form-control" id="email"/>              
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4">
                                <h5><strong>NIC : </strong></h5>
                            </div>
                            <div class="col-md-8">
                                <input class="form-control" placeholder="NIC" name="nic" required="" id="nic"/>                    
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4">
                                <h5><strong>User Type : </strong></h5>
                            </div>
                            <div class="col-md-8">
                                <select class="form-control" name="utype">
                                    <%
                                        List<Utype> ut = objsave.getses().createCriteria(Utype.class).add(Restrictions.or(Restrictions.eq("idutype", 2), Restrictions.eq("idutype", 3))).list();
                                        for (Utype utype : ut) {
                                    %>
                                    <option value="<%=utype.getIdutype()%>"><%=utype.getUtype()%></option>
                                    <%}%>
                                </select>                
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4">
                                <h5><strong>Profile Picture</strong></h5>
                            </div>
                            <div class="col-md-8">
                                <div class="input-group image-preview">
                                    <input type="text" class="form-control image-preview-filename" disabled="disabled"> <!-- don't give a name === doesn't send on POST/GET -->
                                    <span class="input-group-btn">
                                        <!-- image-preview-clear button -->
                                        <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                            <span class="glyphicon glyphicon-remove"></span> Clear
                                        </button>
                                        <!-- image-preview-input -->
                                        <div class="btn btn-default image-preview-input">
                                            <span class="glyphicon glyphicon-folder-open"></span>
                                            <span class="image-preview-input-title">Browse</span>
                                            <input onchange="readurl(this)" class="upload" type="file" accept="image/png, image/jpeg, image/gif" name="fupload" id="selectFile"/> <!-- rename it -->

                                        </div>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="col-md-4">
                                <h5><strong>Password : </strong></h5>
                            </div>
                            <div class="col-md-8">
                                <input placeholder="Password" name="pass" required="" class="form-control" id="pass"/>              
                            </div>
                        </div>
                        <br/>
                        <!--                        <div class="row">
                                                    <div class="col-md-4">
                                                        <h5><strong> Confirm Password : </strong></h5>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <input placeholder="Confirm Password" name="cpass" required="" class="form-control"/>              
                                                    </div>
                                                </div>
                                                <br/>-->

                        <div class="row">
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-8">
                                <div class="col-md-4 pull-right">
                                    <button class="btn btn-primary btn-block" type="submit">Save</button>
                                </div>
                                <div class="col-md-4 pull-right">
                                    <button class="btn btn-info btn-block">Update</button>
                                </div>
                            </div>
                        </div> 
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-5">

            <table class="table table-bordered table-responsive table-striped">
                <thead>
                <th>NIC</th>
                <th>Users</th>
                </thead>
                <tbody id="udb">
                    <%
                        Utype uty = (Utype) objsave.getses().load(Utype.class, 4);
                        Session s = objsave.getses();
                        Criteria c = s.createCriteria(User.class);
                        c.add(Restrictions.eq("status", 1));
                        c.add(Restrictions.not(Restrictions.eq("utype", uty)));
                        List<User> us = c.list();
                        for (User u : us) {
                    %>
                    <tr>
                        <td><%=u.getNic()%></td>
                        <td><%=u.getFname()%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
        <%} else {
        %>
        <div class="col-md-12" style='position:absolute;z-index:0;left:0;top:0;width:100%;height:100%'>
            <img src='../img/no_access.jpg' style='width:100%;height:450px'  />
        </div>
        <%
                }
            }%>
    </body>
</html>
