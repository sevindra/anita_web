/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Cat;
import POJOS.Subcat;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "category", urlPatterns = {"/category"})
public class category extends HttpServlet {

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
            String catname = request.getParameter("catname");
            String btnsave = request.getParameter("savebtn");
            String subsave = request.getParameter("subsave");
            String subcatname = request.getParameter("subcatname");
            String catid = request.getParameter("catid");
            String subsearchcat=request.getParameter("subsearchcat");
            String catupdate=request.getParameter("catupdate");
            String updatebtn=request.getParameter("updatebtn");
            String updatecatid=request.getParameter("updatecatid");
            String synctb=request.getParameter("synctb");
            
            //out.write(updatebtn+" c");
            if (btnsave != null) {
                if (btnsave.equals("Save")) {
                    Cat cat = new Cat();
                    cat.setCatname(catname);
                    cat.setStatus(1);
                    objsave.save(cat);
                    out.write("Category Saved");
                }
            }
            if (subsave != null) {
                if (subsave.equals("Save")) {
                    Cat cat = (Cat) objsave.getses().load(Cat.class, Integer.parseInt(catid));
                    Subcat subcat = new Subcat();
                    subcat.setCat(cat);
                    subcat.setSubname(subcatname);
                    subcat.setStatus(1);
                    objsave.save(subcat);
                    out.write("Sub Category Saved");
                }
            }
            if (subsearchcat!=null) {
                Cat cat=(Cat) objsave.getses().load(Cat.class, Integer.parseInt(subsearchcat));
                List<Subcat> subcat= (List) objsave.getses().createCriteria(Subcat.class).add(Restrictions.eq("cat", cat)).list();
                for (Subcat subcat1 : subcat) {
                    out.write("<option value="+cat.getIdcat()+">"+subcat1.getSubname()+"</option>");
                }
                
            }
            if (catupdate!=null) {
                //out.write(catupdate);
                Cat cat=(Cat) objsave.getses().createCriteria(Cat.class).add(Restrictions.eq("catname", catupdate)).uniqueResult();
                out.write(cat.getIdcat().toString());
            }
            if (updatebtn!=null) {
                if(updatebtn.equals("Update")){
                Cat cat=(Cat) objsave.getses().load(Cat.class, Integer.parseInt(updatecatid));
                cat.setCatname(catname);
                objsave.update(cat);
                out.write("Category Updated");
                }
            }
            if (synctb!=null) {
                if(synctb.equals("ok")){
                //out.write("tb");
                    try {
                        List<Cat> list=objsave.getses().createCriteria(Cat.class).list();
                        for(Cat cat:list){
                        out.write("<tr>");
                        out.write("<td class=\"cat\">");
                        out.write(cat.getCatname());
                        out.write("</td>");
                        out.write("</tr>");
                        }
                    } catch (Exception e) {
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
