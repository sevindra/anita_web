<%-- 
    Document   : test_delete
    Created on : May 13, 2016, 6:44:55 PM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../adminPanel/inc.jsp" %>
        <title>JSP Page</title>
        <script>
            $(document).ready(function () {
                $('.alert-autocloseable-success').hide();
                
                $('#autoclosable-btn-success').click(function () {
                    $('#autoclosable-btn-success').prop("disabled", true);
                    $('.alert-autocloseable-success').show();

                    $('.alert-autocloseable-success').delay(1000).fadeOut("slow", function () {
                        // Animation complete.
                        $('#autoclosable-btn-success').prop("disabled", false);
                    });
                });

                $(document).on('click', '.close', function () {
                    $(this).parent().hide();
                });
                alert("ok");
            });
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div style="height: 600px;">
            <div class="row">
                <h2>Click buttons to test alert messages</h2>
                <br />
                <div class="col-md-3">
                    <!-- Success buttons messages -->
                    <button id="autoclosable-btn-success" class="btn btn-primary btn-success btn-block">Autocloseable message success</button>
                    

                </div>
                <div class="col-md-9">
                    <!-- Success messages -->
                    <div class="alert alert-success alert-autocloseable-success">
                        I'm an autocloseable success  message. I will hide in 5 seconds.
                    </div>
                    
                </div>
            </div>
        </div>
        
    </body>
</html>
