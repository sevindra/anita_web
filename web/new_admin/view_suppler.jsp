<%-- 
    Document   : view_suppler
    Created on : Jun 18, 2016, 12:36:03 PM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <title>JSP Page</title>
        <%@include file="../my_main_script.jsp" %>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <br/>
        <%@include file="admin_side_panel.jsp" %>
        <div class="col-md-10">
            <div class="col-md-12">
                <div class="panel panel-danger">
                    <div class="panel-heading"><strong>View Supplier</strong></div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="text-center">
                                <th>Supplier Name</th>
                                <th>Company Name</th>
                                <th>Contact No</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Activate</th>
                                <th>Delete</th>
                            </tr>
                            <tr>
                                <td>sevindra</td>
                                <td>Anita Aparel</td>
                                <td>0716048774</td>
                                <td>sevindra@gmail.com</td>
                                <td>44, Vimukthi Mawatha, Pelawatta.</td>
                                <td><button class="btn btn-success btn-block">Activate</button></td>
                                <td><button class="btn btn-danger btn-block">Delete</button></td>
                            </tr>
                            <tr>
                                <td>bhnj</td>
                                <td>njnj</td>
                                <td>njnj</td>
                                <td>njnj</td>
                                <td>njnj</td>
                                <td><button class="btn btn-success btn-block">Activate</button></td>
                                <td><button class="btn btn-danger btn-block">Delete</button></td>
                            </tr>
                            <tr>
                                <td>bhnj</td>
                                <td>njnj</td>
                                <td>njnj</td>
                                <td>njnj</td>
                                <td>njnj</td>
                                <td><button class="btn btn-success btn-block">Activate</button></td>
                                <td><button class="btn btn-danger btn-block">Delete</button></td>
                            </tr>
                            <tr>
                                <td>bhnj</td>
                                <td>njnj</td>
                                <td>njnj</td>
                                <td>njnj</td>
                                <td>njnj</td>
                                <td><button class="btn btn-success btn-block">Activate</button></td>
                                <td><button class="btn btn-danger btn-block">Delete</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
