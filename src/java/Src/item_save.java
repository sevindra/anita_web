/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Grn;
import POJOS.GrnReg;
import POJOS.Item;
import POJOS.Stock;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "item_save", urlPatterns = {"/item_save"})
public class item_save extends HttpServlet {

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

        try {
            /* TODO output your page here. You may use following sample code. */
            POJOS.Grn idgrn = null;

            String pid = request.getParameter("pid");
            String cost = request.getParameter("cost");
            String rprice = request.getParameter("rprice");
            String qty = request.getParameter("qty");
            String dis = request.getParameter("dis");
            String grnid = request.getParameter("grnid");
            String total = request.getParameter("total");

            String sup = request.getParameter("sup");
            String date = DB.DB.getDate();
            String time = DB.DB.gettime();
            String pmode = request.getParameter("payment");
            String totalam = request.getParameter("totalam");
            String cash = request.getParameter("cash");
            String bal = request.getParameter("bal");
            String save = request.getParameter("btn");

            HttpSession hs = request.getSession();

            Session ses = controler.connector.getSessionFactory().openSession();
//            Transaction tr = ses.beginTransaction();

            Criteria cdd = ses.createCriteria(POJOS.Grn.class);
            int gid = Integer.parseInt(grnid);
            cdd.add(Restrictions.eq("grnid", gid));
            POJOS.Grn kol = (POJOS.Grn) cdd.uniqueResult();

            System.out.println("Kooooooioo");
            //POJOS.Grn co = new POJOS.Grn();
            System.out.println(pid);
            idgrn = (POJOS.Grn) ses.load(POJOS.Grn.class, Integer.parseInt(grnid));
            POJOS.Grn grn = new Grn();
//
            POJOS.GrnReg grnreg = new GrnReg();

//            POJOS.Item item =(Item) ses.load(POJOS.Item.class, Integer.parseInt(pid));
            Criteria citem = ses.createCriteria(POJOS.Item.class);
            int ppid = Integer.parseInt(pid);
            citem.add(Restrictions.eq("iditem", ppid));
            POJOS.Item item = (POJOS.Item) citem.uniqueResult();

            POJOS.Stock stock = new Stock();
            //stock = (Stock) ses.load(POJOS.Stock.class, Integer.parseInt(pid));
            if (kol == null) {
//                System.out.println(sup);
//                POJOS.Supplier suplier = (POJOS.Supplier) ses.load(POJOS.Supplier.class, Integer.parseInt(sup));
//                POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");
//                grn.setGrnid(Integer.parseInt(grnid));
//                grn.setSupplier(suplier);
//                grn.setDate(date);
//                grn.setTime(time);
//                grn.setPmode(pmode);
//                grn.setUser(user);
//                ses.close();
//                objsave.save(grn);
//
//                stock.setItem(item);
//                stock.setPrice(Double.parseDouble(rprice));
//                stock.setQty(Integer.parseInt(qty));
//                stock.setStatus(1);
//
//                objsave.save(stock);
//                ses=controler.connector.getSessionFactory().openSession();
//                //stock = (Stock) ses.load(POJOS.Stock.class, Integer.parseInt(pid));
                grn = (Grn) ses.load(POJOS.Grn.class, Integer.parseInt(grnid));
//                grnreg.setCost(Double.parseDouble(cost));
//                grnreg.setDiscount(Integer.parseInt(dis));
//                grnreg.setGrn(grn);
//                grnreg.setItem(item);
//                grnreg.setQty(Integer.parseInt(qty));
//                grnreg.setStock(stock);
//                grnreg.setTotal(Double.parseDouble(total));
//
//                objsave.save(grnreg);
                GrnReg GrnReg = new GrnReg();
                GrnReg.setCost(Double.parseDouble(cost));
                GrnReg.setDiscount(Integer.parseInt(dis));
                GrnReg.setGrn(grn);
                GrnReg.setItem(item);
                GrnReg.setQty(Integer.parseInt(qty));
                GrnReg.setStock(stock);
                GrnReg.setTotal(Double.parseDouble(total));
                
                hs.setAttribute("grnreg", GrnReg);
                
            } else if (idgrn.getGrnid() == Integer.parseInt(grnid)) {

//                stock.setItem(item);
//                stock.setPrice(Double.parseDouble(rprice));
//                stock.setQty(Integer.parseInt(qty));
//                stock.setStatus(1);
//
//                objsave.save(stock);
//                ses=controler.connector.getSessionFactory().openSession();
//                //stock = (Stock) ses.load(POJOS.Stock.class, Integer.parseInt(pid));
//                grn = (Grn) ses.load(POJOS.Grn.class, Integer.parseInt(grnid));
//                grnreg.setCost(Double.parseDouble(cost));
//                grnreg.setDiscount(Integer.parseInt(dis));
//                grnreg.setGrn(grn);
//                grnreg.setItem(item);
//                grnreg.setQty(Integer.parseInt(qty));
//                grnreg.setStock(stock);
//                grnreg.setTotal(Double.parseDouble(total));
//
//                objsave.save(grnreg);
            } else {
                System.out.println("Koooooo45");
            }
//            POJOS.Grn idgrn = (POJOS.Grn) ses.load(POJOS.Grn.class, Integer.parseInt(grnid));
            //POJOS.Grn idgrn = null;
            //Criteria cdee = ses.createCriteria(POJOS.Grn.class);
            //cdee.add(Restrictions.eq("grnid", Integer.parseInt(grnid)));
            //POJOS.Grn ui = (POJOS.Grn) cdee.uniqueResult();
//            POJOS.Grn grn = new Grn();
//
//            POJOS.GrnReg grnreg = new GrnReg();
//
//            POJOS.Item item = new Item();
//            item = (Item) ses.load(POJOS.Item.class, Integer.parseInt(pid));
//
//            POJOS.Stock stock = new Stock();
//            stock = (Stock) ses.load(POJOS.Stock.class, Integer.parseInt(pid));
            //Criteria cde = ses.createCriteria(POJOS.Grn.class);
            // if (ui.getGrnid() == Integer.parseInt(grnid)) {

            //} else {
//                POJOS.Supplier suplier = (POJOS.Supplier) ses.load(POJOS.Supplier.class, Integer.parseInt(sup));
//                POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");
//                grn.setSupplier(suplier);
//                grn.setDate(date);
//                grn.setTime(time);
//                grn.setPmode(pmode);
//                grn.setUser(user);
//
//                ses.save(grn);
//
//                grn = (Grn) ses.load(POJOS.Grn.class, Integer.parseInt(grnid));
//                grnreg.setCost(Double.parseDouble(cost));
//                grnreg.setDiscount(Integer.parseInt(dis));
//                grnreg.setGrn(grn);
//                grnreg.setItem(item);
//                grnreg.setQty(Integer.parseInt(qty));
//                grnreg.setStock(stock);
//                grnreg.setTotal(Double.parseDouble(total));
//
//                ses.save(grnreg);
//
//                stock.setItem(item);
//                stock.setPrice(Double.parseDouble(rprice));
//                stock.setQty(Integer.parseInt(qty));
//                stock.setStatus(1);
//
//                ses.save(stock);
            //}
            //System.out.println(idgrn.getGrnid());
            //if (idgrn.equals("null")) {
//                POJOS.Supplier suplier = (POJOS.Supplier) ses.load(POJOS.Supplier.class, Integer.parseInt(sup));
//                POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");
//                grn.setSupplier(suplier);
//                grn.setDate(date);
//                grn.setTime(time);
//                grn.setPmode(pmode);
//                grn.setUser(user);
//
//                ses.save(grn);
//                
//                grn = (Grn) ses.load(POJOS.Grn.class, Integer.parseInt(grnid));
//                grnreg.setCost(Double.parseDouble(cost));
//                grnreg.setDiscount(Integer.parseInt(dis));
//                grnreg.setGrn(grn);
//                grnreg.setItem(item);
//                grnreg.setQty(Integer.parseInt(qty));
//                grnreg.setStock(stock);
//                grnreg.setTotal(Double.parseDouble(total));
//                
//                ses.save(grnreg);
//                
//                stock.setItem(item);
//                stock.setPrice(Double.parseDouble(rprice));
//                stock.setQty(Integer.parseInt(qty));
//                stock.setStatus(1);
//                
//                ses.save(stock);
            //tr.commit();
            //} else {
//                grn = (Grn) ses.load(POJOS.Grn.class, Integer.parseInt(grnid));
//                grnreg.setCost(Double.parseDouble(cost));
//                grnreg.setDiscount(Integer.parseInt(dis));
//                grnreg.setGrn(grn);
//                grnreg.setItem(item);
//                grnreg.setQty(Integer.parseInt(qty));
//                grnreg.setStock(stock);
//                grnreg.setTotal(Double.parseDouble(total));
//                
//                ses.save(grnreg);
//                
//                stock.setItem(item);
//                stock.setPrice(Double.parseDouble(rprice));
//                stock.setQty(Integer.parseInt(qty));
//                stock.setStatus(1);
//                
//                ses.save(stock);
//                tr.commit();
            // }
//            
//
//            POJOS.Item item = new Item();
//            item = (Item) ses.load(POJOS.Item.class, Integer.parseInt(pid));
//
//            POJOS.Stock stock = new Stock();
//            stock = (Stock) ses.load(POJOS.Stock.class, Integer.parseInt(grnid));
//
//            grnreg.setCost(Double.parseDouble(cost));
//            grnreg.setDiscount(Integer.parseInt(dis));
//            grnreg.setGrn(ggrn);
//            grnreg.setItem(item);
//            grnreg.setQty(Integer.parseInt(qty));
//            grnreg.setStock(stock);
//            grnreg.setTotal(Double.parseDouble(total));
//            if(request.getSession().getAttribute("grn_reg")==null){
//                Vector<GrnReg> t = new Vector<>();
//                t.add(grnreg);
//                request.getSession().setAttribute("grn_reg",t);
//            }else{
//                Vector<GrnReg> t = (Vector<GrnReg>) request.getSession().getAttribute("grn_reg");
//                t.add(grnreg);
//                request.getSession().setAttribute("grn_reg",t);
//            }
//            ses.save(grnreg);
//            tr.commit();
        } catch (Exception e) {
            System.out.println(e);

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
