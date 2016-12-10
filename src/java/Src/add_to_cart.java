/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Cart;
import POJOS.CartItem;
import POJOS.Item;
import POJOS.Stock;
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
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
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
            String sizeid = request.getParameter("sizeid");
            String colorid = request.getParameter("colorid");
            String qtys = request.getParameter("qty");
            System.out.println(sizeid + "-" + colorid + "-" + qtys);

//            if (request.getSession().getAttribute("user_obj") != null) {
//                System.out.println("1");
//                Session s = objsave.getses();
//                Criteria cc = s.createCriteria(Cart.class);
//                cc.add(Restrictions.eq("user", ((User) s.load(User.class, ((User) request.getSession().getAttribute("user_obj")).getIduser()))));
//
//                Cart c;
//                Item p;
//                Stock stock;
//                CartItem chp;
//                if (cc.uniqueResult() != null) {
//                    System.out.println("2");
//                    Criteria ch = s.createCriteria(CartItem.class);
//                    c = (Cart) cc.uniqueResult();
//
//                    stock = (Stock) objsave.getses().load(Stock.class, Integer.parseInt(request.getParameter("stockid")));
//                    p = (Item) s.load(Item.class, stock.getItem().getIditem());
//                    ch.add(Restrictions.and(Restrictions.eq("item", p), Restrictions.eq("cart", c)));
//
//                    if (ch.uniqueResult() != null) {
//                        System.out.println("3");
//                        System.out.println("sdsdsdsdsdsdsd");
//                        chp = (CartItem) ch.uniqueResult();
//
//                        chp.setQty(chp.getQty() + Integer.parseInt(request.getParameter("qty")));
//                        chp.setTotal(chp.getTotal() + (stock.getPrice() * Double.parseDouble(request.getParameter("qty"))));
//                        s.update(chp);
//                        c.setTotal(c.getTotal() + (stock.getPrice() * Double.parseDouble(request.getParameter("qty"))));
//                        s.update(c);
//                        s.beginTransaction().commit();
//
//                    } else {
//                        System.out.println("4");
//                        chp = new CartItem();
//                        c = (Cart) cc.uniqueResult();
//                        chp.setCart(c);
//                        chp.setItem(p);
//                        chp.setQty(Integer.parseInt(request.getParameter("qty")));
//                        chp.setTotal(stock.getPrice() * Double.parseDouble(request.getParameter("qty")));
//                        c.setTotal(c.getTotal() + (stock.getPrice() * Double.parseDouble(request.getParameter("qty"))));
//                        s.update(c);
//                        s.save(chp);
//                        s.beginTransaction().commit();
//                    }
//
//                } else {
//                    stock = (Stock) s.load(Stock.class, Integer.parseInt(request.getParameter("stockid").toString()));
//                    p = (Item) s.load(Item.class, stock.getItem().getIditem());
//                    c = new Cart();
//                    User u = ((User) s.load(User.class, Integer.parseInt(request.getSession().getAttribute("user_obj").toString())));
//                    c.setUser(u);
//                    c.setDate(new Date());
//                    c.setTime(new Date());
//                    c.setTotal(stock.getPrice() * Double.parseDouble(request.getParameter("qty")));
//                    s.save(c);
//                    System.out.println("5");
//                    chp = new CartItem();
//                    chp.setCart(c);
//                    chp.setItem(p);
//                    chp.setColor(stock.getColor());
//                    chp.setSize(stock.getSize());
//                    chp.setStock(stock);
//                    chp.setQty(Integer.parseInt(request.getParameter("qty")));
//                    chp.setTotal(stock.getPrice() * Double.parseDouble(request.getParameter("qty")));
//                    s.save(chp);
//                    s.beginTransaction().commit();
//
//                }
//
//            } else {
//                HashMap<String, String> sessionCart;
//                if (request.getSession().getAttribute("sessionCart") != null) {
//                    System.out.println("ssd-session load");
//                    sessionCart = (HashMap<String, String>) request.getSession().getAttribute("sessionCart");
//
//                    sessionCart.put(request.getParameter("stockid"), request.getParameter("qty"));
//                    request.getSession().setAttribute("sessionCart", sessionCart);
//                } else {
//                    System.out.println("ssd-ession bild");
//                    System.out.println(request.getParameter("stockid") + "<- stockid ssd-ession bild" + request.getParameter("size"));
//                    sessionCart = new HashMap<>();
//
////                    sessionCart.put(request.getParameter("pid"), request.getParameter("qty")+"-"+request.getParameter("size")+"-"+request.getParameter("price")+"-"+request.getParameter("color"));
//                    sessionCart.put(request.getParameter("stockid"), request.getParameter("qty"));
//                    request.getSession().setAttribute("sessionCart", sessionCart);
//                }
//out.write("in");
//                ArrayList<model.session_cart> cart = (ArrayList<model.session_cart>) request.getSession().getAttribute("sescart");
//                if (cart == null) {
//                    cart = model.cart.getcart();
//
//                    model.session_cart c = new model.session_cart();
//                    c.setPid(Integer.parseInt(request.getParameter("pid")));
//                    c.setColor(request.getParameter("color"));
//                    c.setPrice(request.getParameter("price"));
//                    c.setQty(Integer.parseInt(request.getParameter("qty")));
//                    c.setSize(request.getParameter("size"));
//
//                    cart.add(c);
//                    HttpSession hs = request.getSession();
//                    hs.setAttribute("sescart", cart);
//                } else {
//                    model.session_cart c = new model.session_cart();
//                    c.setPid(Integer.parseInt(request.getParameter("pid")));
//                    c.setColor(request.getParameter("color"));
//                    c.setPrice(request.getParameter("price"));
//                    c.setQty(Integer.parseInt(request.getParameter("qty")));
//                    c.setSize(request.getParameter("size"));
//
//                    cart.add(c);
//                    HttpSession hs = request.getSession();
//                    hs.setAttribute("sescart", cart);
//                }
//            }
//
//            //response.sendRedirect("cart.jsp");
            //.......................................................................................................................................
            HashMap<String, String> sessionCart;

            if ((request.getSession().getAttribute("user_obj")) != null) {

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
                        Stock st = (Stock) objsave.getses().load(Stock.class, Integer.parseInt(prid.toString()));
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
                            chp.setColor(st.getColor());
                            chp.setSize(st.getSize());
                            chp.setStock(st);
                            chp.setQty(Integer.parseInt(qty));
                            chp.setPrice(st.getPrice());
                            chp.setTotal((st.getPrice() * Integer.parseInt(qty)));
                            c.setTotal(c.getTotal() + (st.getPrice() * Double.parseDouble(qty)));
                            objsave.getses().update(c);
                            objsave.getses().save(chp);
//                            objsave.beginTransaction().commit();

                        }
