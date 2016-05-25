/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Cat;
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
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "SubCateSearch", urlPatterns = {"/SubCateSearch"})
public class SubCateSearch extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
            PrintWriter out = response.getWriter();

        try {
            String s = request.getParameter("id");
            System.out.println(s);
            Cat caat = new Cat();

            
            SessionFactory sf = controler.connector.getSessionFactory();
            Session ses = sf.openSession();
            Criteria cr1=ses.createCriteria(POJOS.Cat.class);
            cr1.add(Restrictions.eq("idcat", Integer.parseInt(s)));
            Cat cat=(Cat) cr1.uniqueResult();
            Criteria cr2 = ses.createCriteria(POJOS.Subcat.class);
            cr2.add(Restrictions.eq("cat", cat));
            List<POJOS.Subcat> Subcat =cr2.list();
             for (POJOS.Subcat subcat : Subcat) {
                out.write("<option value=" + subcat.getIdsubcat() + ">" + subcat.getSubname() + "</option>");
            }

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
