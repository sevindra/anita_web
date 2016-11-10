/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Advertisement;
import POJOS.Color;
import POJOS.Item;
import POJOS.ItemImage;
import POJOS.Size;
import POJOS.Subcat;
import POJOS.TempColor;
import POJOS.TempSize;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
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
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "advertisement_up", urlPatterns = {"/advertisement_up"})
public class advertisement_up extends HttpServlet {

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
            
            String location = "";
            String thumb = "";
            int flag = 0;
            boolean flag2 = true;
            List<FileItem> itlist = upload.parseRequest(request);
            for (FileItem fileitem : itlist) {
                Item item = new Item();
                if (fileitem.isFormField()) {
                    if (fileitem.getFieldName().equals("location")) {
                        location = fileitem.getString();
                    }
                    
                    flag++;

                    if ((itlist.size() - 1) == flag | (itlist.size() - 2) == flag | (itlist.size() - 3) == flag | (itlist.size() - 4) == flag | (itlist.size() - 5) == flag) {
                        if (flag2) {
                            
                    out.write(location);
                            //System.out.println(catid+", "+subcatid+","+itemname+","+descrition);
                            flag2 = false;
                        }
                    }

                } else {
                    if (fileitem.getFieldName().equals("fupload")) {
                        if (!fileitem.getName().equals("")) {
                            thumb = Math.random() + fileitem.getName();
                            String url1 = "C:/Users/Sevi/Documents/NetBeansProjects/anita_web/web/";
                            String url2 = "adminPanel/ad/";
                            File f = new File(url1 + url2 + thumb);
                            System.out.println(f.getPath());
                            Advertisement ad=new Advertisement();
                            ad.setPage(location);
                            ad.setUrl(url2+thumb);
                            ad.setDatetime(new Date());
                            objsave.save(ad);
                            //out.write(item.getIditem());
                            if (f.exists()) {
                                fileitem.write(f);

                            } else {
                                File ff = new File("C:/Users/Sevi/Documents/NetBeansProjects/anita_web/web/adminPanel/ad");
                                ff.mkdir();
                                fileitem.write(f);
                            }
                        }
                    }
                }

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
