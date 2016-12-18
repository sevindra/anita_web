/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Login;
import POJOS.LoginReg;
import POJOS.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "user_login", urlPatterns = {"/user_login"})
public class user_login extends HttpServlet {

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
            String pass = request.getParameter("password");

            Session ses = controler.connector.getSessionFactory().openSession();
            Criteria cr = ses.createCriteria(POJOS.Login.class);
            cr.add(Restrictions.eq("email", email));
            POJOS.Login login = (Login) cr.uniqueResult();
            String a = email;
            String emailreg = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
            boolean b = a.matches(emailreg);
            if (b == false) {

                response.sendRedirect("login.jsp?reg=2");
            } else {

                if (login != null) {
                    String dbemail = login.getEmail();
                    String dbpass = login.getUpass();

                    if (email.equals(dbemail) && pass.equals(dbpass)) {
                        if (login.getUser().getStatus() == 1) {
                            HttpSession hs = request.getSession();
                            hs.setAttribute("user_obj", login.getUser());
                            hs.setAttribute("login", login);
                            User u = (User) hs.getAttribute("user_obj");

                            LoginReg lr = new LoginReg();
                            lr.setLogin(login);
                            lr.setIndate(new Date());
                            lr.setIntime(new Date());
                            objsave.save(lr);

                            if (u.getUtype().getUtype().equals("Customer")) {
                                if (request.getSession().getAttribute("sessionCart") != null) {
                                    response.sendRedirect("add_to_cart");
                                } else {
                                    response.sendRedirect("index.jsp");
                                }

                            } else {
                                response.sendRedirect("new_admin/main.jsp");
                            }
                        } else {
                            response.sendRedirect("login.jsp?error_login=6");
                        }
                    } else {
                        response.sendRedirect("login.jsp?error_login=1");

                    }
                } else {
                    response.sendRedirect("login.jsp?error_login=1");

                }
            }

        } catch (Exception e) {
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
