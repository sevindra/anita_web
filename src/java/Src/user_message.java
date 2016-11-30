/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Message;
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
import javax.servlet.http.HttpSession;
import org.hibernate.SQLQuery;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "user_message", urlPatterns = {"/user_message"})
public class user_message extends HttpServlet {

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
            String message = request.getParameter("user_message");
            String message_btn = request.getParameter("message_btn");
            String load_mes = request.getParameter("load_mes");
            String msgid = request.getParameter("msgid");
            String read = request.getParameter("read");
            String uid = request.getParameter("uid");
            //out.write(message+"-"+message_btn);
            if (message_btn != null) {
                HttpSession hs = request.getSession();
                User user = null;
                if (uid == null) {
                    User u = (User) hs.getAttribute("user_obj");
                    user = (User) objsave.getses().load(User.class, u.getIduser());
                } else {
                    user = (User) objsave.getses().load(User.class, Integer.parseInt(uid));
                }
                User user1 = (User) objsave.getses().load(User.class, 1);
                Message mes = new Message();
                mes.setUtype(user1.getUtype());
                mes.setUserByMfrom(user);
                mes.setUserByMto(user1);
                mes.setMessage(message);
                mes.setNewmes(0);
                mes.setNotification(1);
                mes.setDate(new Date());
                mes.setTime(new Date());
                objsave.save(mes);
                out.write("message sent");
            }
            if (load_mes != null) {

            }
            if (read != null) {
                out.write(msgid);
            }
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
