<%-- 
    Document   : my_profile
    Created on : Jun 9, 2016, 9:58:23 AM
    Author     : Sevi
--%>

<%@page import="POJOS.User"%>
<%@page import="POJOS.Addres"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.State"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>

        <title>JSP Page</title>
        <script>
            $(function () {
                $('#login-form-link').click(function (e) {
                    $("#login-form").delay(100).fadeIn(100);
                    $("#register-form").fadeOut(100);
                    $('#register-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });
                $('#register-form-link').click(function (e) {
                    $("#register-form").delay(100).fadeIn(100);
                    $("#login-form").fadeOut(100);
                    $('#login-form-link').removeClass('active');
                    $(this).addClass('active');
                    e.preventDefault();
                });
                var i = 0;
                $('#add_new_address').click(function (e) {
                    if (i == 0) {
                        $('.del_add_savebtn').hide();
                        i++;
                    } else {
                        $('.del_add_savebtn').show();
                        i = 0;
                    }
                });
            });
            $(document).ready(function () {

                $(".dropdown").hover(
                        function () {
                            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideDown("400");
                            $(this).toggleClass('open');
                        },
                        function () {
                            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true, true).slideUp("400");
                            $(this).toggleClass('open');
                        }
                );


            });





            <%
                HttpSession hs = request.getSession();
                POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");
                POJOS.Login login = (POJOS.Login) hs.getAttribute("login");

            %>

            function loginfirst() {

            <%                        if (user == null) {%>////
                alert("Please Login First !");
                ////    <%}%>

            }



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

            function save_delivary() {
                var fname = document.getElementById('fnam').value;
                var lname = document.getElementById('lnam').value;
                var address = document.getElementById('addres').value;
                var city = document.getElementById('cit').value;
                var state = document.getElementById('stat').value;
                var pcode = document.getElementById('zi').value;
                var mobile = document.getElementById('mobil').value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
//                        alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

                        alert(xhttp.responseText);

                        //document.getElementById('cartqty').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "user_delivery_address?fname="+fname+"&lname="+lname+"&address="+address+"&city="+city+"&state="+state+"&pcode="+pcode+"&mobile="+mobile+"&del=ok", true);
                xhttp.send();
            }
            function change_pw() {
                var cupass = document.getElementById('cupass').value;
                var newpass = document.getElementById('newpass').value;
                var copass = document.getElementById('copass').value;
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (xhttp.readyState === 4 && xhttp.status === 200) {
//                        alert(xhttp.status + "   hutaaaaaa    " + xhttp.readyState);

//                        alert(xhttp.responseText);

                        document.getElementById('cange').innerHTML = xhttp.responseText;
                    }
                };
                xhttp.open("POST", "change_pw?cupass="+cupass+"&newpass="+newpass+"&copass="+copass+"&change=ok", true);
                xhttp.send();
            }

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
                        alert("File has been uploaded successfully");
                    },
                    error: function (msg) {
                        $("#upload-error").text("Couldn't upload file");
                    }
                });
            });
        </script>
    </head>
    <body style="background: #e2f2f2">
        <%@include  file="site/header.jsp" %>
        <br/>
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-8 my-div-center">

                            <img class="img-responsive img-circle" src="<%if (user != null) {
                                    out.write(user.getImg());
                                }%>"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="text-center">
                            <h3>
                                <strong>
                                    <%if (user != null) {
                                            out.write(user.getFname() + " " + user.getLname());;
                                        }%>
                                </strong>
                            </h3>
                        </div>
                    </div>
                    <div class="col-md-12">

                        <div class="row">
                            <%
                                Session ses = objsave.getses();
                                Criteria c2 = ses.createCriteria(Addres.class);
                                c2.add(Restrictions.eq("user", user));
                                c2.add(Restrictions.eq("primaryAddress", 1));
                                Addres addr = (Addres) c2.uniqueResult();
                            %>
                            <span class="glyphicon glyphicon-map-marker"></span> <%if (addr != null) {
                                    out.write(addr.getAddress() + " " + addr.getCity() + " " + addr.getZip());
                                }%>
                        </div>
                        <br/>
                        <div class="row">
                            <span class="glyphicon glyphicon-pencil"></span> <%if (user.getNic() != null) {
                                    out.write(user.getNic());
                                }%>
                        </div>
                        <br/>
                        <div class="row">
                            <span class="glyphicon glyphicon-phone"></span> <%=user.getMobile()%>
                        </div>
                        <br/>
                        <div class="row">
                            <span class="glyphicon glyphicon-envelope"></span><%=login.getEmail()%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-body">

                    <h3><strong>User Details</strong></h3>
                    <hr/>

                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"><span class="glyphicon glyphicon-plus"></span>
                                        <strong>Personal Details</strong></a>
                                </h4>
                            </div>

                            <div id="collapse1" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <form id="upload-form" class="upload-box" action="user_details_save" method="post" enctype="multipart/form-data">
                                        <span id="upload-error" class="error">${uploadError}</span>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-2 col-md-offset-1">
                                                    <h5><strong>Name</strong></h5>
                                                </div>
                                                <%
                                                    User us = (User) request.getSession().getAttribute("user_obj");
                                                %>
                                                <div class="col-md-3">
                                                    <input type="text" placeholder="First Name" class="form-control" name="fname" value="<%=us.getFname()%>"/>
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" placeholder="Middle Name" class="form-control" name="mname" value="<%=us.getMname()%>"/>
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" placeholder="Last Name" class="form-control" name="lname" value="<%=us.getLname()%>"/>
                                                </div>
                                            </div>
                                            <br/>
                                            <div class="row">
                                                <div class="col-md-2 col-md-offset-1">
                                                    <h5><strong>Address</strong></h5>
                                                </div>
                                                <div class="col-md-6">
                                                    <%
                                                        Addres ad = (Addres) objsave.getses().createCriteria(Addres.class).add(Restrictions.and(Restrictions.eq("user", us),Restrictions.eq("primaryAddress", 1))).uniqueResult();
                                                    %>
                                                    <input type="text" placeholder="Address" class="form-control" name="address" value="<%if (ad != null) {
                                                            out.write(ad.getAddress());
                                                        } %>"/>
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="text" placeholder="City" class="form-control" name="city" value="<%if (ad != null) {
                                                            out.write(ad.getCity());
                                                        } %>"/>
                                                </div>
                                            </div>
                                            <br/>
                                            <div class="row">
                                                <div class="col-md-2 col-md-offset-1">
                                                    <h5><strong>State</strong></h5>
                                                </div>
                                                <div class="col-md-6">
                                                    <select class="form-control" name="state">
                                                        <%

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
                                                <div class="col-md-2 col-md-offset-1">
                                                    <h5><strong>Postal Code (Zip)</strong></h5>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" placeholder="Postal Code (Zip)" class="form-control" name="pcode" value="<%if (ad != null) {
                                                            out.write(ad.getZip());
                                                        }%>"/>
                                                </div>
                                            </div>
                                            <br/>
                                            <div class="row">
                                                <div class="col-md-2 col-md-offset-1">
                                                    <h5><strong>Primary Mobile</strong></h5>
                                                </div>
                                                <div class="col-md-6">
                                                    <input type="text" placeholder="Mobile" class="form-control" name="mobile" value="<%=us.getMobile()%>"/>
                                                </div>
                                            </div>
                                            <br/>
                                            <div class="row">
                                                <div class="col-md-2 col-md-offset-1">
                                                    <h5><strong>NIC</strong></h5>
                                                </div>
                                                <div class="col-md-4">
                                                    <input type="text" placeholder="NIC" class="form-control" name="nic" value="<%=us.getNic()%>"/>
                                                </div>
                                            </div>
                                            <br/>

                                            <!--<hr/>-->
                                            <div class="row">
                                                <div class="col-md-2 col-md-offset-1">
                                                    <h5><strong>Profile Picture</strong></h5>
                                                </div>
                                                <div class="col-md-5">
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
                                                <button class="btn btn-primary pull-right" type="submit"><strong>Save Details</strong></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"><span class="glyphicon glyphicon-plus"></span>
                                        <strong>Delivery Address</strong></a>
                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <h3><strong>Delivery Address</strong></h3>
                                    <hr/>
                                    <%
                                    Criteria cd=objsave.getses().createCriteria(Addres.class);
                                    cd.add(Restrictions.eq("user", user));
                                    cd.add(Restrictions.eq("primaryAddress", 0));
                                    Addres a=(Addres)cd.uniqueResult();
                                    %>
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-1">
                                            <h5><strong>Contact Name</strong></h5>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="text" placeholder="First Name" class="form-control" id="fnam" value="<%if(a!=null){out.write(a.getUser().getFname());}%>"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="text" placeholder="Last Name" class="form-control" id="lnam" value="<%if(a!=null){out.write(a.getUser().getLname());}%>"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-1">
                                            <h5><strong>Street Address</strong></h5>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" placeholder="Address" class="form-control" id="addres" value="<%if(a!=null){out.write(a.getAddress());}%>"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input type="text" placeholder="City" class="form-control" id="cit" value="<%if(a!=null){out.write(a.getCity());}%>"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-1">
                                            <h5><strong>State</strong></h5>
                                        </div>
                                        <div class="col-md-6">
                                            <select name="state" class="form-control" id="stat">   
                                                <%
                                                    Session se = controler.connector.getSessionFactory().openSession();
                                                    Criteria c11 = se.createCriteria(State.class);
                                                    List<State> li11 = c11.list();
                                                    for (State state : li11) {
                                                %>
                                                <option value="<%=state.getIdstate()%>"><%=state.getState()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-1">
                                            <h5><strong>Postal Code (Zip)</strong></h5>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" placeholder="Postal Code (Zip)" class="form-control" id="zi" value="<%if(a!=null){out.write(a.getZip());}%>"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-1">
                                            <h5><strong>Mobile</strong></h5>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" placeholder="Mobile" class="form-control" id="mobil" value="<%if(a!=null){out.write(a.getUser().getMobile());}%>"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <!--<button id="add_new_address" class="btn btn-warning" data-toggle="collapse" data-target="#demo">Add New Address</button>-->
                                            <button class="btn btn-primary pull-right del_add_savebtn" onclick="save_delivary()"><strong>Save Details</strong></button>
                                        </div>

                                    </div>
                                    <!--                                    <div id="demo" class="collapse">
                                                                            <h3><strong>Add New Address</strong></h3>
                                                                            <hr/>
                                                                            <div class="row">
                                                                                <div class="col-md-2 col-md-offset-1">
                                                                                    <h5><strong>Contact Name</strong></h5>
                                                                                </div>
                                                                                <div class="col-md-4">
                                                                                    <input type="text" placeholder="Contact Name" class="form-control"/>
                                                                                </div>
                                                                            </div>
                                                                            <br/>
                                                                            <div class="row">
                                                                                <div class="col-md-2 col-md-offset-1">
                                                                                    <h5><strong>Street Address</strong></h5>
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                    <input type="text" placeholder="Address" class="form-control"/>
                                                                                </div>
                                                                                <div class="col-md-3">
                                                                                    <input type="text" placeholder="City" class="form-control"/>
                                                                                </div>
                                                                            </div>
                                                                            <br/>
                                                                            <div class="row">
                                                                                <div class="col-md-2 col-md-offset-1">
                                                                                    <h5><strong>State</strong></h5>
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                    <input type="text" placeholder="State" class="form-control"/>
                                                                                </div>
                                                                            </div>
                                                                            <br/>
                                                                            <div class="row">
                                                                                <div class="col-md-2 col-md-offset-1">
                                                                                    <h5><strong>Postal Code (Zip)</strong></h5>
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                    <input type="text" placeholder="Postal Code (Zip)" class="form-control"/>
                                                                                </div>
                                                                            </div>
                                                                            <br/>
                                                                            <div class="row">
                                                                                <div class="col-md-2 col-md-offset-1">
                                                                                    <h5><strong>Mobile</strong></h5>
                                                                                </div>
                                                                                <div class="col-md-6">
                                                                                    <input type="text" placeholder="Mobile" class="form-control"/>
                                                                                </div>
                                                                            </div>
                                                                            <br/>
                                                                            <div class="row">
                                                                                <div class="col-md-12">
                                                                                    <button id="del_add_savebtn2" class="btn btn-primary pull-right"><strong>Save Details</strong></button>
                                                                                </div>
                                                                            </div>
                                                                        </div>-->

                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"><span class="glyphicon glyphicon-plus"></span>
                                        <strong>Security</strong></a>
                                </h4>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-1">
                                            <h5><strong>Password</strong></h5>
                                        </div>
                                        <div class="col-md-4">
                                            <input type="password" class="form-control" placeholder="Current Password" id="cupass"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-1">
                                        </div>
                                        <div class="col-md-4">
                                            <input type="password" class="form-control" placeholder="New Password" id="newpass"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-1">
                                        </div>
                                        <div class="col-md-4">
                                            <input type="password" class="form-control" placeholder="Confirm New Password" id="copass"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-1">
                                        </div>
                                        <div class="col-md-4" id="cange">
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button id="del_add_savebtn2" class="btn btn-primary pull-right" onclick="change_pw()"><strong>Save Details</strong></button>
                                        </div>
                                    </div>
                                    <br/>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </body>
</html>
