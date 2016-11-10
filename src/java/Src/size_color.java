/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Color;
import POJOS.Item;
import POJOS.Size;
import POJOS.TempColor;
import POJOS.TempSize;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "size_color", urlPatterns = {"/size_color"})
public class size_color extends HttpServlet {

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
            String pid = request.getParameter("pid");
            String size = request.getParameter("size");
            String col = request.getParameter("color");
            String addcolor = request.getParameter("addcolor");
            String addsize = request.getParameter("addsize");
            String adcolor = request.getParameter("adcolor");
            String adsize = request.getParameter("adsize");
            String synccolor = request.getParameter("synccolor");
            String syncsize = request.getParameter("syncsize");
            //out.write("okk-" + addcolor);
            Item item = null;
            if (pid != null) {
                item = (Item) objsave.getses().load(Item.class, Integer.parseInt(pid));
            }

            if (col != null) {
                if (col.equals("color")) {
                    List<Color> list = (List) objsave.getses().createCriteria(Color.class).add(Restrictions.eq("item", item)).list();

                    for (Color color : list) {
                        out.write("<option value=" + color.getIdcolor() + ">");
                        out.write(color.getColor());
                        out.write("</option>");

                    }
                }
            }

            if (size != null) {
                if (size.equals("size")) {
                    List<Size> lists = (List) objsave.getses().createCriteria(Size.class).add(Restrictions.eq("item", item)).list();

                    for (Size list : lists) {
                        out.write("<option value=" + list.getIdsize() + ">");
                        out.write(list.getSize());
                        out.write("</option>");
                    }
                }
            }
            if (addcolor != null) {
                if (addcolor.equals("add")) {
                    TempColor tcolor= new TempColor();
                    tcolor.setColor(adcolor);
                    objsave.save(tcolor);
                    //out.write("color Saved");
                }
            }
            if (addsize != null) {
                if (addsize.equals("add")) {
                    TempSize tsize= new TempSize();
                    tsize.setSize(adsize);
                    objsave.save(tsize);
                    //out.write("Size Saved");
                }
            }
            if (synccolor != null) {
                if (synccolor.equals("ok")) {
                    
                    List<TempColor> collist=objsave.getses().createCriteria(TempColor.class).list();
                                        for(TempColor tc:collist){
                                        out.write("<tr>");
                                        out.write("<td>"+tc.getColor()+"</td>");
                                        out.write("</tr>");
                                        }
                }
            }
            if (syncsize != null) {
                if (syncsize.equals("ok")) {
                    
                    List<TempSize> collist=objsave.getses().createCriteria(TempSize.class).list();
                                        for(TempSize tc:collist){
                                        out.write("<tr>");
                                        out.write("<td>"+tc.getSize()+"</td>");
                                        out.write("</tr>");
                                        }
                }
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
