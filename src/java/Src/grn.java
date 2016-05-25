/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "grn", urlPatterns = {"/grn"})
public class grn extends HttpServlet {

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
            String uid=request.getParameter("grnid");
            String supid=request.getParameter("sup");
            String ptype=request.getParameter("payment");
            String total=request.getParameter("totalam");
            String cash=request.getParameter("cash");
            String bal=request.getParameter("grnid");
            
//            Session ses=controler.connector.getSessionFactory().openSession();
//            Transaction tr=ses.beginTransaction();
//            POJOS.User user=new User();
//            user=(User) ses.load(POJOS.User.class, Integer.parseInt(uid));
//            Grn g = new Grn();
//            
//            
//            Vector<GrnReg> t = new Vector<>();
//            if(request.getSession().getAttribute("grn_reg")!=null){
//                t = (Vector<GrnReg>) request.getSession().getAttribute("grn_reg");
//            }
//            for (GrnReg t1 : t) {
//                t1.setGrn(g);
//                //se.save(t1);
//            }
            ///tr/commit();
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
