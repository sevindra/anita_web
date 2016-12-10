/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import POJOS.Cart;
import POJOS.CartItem;
import POJOS.Item;
import POJOS.Stock;
import POJOS.User;
import Src.objsave;
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
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/NewServlet"})
public class mk extends HttpServlet {

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
            HashMap<String, String> sessionCart;

            if ((request.getSession().getAttribute("sessionCart")) != null) {

                
                Criteria cc = objsave.getses().createCriteria(Cart.class);

                cc.add(Restrictions.eq("user", ((User) objsave.getses().load(User.class, ((User) request.getSession().getAttribute("user_obj")).getIduser()))));
               
                Cart c;
                Item p;
                CartItem chp;
                String prid;
                String qty;

                if (request.getSession().getAttribute("sessionCart") == null) {

                    System.err.println("User in , Session Cart Null");
                    prid = request.getParameter("stockid");
                    qty = request.getParameter("qty");

                    if (cc.uniqueResult() != null) {

                        Criteria ch = objsave.getses().createCriteria(CartItem.class);
                        c = (Cart) cc.uniqueResult();
                        Stock st=(Stock) objsave.getses().load(Stock.class, prid);
                        p = (Item) objsave.getses().load(Item.class, Integer.parseInt(st.getItem().getIditem().toString()));
                        ch.add(Restrictions.and(Restrictions.eq("item", p), Restrictions.eq("cart", c)));

                        if (ch.uniqueResult() != null) {
                            System.out.println("cart not null,chp not null");
                            chp = (CartItem) ch.uniqueResult();

                            chp.setQty(chp.getQty() + Integer.parseInt(qty));
                            chp.setPrice(st.getPrice());
                            chp.setTotal(chp.getTotal() + (st.getPrice() * Integer.parseInt(qty)));
                            objsave.getses().update(chp);
                            c.setTotal(c.getTotal() + (st.getPrice() * Integer.parseInt(qty)));
                            objsave.getses().update(c);
                            //objsave.getses().beginTransaction().commit();

                        } else {

                            chp = new CartItem();
                            c = (Cart) cc.uniqueResult();
                            
                            chp.setCart(c);
                            chp.setItem(p);
                            chp.setQty(Integer.parseInt(qty));
                            chp.setPrice(st.getPrice());
                            chp.setTotal((st.getPrice() * Integer.parseInt(qty)));
                            c.setTotal(c.getTotal()+(st.getPrice()*Double.parseDouble(qty)));
                            objsave.getses().update(c);
                            objsave.getses().save(chp);
//                            objsave.beginTransaction().commit();

                        }
//
                    } else {
                        Stock st=(Stock) objsave.getses().load(Stock.class, prid);
                        p = (Item) objsave.getses().load(Item.class, Integer.parseInt(prid));
                        c = new Cart();
                        User u = ((User) objsave.getses().load(User.class, Integer.parseInt(request.getSession().getAttribute("sessionCart").toString())));
                        c.setUser(u);
                        c.setDate(new Date());
                        c.setTotal(st.getPrice() * Double.parseDouble(qty));
                        objsave.getses().save(c);

                        chp = new CartItem();
                        chp.setCart(c);
                        chp.setItem(p);
                        chp.setQty(Integer.parseInt(qty));
                        chp.setPrice(st.getPrice());
                        chp.setTotal(st.getPrice() * Double.parseDouble(qty));
                        objsave.save(chp);
                        //ses.beginTransaction().commit();

                    }

                } else {
                     System.err.println("User in , Session Cart Not Null");
                    sessionCart = (HashMap<String, String>) request.getSession().getAttribute("sessionCart");
                    for (String key : sessionCart.keySet()) {

                        prid = key;
                        qty = sessionCart.get(key);
                        if (cc.uniqueResult() != null) {
                            Criteria ch = objsave.getses().createCriteria(CartItem.class);
                            c = (Cart) cc.uniqueResult();

                            p = (Item) objsave.getses().load(Item.class, Integer.parseInt(prid));
                            ch.add(Restrictions.and(Restrictions.eq("item", p), Restrictions.eq("cart", c)));

                            if (ch.uniqueResult() != null) {
                                Stock st=(Stock) objsave.getses().load(Stock.class, prid);
                                System.out.print("CHP IN");
                                chp = (CartItem) ch.uniqueResult();

                                chp.setQty(chp.getQty() + Integer.parseInt(qty));
                                chp.setTotal(chp.getTotal() + (st.getPrice() * Integer.parseInt(qty)));
                                objsave.getses().update(chp);
                                c.setTotal(c.getTotal() + (st.getPrice() * Integer.parseInt(qty)));
                                objsave.update(c);
                                //ses.beginTransaction().commit();

                            } else {
                                Stock st=(Stock) objsave.getses().load(Stock.class, prid);

                                chp = new CartItem();
                                c = (Cart) cc.uniqueResult();
                                chp.setCart(c);
                                chp.setItem(p);
                                chp.setQty(Integer.parseInt(qty));
                                chp.setPrice(st.getPrice());
                                chp.setTotal(st.getPrice() * Integer.parseInt(qty));
                                c.setTotal(c.getTotal() + (st.getPrice() * Integer.parseInt(qty)));
                                objsave.update(c);
                                objsave.save(chp);
                                //ses.beginTransaction().commit();

                            }

                        } else {
                                Stock st=(Stock) objsave.getses().load(Stock.class, Integer.parseInt(prid));

                            p = (Item) objsave.getses().load(Item.class, Integer.parseInt(prid));
                            c = new Cart();
                            User u = (User) (objsave.getses().load(User.class, ((User)request.getSession().getAttribute("user_obj")).getIduser()));
                            c.setUser(u);
                            c.setDate(new Date());
                            c.setTime(new Date());
                            c.setTotal(st.getPrice() * Integer.parseInt(qty));
                            objsave.save(c);
                            chp = new CartItem();
                            chp.setCart(c);
                            chp.setItem(p);
                            chp.setColor(st.getColor());
                            chp.setSize(st.getSize());
                            chp.setStock(st);
                            chp.setQty(Integer.parseInt(qty));
                            chp.setPrice(st.getPrice());
                            chp.setTotal(st.getPrice() * Integer.parseInt(qty));
                            objsave.save(chp);
                            //ses.beginTransaction().commit();

                        }
                    }
                    request.getSession().removeAttribute("sessionCart");
                }

            } else if (request.getSession().getAttribute("sessionCart") != null) {
                sessionCart = (HashMap<String, String>) request.getSession().getAttribute("sessionCart");
                if (sessionCart.get(request.getParameter("stockid")) != null) {

                    sessionCart.put(request.getParameter("stockid"), (Integer.parseInt(request.getParameter("qty")) + Integer.parseInt(sessionCart.get(request.getParameter("stockid")))) + "");
                    request.getSession().setAttribute("sessionCart", sessionCart);

                } else {
                    sessionCart.put(request.getParameter("stockid"), request.getParameter("qty"));
                    request.getSession().setAttribute("sessionCart", sessionCart);

                }

            } else {
                sessionCart = new HashMap<>();

                sessionCart.put(request.getParameter("stockid"), request.getParameter("qty"));
                request.getSession().setAttribute("sessionCart", sessionCart);
        }
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