//
                    } else {
                        Stock st = (Stock) objsave.getses().load(Stock.class, Integer.parseInt(prid));
                        p = (Item) objsave.getses().load(Item.class, Integer.parseInt(st.getItem().getIditem().toString()));
                        c = new Cart();
                        User u = ((User) objsave.getses().load(User.class, Integer.parseInt(request.getSession().getAttribute("sessionCart").toString())));
                        c.setUser(u);
                        c.setDate(new Date());
                        c.setTotal(st.getPrice() * Double.parseDouble(qty));
                        objsave.getses().save(c);

                        chp = new CartItem();
                        chp.setCart(c);
                        chp.setItem(p);
                        chp.setColor(st.getColor());
                        chp.setSize(st.getSize());
                        chp.setStock(st);
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
                                Stock st = (Stock) objsave.getses().load(Stock.class, Integer.parseInt(prid));
                                System.out.print("CHP IN");
                                chp = (CartItem) ch.uniqueResult();

                                chp.setQty(chp.getQty() + Integer.parseInt(qty));
                                chp.setTotal(chp.getTotal() + (st.getPrice() * Integer.parseInt(qty)));
                                objsave.getses().update(chp);
                                c.setTotal(c.getTotal() + (st.getPrice() * Integer.parseInt(qty)));
                                objsave.update(c);
                                //ses.beginTransaction().commit();

                            } else {
                                Stock st = (Stock) objsave.getses().load(Stock.class, Integer.parseInt(prid));

                                chp = new CartItem();
                                c = (Cart) cc.uniqueResult();
                                chp.setCart(c);
                                chp.setItem(p);
                                chp.setColor(st.getColor());
                                chp.setSize(st.getSize());
                                chp.setStock(st);
                                chp.setQty(Integer.parseInt(qty));
                                chp.setPrice(st.getPrice());
                                chp.setTotal(st.getPrice() * Integer.parseInt(qty));
                                c.setTotal(c.getTotal() + (st.getPrice() * Integer.parseInt(qty)));
                                objsave.update(c);
                                objsave.save(chp);
                                //ses.beginTransaction().commit();

                            }

                        } else {
                            Stock st = (Stock) objsave.getses().load(Stock.class, Integer.parseInt(prid));

                            p = (Item) objsave.getses().load(Item.class, Integer.parseInt(st.getItem().getIditem().toString()));
                            c = new Cart();
                            User u = (User) (objsave.getses().load(User.class, ((User) request.getSession().getAttribute("user_obj")).getIduser()));
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
                response.sendRedirect("cart.jsp");
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

            // response.sendRedirect("cart.jsp");
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
