/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.CardDetails;
import POJOS.Cart;
import POJOS.CartItem;
import POJOS.Invoice;
import POJOS.InvoiceItem;
import POJOS.State;
import POJOS.Stock;
import POJOS.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
@WebServlet(name = "order", urlPatterns = {"/order"})
public class order extends HttpServlet {

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
            String cardno = request.getParameter("cardno");
            String exp = request.getParameter("exp");
            String sec = request.getParameter("sec");
            String cardfname = request.getParameter("cardfname");
            String cardlname = request.getParameter("cardlname");
            String pay = request.getParameter("pay");
            String baddress = request.getParameter("baddress");
            String baddress2 = request.getParameter("baddress2");
            String baddress3 = request.getParameter("baddress3");
            String daddress = request.getParameter("daddress");
            String daddress2 = request.getParameter("daddress2");
            String daddress3 = request.getParameter("daddress3");
            out.write(baddress + baddress2 + baddress3 + daddress + daddress2 + daddress3);
            out.write("ok");
            User u = (User) request.getSession().getAttribute("user_obj");
            Criteria cd = objsave.getses().createCriteria(CardDetails.class);
            cd.add(Restrictions.eq("user", u));
            CardDetails cad = (CardDetails) cd.uniqueResult();

            String ar1[] = baddress2.split(",");
            String ar2[] = daddress2.split(",");
            Invoice in = new Invoice();
            if (cad == null) {
                CardDetails c = new CardDetails();
                c.setCardNo(cardno);
                c.setExp(exp);
                c.setFname(cardfname);
                c.setLname(cardlname);
                c.setSec(sec);
                c.setUser(u);
                objsave.save(c);
                in.setCardDetails(c);
            } else {
                cad.setCardNo(cardno);
                cad.setExp(exp);
                cad.setFname(cardfname);
                cad.setLname(cardlname);
                cad.setSec(sec);
                cad.setUser(u);
                objsave.update(cad);
                in.setCardDetails(cad);
            }

            Cart ca = (Cart) objsave.getses().createCriteria(Cart.class).add(Restrictions.eq("user", u)).uniqueResult();
            Criteria cai = objsave.getses().createCriteria(CartItem.class).add(Restrictions.eq("cart", ca));
            State st = (State) objsave.getses().createCriteria(State.class).add(Restrictions.eq("state", ar1[1])).uniqueResult();
            State st2 = (State) objsave.getses().createCriteria(State.class).add(Restrictions.eq("state", ar2[1])).uniqueResult();
            List<CartItem> l = cai.list();
            in.setUser(u);
            in.setInvoiceNo(ca.getIdcart().toString());
            in.setBillAddress(baddress);
            in.setBillCity(ar1[0]);
            in.setStateByStateIdstate(st);
            in.setBillZip(ar1[2]);
            in.setDate(new Date());
            in.setTime(new Date());
            in.setTotal(ca.getTotal());
            in.setDelAddress(daddress);
            in.setDelCitiy(ar2[0]);
            in.setStateByDelState(st2);
            in.setDelZip(ar2[2].toString());
            in.setStatus(1);
            in.setDelivery(0);
            in.setComp(0);
            objsave.save(in);

            for (CartItem l1 : l) {
                InvoiceItem ini = new InvoiceItem();
                ini.setInvoice(in);
                ini.setItem(l1.getItem());
                ini.setPrice(l1.getPrice());
                ini.setQty(l1.getQty());
                ini.setStock(l1.getStock());
                ini.setTotal(l1.getTotal());
                objsave.save(ini);

                objsave.delete(l1);
                Stock s = (Stock) objsave.getses().load(Stock.class, Integer.parseInt(l1.getStock().getIdstock().toString()));
                s.setAvalQty(s.getQty() - l1.getQty());
                objsave.update(s);
            }
            objsave.delete(ca);
            response.sendRedirect("invoice.jsp?inid=" + in.getIdinvoice());
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
