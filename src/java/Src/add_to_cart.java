/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Cart;
import POJOS.Item;
import POJOS.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "add_to_cart", urlPatterns = {"/add_to_cart"})
public class add_to_cart extends HttpServlet {

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
            if (request.getSession().getAttribute("ID") != null) {

                Session s = objsave.getses();
                Criteria cc = s.createCriteria(Cart.class);
                cc.add(Restrictions.eq("user", ((User) s.load(User.class, Integer.parseInt(request.getSession().getAttribute("ID").toString())))));

                Cart c;
                Item p;
                CartHasProducts chp;
                if (cc.uniqueResult() != null) {
                    Criteria ch = s.createCriteria(CartHasProducts.class);
                    c = (Cart) cc.uniqueResult();

                    p = (Products) s.load(Products.class, Integer.parseInt(request.getParameter("pid")));
                    ch.add(Restrictions.and(Restrictions.eq("products", p), Restrictions.eq("cart", c)));

                    if (ch.uniqueResult() != null) {
                        System.out.println("sdsdsdsdsdsdsd");
                        chp = (CartHasProducts) ch.uniqueResult();

                        chp.setQty(chp.getQty() + Double.parseDouble(request.getParameter("qty")));
                        chp.setTotal(chp.getTotal() + (p.getPrice() * Double.parseDouble(request.getParameter("qty"))));
                        s.update(chp);
                        c.setTotal(c.getTotal() + (p.getPrice() * Double.parseDouble(request.getParameter("qty"))));
                        s.update(c);
                        s.beginTransaction().commit();

                    } else {
                        chp = new CartHasProducts();
                        c = (Cart) cc.uniqueResult();
                        chp.setCart(c);
                        chp.setProducts(p);
                        chp.setQty(Double.parseDouble(request.getParameter("qty")));
                        chp.setTotal(p.getPrice() * Double.parseDouble(request.getParameter("qty")));
                        c.setTotal(c.getTotal() + (p.getPrice() * Double.parseDouble(request.getParameter("qty"))));
                        s.update(c);
                        s.save(chp);
                        s.beginTransaction().commit();
                    }

                } else {
                    p = (Products) s.load(Products.class, Integer.parseInt(request.getParameter("pid")));
                    c = new Cart();
                    User u = ((User) s.load(User.class, Integer.parseInt(request.getSession().getAttribute("ID").toString())));
                    c.setUser(u);
                    c.setDateTime(new Date());
                    c.setTotal(p.getPrice() * Double.parseDouble(request.getParameter("qty")));
                    s.save(c);
                    chp = new CartHasProducts();
                    chp.setCart(c);
                    chp.setProducts(p);
                    chp.setQty(Double.parseDouble(request.getParameter("qty")));
                    chp.setTotal(p.getPrice() * Double.parseDouble(request.getParameter("qty")));
                    s.save(chp);
                    s.beginTransaction().commit();

                }

            } else {
                HashMap<String, String> sessionCart;
                if (request.getSession().getAttribute("sessionCart") != null) {
                    sessionCart = (HashMap<String, String>) request.getSession().getAttribute("sessionCart");

                    sessionCart.put(request.getParameter("pid"), request.getParameter("qty"));
                    request.getSession().setAttribute("sessionCart", sessionCart);
                } else {

                    sessionCart = new HashMap<>();

                    sessionCart.put(request.getParameter("pid"), request.getParameter("qty"));
                    request.getSession().setAttribute("sessionCart", sessionCart);
                }

            }

            response.sendRedirect("cart.jsp");
        }catch(Exception e){
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
