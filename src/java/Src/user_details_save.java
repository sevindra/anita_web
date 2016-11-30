/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Item;
import POJOS.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "user_details_save", urlPatterns = {"/user_details_save"})
public class user_details_save extends HttpServlet {

    private String url1;
    private String url2;

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

            FileItemFactory factry = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factry);

            String fname = "";
            String mname = "";
            String lname = "";
            String address = "";
            String city = "";
            String state = "";
            String pcode = "";
            String mobile = "";
            String mobile2 = "";
            String nic = "";
            String thumb = "";
            String url2 = "";
            int flag = 0;
            boolean flag2 = true;
            List itlist = upload.parseRequest(request);
            for (Object object : itlist) {
                FileItem fileitem = (FileItem) object;
                if (fileitem.isFormField()) {
                    if (fileitem.getFieldName().equals("fname")) {
                        fname = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("mname")) {
                        mname = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("lname")) {
                        lname = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("address")) {
                        address = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("city")) {
                        city = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("state")) {
                        state = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("pcode")) {
                        pcode = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("mobile")) {
                        mobile = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("mobile2")) {
                        mobile2 = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("nic")) {
                        nic = fileitem.getString();
                    }

                } else {
                    if (fileitem.getFieldName().equals("fupload")) {
                        if (!fileitem.getName().equals("")) {
                            thumb = Math.random() + fileitem.getName();
                            String url1 = "C:/Users/Sevi/Documents/NetBeansProjects/anita_web/web/";
                            url2 = "adminPanel/customer_images/";
                            File f = new File(url1 + url2 + thumb);
                            System.out.println(f.getPath());

                            if (f.exists()) {
                                fileitem.write(f);

                            } else {
                                File ff = new File("C:/Users/Sevi/Documents/NetBeansProjects/anita_web/web/adminPanel/customer_images");
                                ff.mkdir();
                                fileitem.write(f);
                            }
                        }
                    }
                }

            }
            User us = (User) request.getSession().getAttribute("user_obj");
            //System.out.println(us.getFname());
            us.setNic(nic);
            us.setFname(fname);
            us.setMname(mname);
            us.setLname(lname);
            us.setMobile(mobile);
            us.setMobile2(mobile2);
            us.setImg(url2 + thumb);
            us.setStatus(1);
            //objsave.ses=null;
            objsave.update(us);
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
