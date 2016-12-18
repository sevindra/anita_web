/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.OnlineUsers;
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

/**
 *
 * @author Sevi
 */
@WebServlet(name = "pagination", urlPatterns = {"/pagination"})
public class pagination extends HttpServlet {

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
            String page=request.getParameter("page");
            String online=request.getParameter("online");
//            out.println(page);
            String currentpage = request.getParameter("pag");
                        Session s = objsave.getses();
                        Criteria c = s.createCriteria(OnlineUsers.class);

                        if (currentpage != null) {
                            if (currentpage.equals("1")) {
                                c.setMaxResults(3);
                            } else {
                                c.setFirstResult((Integer.parseInt(request.getParameter("pag")) * 3) - 3);
                                c.setMaxResults(3);
                            }
                        } else {
                            c.setMaxResults(3);
                        }
                        List<OnlineUsers> us = c.list();
                        for (OnlineUsers u : us) {
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td><img src=\"../");
      out.print(u.getUser().getImg());
      out.write("\" width=\"200\" height=\"150\"/></td>\n");
      out.write("                        <td>");
      out.print(u.getUser().getFname());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(u.getUser().getMname());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(u.getUser().getLname());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(u.getUser().getNic());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(u.getUser().getMobile());
      out.write("</td>\n");
      out.write("                        <td>");
      out.print(u.getUser().getUtype().getUtype());
      out.write("</td>\n");
      out.write("                        <!--<td><button class=\"btn btn-danger\">Deactive</button></td>-->\n");
      out.write("                    </tr>\n");
      out.write("                    ");
}
      out.write("\n");
        }catch(Exception e){
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
