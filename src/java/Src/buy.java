/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Cart;
import POJOS.CartItem;
import POJOS.Color;
import POJOS.Item;
import POJOS.Size;
import POJOS.Stock;
import POJOS.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
@WebServlet(name = "buy", urlPatterns = {"/buy"})
public class buy extends HttpServlet {

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
            String getprice = request.getParameter("getprice");
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            String pid = request.getParameter("pid");
            String qty = request.getParameter("qty");
            String checkqty = request.getParameter("checkqty");
            //out.println(color+" "+size+" "+qty);
            User u = (User) request.getSession().getAttribute("user_obj");

            Color col = (Color) objsave.getses().load(Color.class, Integer.parseInt(color));
            Size si = (Size) objsave.getses().load(Size.class, Integer.parseInt(size));
            Item i = (Item) objsave.getses().load(Item.class, Integer.parseInt(pid));
            if (getprice != null) {
                if (getprice.equals("ok")) {
                    Criteria c = objsave.getses().createCriteria(Stock.class);
                    c.add(Restrictions.eq("item", i));
                    c.add(Restrictions.eq("size", si));
                    c.add(Restrictions.eq("color", col));
                    Stock s = (Stock) c.uniqueResult();

                    Cart cart = (Cart) objsave.getses().createCriteria(Cart.class).add(Restrictions.eq("user", u)).uniqueResult();
                    Cart ca = new Cart();
                    if (cart == null) {
                        ca.setUser(u);
                        ca.setTotal((s.getPrice() * Integer.parseInt(qty)));
                        ca.setDate(new Date());
                        ca.setTime(new Date());
                        objsave.save(ca);
            //objsave.ses.flush();

                    } else {
                        cart.setTime(new Date());
                        cart.setDate(new Date());
                        cart.setTotal(cart.getTotal() + s.getPrice() * Integer.parseInt(qty));
                        objsave.update(cart);
                        //objsave.ses.flush();
                    }

                    CartItem cai = new CartItem();
                    cai.setCart(ca);
                    cai.setItem(i);
                    cai.setSize(si);
                    cai.setColor(col);
                    cai.setStock(s);
                    cai.setTotal((s.getPrice() * Integer.parseInt(qty)));
                    cai.setQty(Integer.parseInt(qty));
                    cai.setPrice(s.getPrice());
                    objsave.save(cai);
            //objsave.ses.flush();
                    //out.write("ok");
                    response.sendRedirect("checkout.jsp");
                }
            }
            if (checkqty!=null) {
                if (checkqty.equals("ok")) {
                    Stock st =(Stock) objsave.getses().createCriteria(Stock.class).add(Restrictions.and(Restrictions.eq("item", i),Restrictions.eq("color", col),Restrictions.eq("size", si))).uniqueResult();
                int eqty=Integer.parseInt(qty);
                    if (eqty>st.getAvalQty()) {
                        out.write("<h5 style=\"color: #ff0000\"><strong>Out of Stock</strong></h5>");
                    } else {
                        out.write("<h5 style=\"color: #00cc33\"><strong>In a Stock</strong></h5>");
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
