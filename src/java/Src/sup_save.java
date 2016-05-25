/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Supplier;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
public class sup_save extends HttpServlet {

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
            String sname = request.getParameter("sname");
            String cname = request.getParameter("cname");
            String cno1 = request.getParameter("cno1");
            String cno2 = request.getParameter("cno2");
            String email = request.getParameter("email");
            String add1 = request.getParameter("add1");
            String add2 = request.getParameter("add2");
            String add3 = request.getParameter("add3");
            String btn = request.getParameter("btn");

            //email = "sevindra@gmail.com";
            SessionFactory sf = controler.connector.getSessionFactory();
            Session s = sf.openSession();
            Transaction tr = s.beginTransaction();

            if (btn.equals("save")) {
                POJOS.Supplier supplier = new Supplier();
                supplier.setSupname(sname);
                supplier.setComname(cname);
                supplier.setContact1(Integer.parseInt(cno1));
                supplier.setContact2(Integer.parseInt(cno2));
                supplier.setEmail(email);
                supplier.setAddress1(add1);
                supplier.setAddress2(add2);
                supplier.setAddress3(add3);
//                s.save(supplier);
//                tr.commit();
                objsave.save(supplier);
                response.sendRedirect("adminPanel/sup.jsp");
            } else if (btn.equals("update")) {
                Criteria c = s.createCriteria(Supplier.class);
                c.add(Restrictions.eq("email", email));
                Supplier sup = (Supplier) c.uniqueResult();
                System.out.println(sup.getSupname());
                sup.setSupname(sname);
                sup.setComname(cname);
                sup.setContact1(Integer.parseInt(cno1));
                sup.setContact2(Integer.parseInt(cno2));
                //sup.setEmail(email);
                sup.setAddress1(add1);
                sup.setAddress2(add2);
                sup.setAddress3(add3);
                s.update(sup);
                tr.commit();
                response.sendRedirect("adminPanel/sup.jsp");
            } else if (btn.equals("delete")) {
                Criteria c = s.createCriteria(Supplier.class);
                c.add(Restrictions.eq("email", email));
                Supplier sup =(Supplier) c.uniqueResult();
                s.delete(sup);
                tr.commit();
                response.sendRedirect("adminPanel/sup.jsp");
            }
        } catch (Exception e) {
            throw new ServletException(e);
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
