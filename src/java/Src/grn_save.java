/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Grn;
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
@WebServlet(name = "grn_save", urlPatterns = {"/grn_save"})
public class grn_save extends HttpServlet {

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
           String grnid=request.getParameter("grnid");
           String sup=request.getParameter("sup");
           String date=DB.DB.getDate();
           String time=DB.DB.gettime();
           String pmode=request.getParameter("payment");
           String total=request.getParameter("totalam");
           String cash=request.getParameter("cash");
           String bal=request.getParameter("bal");
           String save=request.getParameter("btn");
           
            HttpSession hs = request.getSession();
           
            Session s = controler.connector.getSessionFactory().openSession();
            Transaction tr =s.beginTransaction();
            
            Criteria cr = s.createCriteria(POJOS.Grn.class);
            cr.add(Restrictions.eq("grnid", grnid));
            POJOS.Grn grni = (POJOS.Grn) cr.uniqueResult();
            
            int dbgrnid=grni.getGrnid();
            
            if (save.equals("save")) {
                POJOS.Grn grn = new Grn();
                POJOS.Supplier suplier =(POJOS.Supplier) s.load(POJOS.Supplier.class, Integer.parseInt(sup));
                POJOS.User user = (POJOS.User) hs.getAttribute("user_obj");
                grn.setSupplier(suplier);
//                grn.setDate(date);
//                grn.setTime(time);
//                grn.setPmode(pmode);
//                grn.setUser(user);
                
                
                
            }
           
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
