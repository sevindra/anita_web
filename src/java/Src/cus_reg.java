/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.User;
import POJOS.Utype;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "cus_reg", urlPatterns = {"/cus_reg"})
public class cus_reg extends HttpServlet {

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
            String email = request.getParameter("email");
            String reemail = request.getParameter("reemail");
            String password = request.getParameter("password");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String register_btn = request.getParameter("register-submit");
            String mobile = request.getParameter("mobile");

            Session ses = controler.connector.getSessionFactory().openSession();
            Transaction tr = ses.beginTransaction();
            Criteria cr = ses.createCriteria(User.class);
            cr.add(Restrictions.eq("uname", fname));
            User us = (User)cr.uniqueResult();
            if (us.getFname().equals(fname)) {
                out.write(us.getFname());
            }
            
//            if (register_btn.equals("register")) {
//                out.write("okkk");
//                User user = new User();
//                Utype utype = (Utype) ses.load(Utype.class, 4);
//                user.setUtype(utype);
//                user.setUname(fname);
//                user.setFname(fname);
//                user.setLname(lname);
//                user.setPass(password);
//                user.setEmail(email);
//                user.setMobile(mobile);
//                user.setStatus(1);
//                ses.save(user);
//                tr.commit();
//                response.sendRedirect("index.jsp");
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
