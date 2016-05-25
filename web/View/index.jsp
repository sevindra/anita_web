<%-- 
    Document   : index
    Created on : Oct 30, 2015, 1:11:19 PM
    Author     : Sevi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../adminPanel/inc.jsp" %>
        <title>Anita Designer wear</title>
    </head>
    <body>



        <div class="navbar navbar-default navbar-static-top" style="height: 20px;">
            <div class="container">
                Hi!<a href="#">Sign In</a>
                Or<a href="#"> Register</a>
                <div style="padding-bottom: 10px;">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#drop" data-toggle="collapse">My Account</a></li>
                    </ul>

                </div>
                <button class="nav navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>

                </button>
                <!--                <div class="collapse navbar-collapse navHeaderCollapse">
                                    <ul class="nav navbar-nav navbar-right">
                                        <li><a href="#">My Account</a></li>
                                        <li><a href="#">Watch List</a></li>
                                        <li><a href="#">All List</a></li>
                                        <li><a href="#">Purchase History</a></li>
                                        <li><a href="#">Messages</a></li>
                                        <li><a href="#">Summery</a></li>
                                        
                                    </ul>
                                </div>-->

                


            </div>

        </div>
        <div id="drop" class="collapse in navbar-right " style="margin-right: 130px;" >
            <ul>
                <li><a>sdkms</a></li>
                <li><a>sdkms</a></li>
                <li><a>sdkms</a></li>
                <li><a>sdkms</a></li>
            </ul> 
        </div>



        <div>
            <a href="#collapseOne" data-toggle="collapse" data-parent="#accordion">sdf</a>
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                Collapsible Group Item #1
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                Collapsible Group Item #2
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
