<%-- 
    Document   : Item_details
    Created on : May 27, 2016, 9:19:03 AM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="inc.jsp" %>
        <script>
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

                $('#myCarousel').carousel({
                    interval: 5000
                });

                //Handles the carousel thumbnails
                $('[id^=carousel-selector-]').click(function () {
                    var id_selector = $(this).attr("id");
                    try {
                        var id = /-(\d+)$/.exec(id_selector)[1];
                        console.log(id_selector, id);
                        jQuery('#myCarousel').carousel(parseInt(id));
                    } catch (e) {
                        console.log('Regex failed!', e);
                    }
                });
                // When the carousel slides, auto update the text
                $('#myCarousel').on('slid.bs.carousel', function (e) {
                    var id = $('.item.active').data('slide-number');
                    $('#carousel-text').html($('#slide-content-' + id).html());
                });

            });
        </script>
        <title>Item Name</title>
    </head>
    <body>
        <%@include file="site/header.jsp" %>
        <div >

        </div>
    </body>
</html>
