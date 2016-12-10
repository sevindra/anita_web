/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

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
@WebServlet(name = "product", urlPatterns = {"/product"})
public class product extends HttpServlet {

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

            String catid = "";
            String subcatid = "";
            String itemname = "";
            String descrition = "";
            String thumb = "";
            int flag = 0;
            boolean flag2 = true;
            List<FileItem> itlist = upload.parseRequest(request);
            for (FileItem fileitem : itlist) {
                Item item = new Item();
                if (fileitem.isFormField()) {
                    if (fileitem.getFieldName().equals("catid")) {
                        catid = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("subcat")) {
                        subcatid = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("itemname")) {
                        itemname = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("description")) {
                        descrition = fileitem.getString();
                    }
                    flag++;

                    if ((itlist.size() - 1) == flag | (itlist.size() - 2) == flag | (itlist.size() - 3) == flag | (itlist.size() - 4) == flag | (itlist.size() - 5) == flag| (itlist.size() - 6) == flag) {
                        if (flag2) {
                            
                            System.out.println("item---");
                            Subcat subcat = (Subcat) objsave.getses().load(Subcat.class, Integer.parseInt(subcatid));
                            item.setSubcat(subcat);
                            item.setItemname(itemname);
                            item.setDescription(descrition);
                            item.setStatus(1);
                            objsave.save(item);

                            List<TempColor> tc = objsave.getses().createCriteria(TempColor.class).list();
                            for (TempColor tc1 : tc) {
                                Color col = new Color();
                                System.out.println(tc1.getColor());
                                col.setColor(tc1.getColor());
                                col.setItem(item);
                                objsave.save(col);

                                objsave.delete(tc1);
                            }

                            List<TempSize> ts = objsave.getses().createCriteria(TempSize.class).list();
                            for (TempSize t : ts) {
                                Size siz = new Size();
                                siz.setSize(t.getSize());
                                siz.setItem(item);
                                objsave.save(siz);

                                objsave.delete(t);
                            }
                   // out.write(catid+", "+subcatid+","+itemname+","+descrition);
                            //System.out.println(catid+", "+subcatid+","+itemname+","+descrition);
                            flag2 = false;
                        }
                    }

                } else {
                    if (fileitem.getFieldName().equals("fupload")) {
                        if (!fileitem.getName().equals("")) {
                            System.out.println("fup---");
                            thumb = Math.random() + fileitem.getName();
                            String url1 = "C:/Users/Sevi/Documents/NetBeansProjects/anita_web/web/";
                            String url2 = "adminPanel/product_imges/";
                            File f = new File(url1 + url2 + thumb);
                            System.out.println(f.getPath());
                            Session itemses = objsave.getses();
                            Criteria c = itemses.createCriteria(Item.class);
                            c.setProjection(Projections.max("iditem"));
                            String i = c.uniqueResult().toString();
                            System.out.println(i);
                            int itemid;
                            if (i==null) {
                               itemid=1; 
                            }else{
                            itemid=Integer.parseInt(i);
                            }
                            Item newitem = (Item) objsave.getses().load(Item.class, itemid);
                            ItemImage itemimage = new ItemImage();
                            itemimage.setItem(newitem);
                            itemimage.setUrl(url2 + thumb);
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
//            HttpSession hs=request.getSession();
//            hs.setAttribute("product", "add");
           // response.sendRedirect("new_admin/main.jsp?product=add");
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
