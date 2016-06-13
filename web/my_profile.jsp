<%-- 
    Document   : my_profile
    Created on : Jun 9, 2016, 9:58:23 AM
    Author     : Sevi
--%>

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
                    if(i==0){
                    $('.del_add_savebtn').hide();
                        i++;
                    }else{
                    $('.del_add_savebtn').show();
                        i=0;
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
                    alert(file);
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
                            <img class="img-responsive img-circle" src="adminPanel/men/Via-Omiru-dot-com1.jpg"/>
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
                        <div class="row text-center">
                            <h4>
                                <%if (user != null) {
                                        out.write(user.getUtype().getUtype());
                                    }%>
                            </h4>
                        </div>
                        <div class="row">
                            <span class="glyphicon glyphicon-map-marker"></span> 44, Vimukthi Mawatha, Pelawatta, Battaramulla.
                        </div>
                        <br/>
                        <div class="row">
                            <span class="glyphicon glyphicon-pencil"></span> NIC - 920912460v
                        </div>
                        <br/>
                        <div class="row">
                            <span class="glyphicon glyphicon-phone"></span> <%=user.getMobile()%>
                        </div>
                        <br/>
                        <div class="row">
                            <span class="glyphicon glyphicon-envelope"></span> <%=user.getEmail()%>
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
                                    <div class="col-md-12">
<!--                                        <div class="row">
                                            <div class="col-md-2 col-md-offset-1">
                                                <h5><strong>Account Type</strong></h5>
                                            </div>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="Account Type" class="form-control"/>
                                            </div>
                                        </div>
                                        <br/>-->
                                        <div class="row">
                                            <div class="col-md-2 col-md-offset-1">
                                                <h5><strong>Name</strong></h5>
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" placeholder="First Name" class="form-control"/>
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" placeholder="Middle Name" class="form-control"/>
                                            </div>
                                            <div class="col-md-3">
                                                <input type="text" placeholder="Last Name" class="form-control"/>
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="row">
                                            <div class="col-md-2 col-md-offset-1">
                                                <h5><strong>Address</strong></h5>
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
                                                <h5><strong>Primary Mobile</strong></h5>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" placeholder="Mobile" class="form-control"/>
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="row">
                                            <div class="col-md-2 col-md-offset-1">
                                                <h5><strong>User Name</strong></h5>
                                            </div>
                                            <div class="col-md-4">
                                                <input type="text" placeholder="User Name" class="form-control"/>
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
                                                            <input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview"/> <!-- rename it -->
                                                        </div>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="row">
                                            <button class="btn btn-primary pull-right"><strong>Save Details</strong></button>
                                        </div>
                                    </div>
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
                                    <h3><strong>Primary Delivery Address</strong></h3>
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
                                            <button id="add_new_address" class="btn btn-warning" data-toggle="collapse" data-target="#demo">Add New Address</button>
                                            <button class="btn btn-primary pull-right del_add_savebtn"><strong>Save Details</strong></button>
                                        </div>

                                    </div>
                                    <div id="demo" class="collapse">
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
                                    </div>

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
                                            <input type="password" class="form-control" placeholder="Current Password"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-1">
                                        </div>
                                        <div class="col-md-4">
                                            <input type="password" class="form-control" placeholder="New Password"/>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-1">
                                        </div>
                                        <div class="col-md-4">
                                            <input type="password" class="form-control" placeholder="Confirm New Password"/>
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
