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
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "change_password", urlPatterns = {"/change_password"})
public class change_password extends HttpServlet {

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
            String pass = request.getParameter("pass");
            String cpass = request.getParameter("cpass");
            String saves = request.getParameter("save");

            Session ses = controler.connector.getSessionFactory().openSession();
            Transaction tr = ses.beginTransaction();

            HttpSession hs = request.getSession();
            current_url email = (current_url) hs.getAttribute("email");

            Criteria cr = ses.createCriteria(POJOS.User.class);
            cr.add(Restrictions.eq("email", email.getEmail()));
            out.print(email);
            User user = (User) cr.uniqueResult();
            int id = user.getIduser();
            Criteria cr1 = ses.createCriteria(User.class);
            cr.add(Restrictions.eq("iduser", id));
            User user1 = (User) cr.uniqueResult();

            if (saves.equals("pwsave")) {
                out.print("ok");
//                user1.setPass(pass);
//                user1.setCpass(cpass);
                ses.update(user1);
                response.sendRedirect("send_email.jsp?update=753951");
            } else {
                out.write("okelse");
            }
            tr.commit();
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
