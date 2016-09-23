/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Login;
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
import javax.swing.JOptionPane;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

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

            String fname = request.getParameter("fname");
            String mname = request.getParameter("mname");
            String lname = request.getParameter("lname");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String pcode = request.getParameter("pcode");
            String mobile = request.getParameter("mobile");
            String nic = request.getParameter("nic");
            System.out.println(fname + " " + mname + " " + lname + " " + address + " " + city + " " + state + " " + pcode + " " + mobile + " " + nic);
            Session ses = controler.connector.getSessionFactory().openSession();
            boolean ismultiple = ServletFileUpload.isMultipartContent(request);
            out.write("okkkkk");
            if (ismultiple) {

                FileItemFactory fif = new DiskFileItemFactory();
               ServletFileUpload upload = new ServletFileUpload(fif);

                try {
                    List<FileItem> fit = upload.parseRequest(request);
                    for (FileItem f : fit) {
                        //out.write("okkkkk2");
                        if (!(f.getName() == null)) {
                            // out.write("okkkkk3");

                            if (!f.isFormField()) {
////                               

//                                String n = new File(f.getName()).getName();
//                                url1="C:/Users/Sevi/Documents/NetBeansProjects/anita_web/web/";
//                                url2="adminPanel/customer_images/" + System.currentTimeMillis() + "_" + n;
//                                f.write(new File(url1+url2));
                                //response.sendRedirect("my_profile.jsp");
                            }else{
                            }
                            //0out.print(f.getName().equals(fname));
                        } else {
                            //out.write("else");
//                            //response.sendRedirect("my_profile.jsp");
//
                        }
                    }
//                    Login login = (Login) request.getSession().getAttribute("login");
//                    int userid = login.getUser().getIduser();
//                    User user = (User) ses.load(User.class, userid);
//                    user.setFname(fname);
//                    user.setMname(mname);
//                    user.setLname(lname);
//                    user.setMobile(mobile);
//                    user.setImg(url2);
//                    ses.update(user);
//                    ses.beginTransaction().commit();
//                    out.write(user.getFname());

                } catch (Exception e) {
                    e.printStackTrace();
                }
                System.out.print("iff");
            }
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
