/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Item;
import POJOS.ItemImage;
import POJOS.User;
import POJOS.WatchList;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "add_to_watch_list", urlPatterns = {"/add_to_watch_list"})
public class add_to_watch_list extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String itemid = request.getParameter("itemid");
            String userid = request.getParameter("userid");
            String watch = request.getParameter("watch");
            String unwatch = request.getParameter("unwatch");
            //out.write(userid);
            Item item = (Item) objsave.getses().load(Item.class, Integer.parseInt(itemid));
                    HttpSession hs = request.getSession();
            User u = (User) hs.getAttribute("user_obj");
            if (watch != null) {
                if (watch.equals("ok")) {
                    WatchList wl = new WatchList();
                    wl.setUser(u);
                    wl.setItem(item);
                    objsave.save(wl);
//            out.write("watched");
                    out.write("<a href=\"#\" onclick=\"un_watch()\"><h6><span class=\"glyphicon glyphicon-eye-open\"></span>Watched<span class=\"glyphicon glyphicon-ok\" style=\"color: #00cc33; margin-left: 10px\"></span></h6></a>");
                    
                }
            }
            if (unwatch != null) {
                if (unwatch.equals("ok")) {
                    //out.write("okk");
                    User uid = (User) objsave.getses().load(User.class, Integer.parseInt(userid));
                    WatchList witem = (WatchList) objsave.getses().createCriteria(WatchList.class).add(Restrictions.and(Restrictions.eq("item", item), Restrictions.eq("user", uid))).uniqueResult();
                    //out.write(witem.getIdwatchList());
                    objsave.delete(witem);
                    out.write("<a href=\"#\" onclick=\"check_to_watch()\"><h6><span class=\"glyphicon glyphicon-eye-open\"></span>Add to watch list </h6></a>");
                }
            }
            if (unwatch != null) {
                if (unwatch.equals("list")) {
                    //out.write("okk");
                    User uid = (User) objsave.getses().load(User.class, Integer.parseInt(userid));
                    WatchList witem = (WatchList) objsave.getses().createCriteria(WatchList.class).add(Restrictions.and(Restrictions.eq("item", item), Restrictions.eq("user", uid))).uniqueResult();
                    //out.write(witem.getIdwatchList());
                    objsave.delete(witem);
                    List<WatchList> wat = objsave.getses().createCriteria(WatchList.class).add(Restrictions.eq("user", u)).list();
                    for (WatchList w : wat) {
                        out.write("<div class=\"col-md-12\">\n"
                                + "                        <div class=\"panel panel-default\">\n"
                                + "                            <div class=\"panel-body\">\n"
                                + "                                <div class=\"thumbnail col-md-3\" style=\"padding: 5px\">");
                        Session ses = objsave.getses();
                        Criteria c1 = ses.createCriteria(ItemImage.class);
                        c1.add(Restrictions.eq("item", w.getItem()));
                        //c1.setFirstResult(1);
                        c1.setMaxResults(1);
                        List<ItemImage> itemimage = c1.list();
                        for (ItemImage i : itemimage) {
                            out.write("<img src=\"" + i.getUrl()+"\"/>");
                           // System.out.println("<img src=\"" + i.getUrl()+"\"/>");
                        }
                        out.write("</div>\n"
                                + "<div class=\"col-md-9\">\n"
                                + "<div class=\"col-md-6\">\n"
                                + "<div class=\"row\">");
                        out.write("<h4><a>" + w.getItem().getItemname() + "</a></h4>");
                        out.write("</div>\n"
                                + "<div class=\"row\">\n"
                                + "<h4>Size : M</h4>\n"
                                + "</div>\n"
                                + "<div class=\"row\">\n"
                                + "<h4>Qty : 1</h4>\n"
                                + "</div>\n"
                                + "<div class=\"row\">\n"
                                + "<button class=\"btn btn-danger col-md-4\" onclick=\"un_watch_from_list('"+w.getItem().getIditem()+"')\">Remove</button>"
                                + "</div>\n"
                                + "\n"
                                + "</div>\n"
                                + "\n"
                                + "<div class=\"col-md-3\">\n"
                                + "<h4 class=\"pull-right\"><strong>LKR.1250.00</strong></h4>\n"
                                + "<br/>\n"
                                + "<h6 class=\"pull-right\">Shipping Available</h6>\n"
                                + "</div>\n"
                                + "<div class=\"col-md-3\">\n"
                                + "<button class=\"btn btn-primary btn-block\">Buy It Now</button> \n"
                                + "<button class=\"btn btn-success btn-block\">Add To Cart</button> \n"
                                + "\n"
                                + "</div>\n"
                                + "</div>\n"
                                + "</div>\n"
                                + "</div>\n"
                                + "</div>");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
