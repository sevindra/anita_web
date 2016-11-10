/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Pages;
import POJOS.PagesHasUtype;
import POJOS.Utype;
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
@WebServlet(name = "privileges", urlPatterns = {"/privileges"})
public class privileges extends HttpServlet {

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
            String utype = request.getParameter("utype");
            String page = request.getParameter("page");
            String save_privilage = request.getParameter("save_privilage");
            String delete_privilage = request.getParameter("delete_privilage");
            String privilege = request.getParameter("privilege");
           // out.write(privilege+" "+delete_privilage);
            if (save_privilage != null) {
                if (save_privilage.equals("ok")) {
                    Pages pag = new Pages();
                    pag.setPageName(page);
                    objsave.save(pag);
                    
                    Utype u=(Utype) objsave.getses().load(Utype.class, Integer.parseInt(utype));
                    PagesHasUtype ph=new PagesHasUtype();
                    ph.setUtype(u);
                    ph.setPages(pag);
                    objsave.save(ph);
                    out.write("saved");
                }
            }
            if (delete_privilage != null) {
                if (delete_privilage.equals("ok")) {
                    PagesHasUtype ph=(PagesHasUtype) objsave.getses().load(PagesHasUtype.class, Integer.parseInt(privilege));
                    objsave.delete(ph);
                    out.write("deleted");
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
