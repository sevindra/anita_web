<%-- 
    Document   : Category
    Created on : May 22, 2016, 10:46:11 PM
    Author     : Sevi
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="POJOS.Subcat"%>
<%@page import="java.util.List"%>
<%@page import="POJOS.Cat"%>
<%@page import="Src.objsave"%>
<%@page import="org.hibernate.Criteria"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="col-md-3">
            <div class="my-div-center my-text-center">
                <label class="category-size">Categories</label>
            </div>
            <%
                int qwe = 0;
                int rt = 0;
                List<Cat> ca = objsave.getses().createCriteria(Cat.class).list();
                for (Cat cat : ca) {
                    rt++;
            %>
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="<%="#collapse"+rt%>"><span class="glyphicon glyphicon-plus">
                                </span><%=cat.getCatname()%></a>
                        </h4>
                    </div>
                    <div id="<%="collapse"+rt%>" class="panel-collapse collapse <%if(qwe==0){%>in<%}%>">
                        <div class="panel-body side-panel">
                            <table class="table">
                                <%
                                List<Subcat> sc=objsave.getses().createCriteria(Subcat.class).add(Restrictions.eq("cat", cat)).list();
                                for(Subcat ssub:sc){
                                %>
                                <tr>
                                    <td>
                                        <a href="item.jsp?catname=<%=cat.getCatname()%>&subcatname=<%=ssub.getSubname()%>"><%=ssub.getSubname()%></a>
                                    </td>
                                </tr>
                                <%
                                }%>
                            </table>
                        </div>
                    </div>
                </div>


            </div>
            <%
                    qwe++;
                }%>
        </div>
    </body>
</html>

