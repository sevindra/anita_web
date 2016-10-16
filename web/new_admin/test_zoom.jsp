<%-- 
    Document   : test_zoom
    Created on : Oct 11, 2016, 10:35:55 PM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script>
      $(function (){
         $("#zoom_01").elevateZoom(); 
      });
    </script>
    
  </head>
  <body>
      <div>
          <img id="zoom_01" alt="Click to zoom" src="../adminPanel/product_imges/10.jpg" data-zoom-image="../adminPanel/product_imges/10.jpg"/>
    </div>
  </body>
</html>
