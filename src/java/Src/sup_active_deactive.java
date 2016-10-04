/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Supplier;
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
@WebServlet(name = "sup_active_deactive", urlPatterns = {"/sup_active_deactive"})
public class sup_active_deactive extends HttpServlet {

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
            String supid = request.getParameter("supid");
            System.out.println("supid-"+supid);
            //out.print("head "+supid + "-" + status);
           Supplier supplier = (Supplier) objsave.getses().load(Supplier.class, Integer.parseInt(supid));
            if(supplier.getStatus()==1){
            supplier.setStatus(0);
            objsave.update(supplier);
            }
            else{
            supplier.setStatus(1);
            objsave.update(supplier);
            }

            out.write("<tr>\n" +
"                    <th>First Name</th>\n" +
"                    <th>Last Name</th>\n" +
"                    <th>Company Name</th>\n" +
"                    <th>Contact No1</th>\n" +
"                    <th>Contact No2</th>\n" +
"                    <th>Email</th>\n" +
"                    <th>Address</th>\n" +
"                    <th>State</th>\n" +
"                    <th>Act/Deact</th>\n" +
"                </tr>");
            Session ses = objsave.getses();
                    Criteria c = ses.createCriteria(Supplier.class);
                    List<Supplier> list = c.list();
                    for (Supplier sup : list) {
            out.write("<tr>");
            out.write("<td>"+sup.getFname()+"</td>\n" +
"                    <td>"+sup.getLname()+"</td>\n" +
"                    <td>"+sup.getCname()+"</td>\n" +
"                    <td>"+sup.getContact1()+"</td>\n" +
"                    <td>"+sup.getContact2()+"</td>\n" +
"                    <td>"+sup.getEmail()+"</td>\n" +
"                    <td>"+sup.getAddress1()+" "+sup.getAddress2()+" "+sup.getAddress3()+"</td>\n" +
"                    <td>"+sup.getState().getState()+"</td>");
            //out.write("</tr>");
            if(sup.getStatus().toString().equals("1")){
            out.write("<td id=\"btn_active\">\n" +
"                        <button class=\"btn btn-success btn-block\" onclick=\"sttechg('"+sup.getIdsupplier()+"')\">Active</button>\n" +
"                    </td>");
            }else{
            out.write("<td id=\"btn_deactive\">\n" +
"                        <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('"+sup.getIdsupplier()+"')\">Deactive</button>\n" +
"                    </td>");
            }
            out.write("</tr>");
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
