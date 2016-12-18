/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Color;
import POJOS.Item;
import POJOS.Size;
import POJOS.Stock;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "item_price", urlPatterns = {"/item_price"})
public class item_price extends HttpServlet {

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
            String getprice = request.getParameter("getprice");
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            String pid = request.getParameter("pid");
            if (color.equals("")&&size.equals("")) {
                //out.write(size + "okkk" + color);
                
            }else{
                    Color col = (Color) objsave.getses().load(Color.class, Integer.parseInt(color));
                    Size si = (Size) objsave.getses().load(Size.class, Integer.parseInt(size));
                    Item i = (Item) objsave.getses().load(Item.class, Integer.parseInt(pid));
                    Criteria c = objsave.getses().createCriteria(Stock.class);
                    c.add(Restrictions.eq("item", i));
                    c.add(Restrictions.eq("size", si));
                    c.add(Restrictions.eq("color", col));
                    Stock s = (Stock) c.uniqueResult();
                    out.write(s.getPrice().toString());
            }
//                    Criteria pc = objsave.getses().createCriteria(Stock.class);
//                    pc.setProjection(Projections.groupProperty("item"));
//                    Stock ps = (Stock) pc.uniqueResult();
//                    out.write(ps.getPrice().toString());
            //out.println("<!DOCTYPE html>");

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
