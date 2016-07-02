<%-- 
    Document   : newjsp
    Created on : 01-Jul-2016, 21:02:19
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../adminPanel/inc.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>

        <div class="container">
            <h2>Activate Modal with JavaScript</h2>
            <!-- Trigger the modal with a button -->
            <button type="button" class="btn btn-info btn-lg" id="myBtn">Open Modal</button>

            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modal Header</h4>
                        </div>
                        <div class="modal-body">
                            <p>Some text in the modal.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <script>
            $(document).ready(function () {
                $("#myBtn").click(function () {
                    $("#myModal").modal();
                
                
            });
        </script>

    </body>
</html>
