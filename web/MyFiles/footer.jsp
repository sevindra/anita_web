<!--footer-->
    <div class="mainfooter">
        <div class="container">
            <div class="footer-top">
                <div class="col-md-6 footer-left">
                    <p>Developed By <a href="#">Charith Lankathilake</a></p>
                </div>
                <div class="col-md-6 footer-right">
                    <a href="/content/index.jsp"><img src="/images/lg.png" alt="" /></a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */

                $().UItoTop({easingType: 'easeOutQuart'});

            });
        </script>
        <a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
    </div>
    <!--footer-->