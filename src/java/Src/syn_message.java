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
@WebServlet(name = "syn_message", urlPatterns = {"/syn_message"})
public class syn_message extends HttpServlet {

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

            if (request.getSession().getAttribute("user_obj").toString() != null) {
                privilege_class p = new privilege_class();
                String userid = request.getParameter("userid");
                User su = (User) request.getSession().getAttribute("user_obj");
                if (p.getPrivilage(su.getIduser().toString(), request.getRequestURI())) {
                    out.write("\n");
                    out.write("        ");

                    HttpSession hsheader = request.getSession();
                    POJOS.User userheader = (POJOS.User) hsheader.getAttribute("user_obj");
                    User u = (User) objsave.getses().load(User.class, Integer.parseInt(userid));

                    out.write("\n");
                    out.write("        <h3 style=\"margin-top: -20px\"><a href=\"#\" onclick=\"messages()\"><span class=\"glyphicon glyphicon-arrow-left\"></span></a><strong>Messages - ");
                    out.print(u.getFname());
                    out.write("</strong></h3>\n");
                    out.write("        <div class=\"col-md-8 col-md-offset-1\">\n");
                    out.write("            ");

                    String sql = "SELECT * FROM message WHERE mfrom='" + u.getIduser() + "' OR mto='" + u.getIduser() + "'";
                    SQLQuery query = objsave.getses().createSQLQuery(sql);
                    query.addEntity(Message.class);
                    List<Message> list = query.list();
                    //List<Message> list = objsave.getses().createCriteria(Message.class).add(Restrictions.or(Restrictions.eq("userByMto", user),Restrictions.eq("userByMfrom", user))).list();
                    for (Message mes : list) {

                        out.write("\n");
                        out.write("            <div class=\"row\">\n");
                        out.write("                <div class=\"col-md-2\">\n");
                        out.write("                    \n");
                        out.write("                    <img src=\"");
                        if (mes.getUtype().getIdutype() != 4) {
                            out.write("../img/anita.ico");
                        } else {
                            out.write("../" + u.getImg());
                        }
                        out.write("\" style=\"width: 50px\"/>\n");
                        out.write("                </div>\n");
                        out.write("                <div class=\"col-md-6\">\n");
                        out.write("                    <p style=\"text-align: justify\">");
                        out.print(mes.getMessage());
                        out.write("</p>\n");
                        out.write("                </div>\n");
                        out.write("            </div>\n");
                        out.write("            ");
                    }
                    out.write("\n");
                    out.write("            <br/>\n");
                    out.write("            <div class=\"col-md-10 col-md-offset-1\">\n");
                    out.write("                <div class=\"row\">\n");
                    out.write("                    <textarea class=\"form-control\" rows=\"5\" id=\"admin_msg\"></textarea>\n");
                    out.write("                </div>\n");
                    out.write("                <br/>\n");
                    out.write("                <div class=\"row text-right\">\n");
                    out.write("                    <button class=\"btn btn-primary\" style=\"width: 100px\" id=\"message_btn\" onclick=\"adimin_msge_to_cus('");
                    out.print(u.getIduser());
                    out.write("')\">Send</button>\n");
                    out.write("                </div>\n");
                    out.write("            </div>\n");
                    out.write("        </div>\n");
                    out.write("        ");
                } else {

                    out.write("\n");
                    out.write("                <div class=\"col-md-12\" style='position:absolute;z-index:0;left:0;top:0;width:100%;height:100%'>\n");
                    out.write("                    <img src='../img/no_access.jpg' style='width:100%;height:450px' alt='[]' />\n");
                    out.write("                </div>\n");
                    out.write("        ");

                }
            }
            out.write("\n");
            out.write("    </body>\n");
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
