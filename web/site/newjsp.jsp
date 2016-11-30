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
        <%@include file="../inc.jsp" %>
        <title>JSP Page</title>
        <script>


//Program a custom submit function for the form
            $("form#data").submit(function (event) {

                //disable the default form submission
                event.preventDefault();

                //grab all form data  
                var formData = new FormData($(this)[0]);

                $.ajax({
                    url: '../testup',
                    type: 'POST',
                    data: formData,
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (returndata) {
                        alert(returndata);
                    }
                });
                //alert("ok");
                return false;
            });
        </script>
    </head>
    <body>
        <form id="data">
            <input type="hidden" name="id" value="123" readonly="readonly">
            User Name: <input type="text" name="username" value=""><br />
            Profile Image: <input name="profileImg[]" type="file" /><br />
            Display Image: <input name="displayImg[]" type="file" /><br />
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
