/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "user_save", urlPatterns = {"/user_save"})
public class Cus_Registration extends HttpServlet {

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
            out.write("okkkk");
//            String fname=request.getParameter("fname");
//            String lname=request.getParameter("lname");
//            String uname=request.getParameter("uname");
//            int utype=Integer.parseInt(request.getParameter("utype"));
//            String pass=request.getParameter("pass");
//            String cpass=request.getParameter("cpass");
//            String qus=request.getParameter("qus");
//            String ans=request.getParameter("ans");
//            String save=request.getParameter("save");
//            
//            Session ses=controler.connector.getSessionFactory().openSession();
//            Transaction tr=ses.beginTransaction();
//            
//            
//            if (save.equals("save")) {
//                POJOS.User user=new User();
//                POJOS.Utype type=(POJOS.Utype) ses.load(POJOS.Utype.class, utype);
//                user.setFname(fname);
//                user.setLname(lname);
//                user.setUname(uname);
//                user.setUtype(type);
//                user.setPass(pass);
//                user.setCpass(cpass);
//                user.setQue(qus);
//                user.setAnswer(ans);out.write("ok");
//                ses.save(user);
//                tr.commit();
//                
//                response.sendRedirect("adminPanel/user_reg.jsp");
//            }
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
