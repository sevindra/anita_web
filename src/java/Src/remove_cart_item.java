/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Cart;
import POJOS.CartItem;
import POJOS.ItemImage;
import POJOS.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "remove_cart_item", urlPatterns = {"/remove_cart_item"})
public class remove_cart_item extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            String id = request.getParameter("id");
            String cart = request.getParameter("cart");
            if (cart != null) {
                if (cart.equals("ok")) {
                    CartItem ci = (CartItem) objsave.getses().load(CartItem.class, Integer.parseInt(id));
                    objsave.delete(ci);
                    Cart edcar = (Cart) objsave.getses().load(Cart.class, ci.getCart().getIdcart());
                    edcar.setTotal(edcar.getTotal() - ci.getTotal());
                    objsave.update(edcar);

                    Criteria cs = objsave.getses().createCriteria(Cart.class);
                    User us = (User) request.getSession().getAttribute("user_obj");
                    cs.add(Restrictions.eq("user", us));
                    Cart cc = (Cart) cs.uniqueResult();

                    User ser = (User) request.getSession().getAttribute("user_obj");
                    cs.add(Restrictions.eq("user", ((User) objsave.getses().load(User.class, ((User) request.getSession().getAttribute("user_obj")).getIduser()))));
                    if (cs.uniqueResult() != null) {
                        List<CartItem> cl = objsave.getses().createCriteria(CartItem.class).add(Restrictions.eq("cart", cc)).list();
                        for (CartItem ch : cl) {
                            out.write("<div class=\"col-md-12\">\n"
                                    + "                        <div class=\"panel panel-default\">\n"
                                    + "                            <div class=\"panel-body\">\n"
                                    + "                                <div class=\"thumbnail col-md-2\" style=\"padding: 5px\">");
                            Criteria c12 = objsave.getses().createCriteria(ItemImage.class);
                            //Stock is = (Stock) objsave.getses().load(Stock.class, s.getIdstock());
                            c12.add(Restrictions.eq("item", ch.getItem()));
                            //c1.setFirstResult(1);
                            c12.setMaxResults(1);
                            List<ItemImage> itemimage2 = c12.list();

                            for (ItemImage i : itemimage2) {
                                out.write("<a href=\"");
                                out.write("Item_details.jsp?itemid=" + ch.getItem().getIditem());
                                out.write("\"><img src=\"");
                                i.getUrl();
                                out.write("\"/></a>");
                            }
                            out.write("</div>\n"
                                    + "\n"
                                    + "                                <div class=\"col-md-6\">\n"
                                    + "                                    <div class=\"col-md-12\">\n"
                                    + "                                        <div class=\"row\">\n"
                                    + "                                            <h4><a href=\"");
                            out.write("Item_details.jsp?itemid=" + ch.getItem().getIditem());
                            out.write("\">");
                            ch.getItem().getItemname();
                            out.write("</a></h4>"
                                    + "</div>\n"
                                    + "                                        <div class=\"row\">\n"
                                    + "\n"
                                    + "                                            <h4><strong>Color :");
                            ch.getColor().getColor();
                            out.write("</strong></h4>\n"
                                    + "                                            <h4><strong>Size :");
                            ch.getSize().getSize();
                            out.write("</strong></h4>");
                            if (ch.getQty() > 1) {
                                out.write("<h5 class=\"\">Item Price: LKR. ");
                                ch.getPrice();
                                out.write("</h5>");
                            }
                            out.write("</div>\n"
                                    + "\n"
                                    + "\n"
                                    + "                                    </div>\n"
                                    + "\n"
                                    + "                                </div>\n"
                                    + "                                <div class=\"col-md-2\">\n"
                                    + "                                    <div class=\"row\">\n"
                                    + "                                        <div class=\"col-md-5\">\n"
                                    + "                                            <h5>Quantity:</h5> \n"
                                    + "                                        </div>\n"
                                    + "                                        <div class=\"col-md-7\">\n"
                                    + "<input type=\"text\" class=\"text-center form-control\" value=\"");
                            ch.getQty();
                            out.write("\"/>\n"
                                    + "</div>\n"
                                    + "</div>\n"
                                    + "</div>\n"
                                    + "<div class=\"col-md-2\">\n"
                                    + "<div class=\"pull-right\">\n"
                                    + "\n"
                                    + "<h4 class=\"pull-right\"><strong>LKR. ");
                            ch.getTotal();
                            out.write("</strong></h4>\n"
                                    + "</div>\n"
                                    + "<br/>\n"
                                    + "<br/>\n"
                                    + "<h6 class=\"pull-right\">Shipping Available</h6>\n"
                                    + "<div class=\"row\">\n"
                                    + "<button class=\"btn btn-danger btn-block\" onclick=\"rem_cart_item('");
                            ch.getIdcartItem();
                            out.write("')\">Remove</button>\n"
                                    + "</div>\n"
                                    + "</div>\n"
                                    + "</div>\n"
                                    + "</div>\n"
                                    + "</div>");
                        }
                    } else {
                        out.write("<div class=\"col-md-10 col-md-offset-1\">\n"
                                + "\n"
                                + "<h2><strong>Your shopping cart is empty</strong></h2>\n"
                                + "\n"
                                + "</div>");
                        out.write("</div>");
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
