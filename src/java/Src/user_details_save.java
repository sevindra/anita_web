/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Item;
import POJOS.ItemImage;
import POJOS.Login;
import POJOS.Subcat;
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
import org.hibernate.criterion.Projections;
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
            String nic = "";
            String thumb = "";

            List itlist = upload.parseRequest(request);
            for (Object object : itlist) {
                FileItem fileitem = (FileItem) object;
                Item item = new Item();
                if (fileitem.isFormField()) {
                    if (fileitem.getFieldName().equals("catid")) {
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
                    if (fileitem.getFieldName().equals("nic")) {
                        nic = fileitem.getString();
                    }
                    
                    

                } else {
                    if (fileitem.getFieldName().equals("fupload")) {
                        if (!fileitem.getName().equals("")) {
                            thumb = Math.random() + fileitem.getName();
                            String url1="C:/Users/Sevi/Documents/NetBeansProjects/anita_web/web/";
                            String url2="adminPanel/product_imges/";
                            File f = new File(url1+url2+ thumb);
                            System.out.println(f.getPath());
                            Session itemses = objsave.getses();
                            Criteria c = itemses.createCriteria(Item.class);
                            c.setProjection(Projections.max("iditem"));
                            int itemid = (int) c.uniqueResult();
                            Item newitem = (Item) objsave.getses().load(Item.class, itemid);
                            ItemImage itemimage = new ItemImage();
                            itemimage.setItem(newitem);
                            itemimage.setUrl(url2+thumb);
                            objsave.save(itemimage);
                            //out.write(item.getIditem());
                            if (f.exists()) {
                                fileitem.write(f);

                            } else {
                                File ff = new File("C:/Users/Sevi/Documents/NetBeansProjects/anita_web/web/adminPanel/product_imges");
                                ff.mkdir();
                                fileitem.write(f);
                            }
                        }
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
