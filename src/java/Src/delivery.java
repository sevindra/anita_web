/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Invoice;
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
@WebServlet(name = "delivery", urlPatterns = {"/delivery"})
public class delivery extends HttpServlet {

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
            String did = request.getParameter("did");
            Invoice cats = (Invoice) objsave.getses().load(Invoice.class, Integer.parseInt(did));
            if (cats.getComp() == 1) {
                cats.setComp(0);
                objsave.update(cats);
            } else {
                cats.setComp(1);
                objsave.update(cats);
            }

            Session ses = objsave.getses();
            Criteria c = ses.createCriteria(Invoice.class);
            List<Invoice> list = c.list();
            for (Invoice item : list) {

                out.write("\n");
                out.write("                    <tr>\n");
                out.write("                        <td>");
                out.print(item.getInvoiceNo());
                out.write("</td>\n");
                out.write("                        <td>");
                out.print(item.getDate());
                out.write("</td>\n");
                out.write("                        <td>");
                out.print(item.getTime());
                out.write("</td>\n");
                out.write("                        <td>");
                out.print(item.getUser().getFname() + " " + item.getUser().getLname());
                out.write("</td>\n");
                out.write("                        <td>");
                out.print(item.getDelAddress());
                out.write("</td>\n");
                out.write("                        <td>");
                out.print(item.getDelCitiy());
                out.write("</td>\n");
                out.write("                        <td>");
                out.print(item.getDelZip());
                out.write("</td>\n");
                out.write("                        <td>");
                out.print(item.getTotal());
                out.write("</td>\n");
                out.write("                        ");

                if (item.getDelivery().toString().equals("1")) {

                    out.write("\n");
                    out.write("                        <td id=\"btn_active\">\n");
                    out.write("                            <button class=\"btn btn-success btn-block\" onclick=\"sttechg('");
                    out.print(item.getIdinvoice());
                    out.write("')\">Delivery</button>\n");
                    out.write("                        </td>\n");
                    out.write("                        ");

                } else if (item.getComp().toString().equals("1")) {

                    out.write("\n");
                    out.write("                        <td id=\"btn_deactive\">\n");
                    out.write("                            <button class=\"btn btn-danger btn-block\">Completed</button>\n");
                    out.write("                        </td>\n");
                    out.write("                        ");
                } else if (item.getDelivery().toString().equals("1") && item.getComp().toString().equals("1")) {

                    out.write("\n");
                    out.write("                        <td id=\"btn_deactive\">\n");
                    out.write("                            <button class=\"btn btn-danger btn-block\" >Completed</button>\n");
                    out.write("                        </td>\n");
                    out.write("                        ");

                } else {

                    out.write("\n");
                    out.write("                        <td id=\"btn_active\">\n");
                    out.write("                            <button class=\"btn btn-info btn-block\">Not Approved</button>\n");
                    out.write("                        </td>\n");
                    out.write("                        ");

                }
                out.write("\n");
                out.write("                        ");

                if (item.getComp().toString().equals("1")) {

                    out.write("\n");
                    out.write("                        <td id=\"btn_active\">\n");
                    out.write("                            <h4><span class=\"label label-lg label-warning\">Delivered</span></h4>\n");
                    out.write("                        </td>\n");
                    out.write("                        ");

                } else {

                    out.write("\n");
                    out.write("                        <td id=\"btn_deactive\">\n");
                    out.write("                            <h4><span class=\"label label-lg label-warning\">Not Delivered</span></h4>\n");
                    out.write("\n");
                    out.write("                        </td>\n");
                    out.write("                        ");
                }
                out.write("\n");
                out.write("                    </tr>\n");
                out.write("                    ");
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
