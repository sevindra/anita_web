/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Addres;
import POJOS.Supplier;
import POJOS.User;
import POJOS.Utype;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "user_act_deac", urlPatterns = {"/user_act_deac"})
public class user_act_deac extends HttpServlet {

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
            String status = request.getParameter("status");
            String uid = request.getParameter("uid");
            //System.out.println("supid-"+supid);
            //out.print("head "+supid + "-" + status);
            User usa = (User) objsave.getses().load(User.class, Integer.parseInt(uid));
            if (usa.getStatus() == 1) {
                usa.setStatus(0);
                objsave.update(usa);
            } else {
                usa.setStatus(1);
                objsave.update(usa);
            }

            Utype uty = (Utype) objsave.getses().load(Utype.class, 2);
            Utype uty2 = (Utype) objsave.getses().load(Utype.class, 3);
            Session s = objsave.getses();
            Criteria c = s.createCriteria(User.class);
            //c.add(Restrictions.or(Restrictions.eq("user", uty),Restrictions.eq("user", uty2)));
            List<User> us = c.list();
            for (User u : us) {

                Addres a = (Addres) objsave.getses().createCriteria(Addres.class).add(Restrictions.and(Restrictions.eq("user", u), Restrictions.eq("status", 1), Restrictions.eq("primaryAddress", 1))).uniqueResult();

                out.write("\n");
                out.write("                <tr>\n");
                out.write("                    <td><img src=\"../");
                out.print(u.getImg());
                out.write("\" width=\"200\" height=\"150\"/></td>\n");
                out.write("                    <td>");
                out.print(u.getFname());
                out.write("</td>\n");
                out.write("                    <td>");
                out.print(u.getLname());
                out.write("</td>\n");
                out.write("                    <td>");
                if (a != null) {
                    out.write(a.getAddress() + " " + a.getCity());
                }
                out.write("</td>\n");
                out.write("                    <td>");
                out.print(u.getNic());
                out.write("</td>\n");
                out.write("                    <td>");
                out.print(u.getMobile());
                out.write("</td>\n");
                out.write("                    <td>");
                out.print(u.getUtype().getUtype());
                out.write("</td>\n");
                out.write("                    ");

                if (u.getStatus().toString().equals("1")) {

                    out.write("\n");
                    out.write("                    <td id=\"btn_active\">\n");
                    out.write("                        <button class=\"btn btn-success btn-block\" onclick=\"sttechg('");
                    out.print(u.getIduser());
                    out.write("')\">Active</button>\n");
                    out.write("                    </td>\n");
                    out.write("                    ");

                } else {

                    out.write("\n");
                    out.write("                    <td id=\"btn_deactive\">\n");
                    out.write("                        <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('");
                    out.print(u.getIduser());
                    out.write("')\">Deactive</button>\n");
                    out.write("                    </td>\n");
                    out.write("                    ");
                }
                out.write("\n");
                out.write("                </tr>\n");
                out.write("                ");
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
