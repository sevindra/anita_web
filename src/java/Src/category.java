/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Cat;
import POJOS.Item;
import POJOS.Subcat;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
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
            String subsearchcat = request.getParameter("subsearchcat");
            String catupdate = request.getParameter("catupdate");
            String subcatupdate = request.getParameter("subcatupdate");
            String updatebtn = request.getParameter("updatebtn");
            String updatebtnsubcat = request.getParameter("updatebtnsubcat");
            String updatecatid = request.getParameter("updatecatid");
            String updatesubcatid = request.getParameter("updatesubcatid");
            String synctb = request.getParameter("synctb");
            String synctbsubcat = request.getParameter("synctbsubcat");
            String searchtf = request.getParameter("searchtf");
            String search = request.getParameter("search");
            String searchsubcat = request.getParameter("searchsubcat");
            String statusupdate = request.getParameter("statusupdate");
            String subcatid = request.getParameter("subcatid");
            String statusupdatesubcat = request.getParameter("statusupdatesubcat");
            String updatesubcatcatid = request.getParameter("updatesubcatcatid");
            String statusupdateitem = request.getParameter("statusupdateitem");
            String itemid = request.getParameter("itemid");
            String synproduct = request.getParameter("synproduct");
            String searchitem = request.getParameter("searchitem");

            //out.write(updatebtn+" c");
            if (btnsave != null) {
                if (btnsave.equals("Save")) {
                    Cat c = (Cat) objsave.getses().createCriteria(Cat.class).add(Restrictions.eq("catname", catname)).uniqueResult();
                    if (c==null) {
                        
                    Cat cat = new Cat();
                    cat.setCatname(catname);
                    cat.setStatus(1);
                    objsave.save(cat);
                    out.write("Category Saved");
                    } else {
                    out.write(catname+" Already Saved");
                    }
                }
            }
            if (subsave != null) {
                if (subsave.equals("Save")) {
                    Cat cat = (Cat) objsave.getses().load(Cat.class, Integer.parseInt(catid));
                    Criteria c = objsave.getses().createCriteria(Subcat.class);
                    c.add(Restrictions.eq("cat", cat));
                    c.add(Restrictions.eq("subname", subcatname));
                    Subcat subc=(Subcat) c.uniqueResult();
                    if (subc==null) {
                        
                    Subcat subcat = new Subcat();
                    subcat.setCat(cat);
                    subcat.setSubname(subcatname);
                    subcat.setStatus(1);
                    objsave.save(subcat);
                    out.write("Sub Category Saved");
                    } else {
                    out.write(subcatname+" Already Saved");
                    }
                    
                }
            }
            if (subsearchcat != null) {
                Cat cat = (Cat) objsave.getses().load(Cat.class, Integer.parseInt(subsearchcat));
                List<Subcat> subcat = (List) objsave.getses().createCriteria(Subcat.class).add(Restrictions.eq("cat", cat)).list();
                for (Subcat subcat1 : subcat) {
                    out.write("<option value=" + subcat1.getIdsubcat() + ">" + subcat1.getSubname() + "</option>");
                }

            }
            if (catupdate != null) {
                //out.write(catupdate);
                Cat cat = (Cat) objsave.getses().createCriteria(Cat.class).add(Restrictions.eq("catname", catupdate)).uniqueResult();
                out.write(cat.getIdcat().toString());
            }
            if (subcatupdate != null) {
//                out.write("name "+updatesubcatcatid);
                Cat cat= (Cat) objsave.getses().createCriteria(Cat.class).add(Restrictions.eq("catname", updatesubcatcatid.toString())).uniqueResult();
                Criteria c = objsave.getses().createCriteria(Subcat.class);
                c.add(Restrictions.eq("subname", subcatupdate));
                c.add(Restrictions.eq("cat", cat));
                Subcat subcat = (Subcat) c.uniqueResult();
                out.write(subcat.getIdsubcat().toString());
            }
            if (updatebtn != null) {
                if (updatebtn.equals("Update")) {
                    Cat cat = (Cat) objsave.getses().load(Cat.class, Integer.parseInt(updatecatid));
                    cat.setCatname(catname);
                    objsave.update(cat);
                    out.write("Category Updated");
                }
            }
            if (updatebtnsubcat != null) {
                if (updatebtnsubcat.equals("Update")) {
                    Subcat subcat = (Subcat) objsave.getses().load(Subcat.class, Integer.parseInt(updatesubcatid));
                    Cat cat = (Cat) objsave.getses().load(Cat.class, Integer.parseInt(catid));
                    subcat.setCat(cat);
                    subcat.setSubname(subcatname);
                    objsave.update(subcat);
                    out.write("Subcategory Updated");
                }
            }
            if (search != null) {
                if (search.equals("ok")) {
                    //out.write("tb");
                    try {
                        Criteria c = objsave.getses().createCriteria(Cat.class).add(Restrictions.like("catname", searchtf, MatchMode.START));
                        List<Cat> list = c.list();
                        for (Cat cat : list) {
                            out.write("<tr>");
                            out.write("<td class=\"cat\">");
                            out.write(cat.getCatname());
                            out.write("</td>");
                            if (cat.getStatus().toString().equals("1")) {
                                out.write("<td id=\"btn_active\">\n"
                                        + "                        <button class=\"btn btn-success btn-block\" onclick=\"sttechg('" + cat.getIdcat() + "')\">Active</button>\n"
                                        + "                    </td>");
                            } else {
                                out.write("<td id=\"btn_deactive\">\n"
                                        + "                        <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('" + cat.getIdcat() + "')\">Deactive</button>\n"
                                        + "                    </td>");
                            }
                            out.write("</tr>");
                        }
                    } catch (Exception e) {
                    }
                }
            }
            if (searchsubcat != null) {
                if (searchsubcat.equals("ok")) {
                    //out.write("tb");
                    try {
                        Criteria c = objsave.getses().createCriteria(Subcat.class).add(Restrictions.like("subname", searchtf, MatchMode.START));
                        List<Subcat> list = c.list();
                        for (Subcat cat : list) {
                            out.write("<tr>");
                            out.write("<td>");
                            out.write(cat.getCat().getCatname());
                            out.write("</td>");
                            out.write("<td class=\"subcat\">");
                            out.write(cat.getSubname());
                            out.write("</td>");
                            if (cat.getStatus().toString().equals("1")) {
                                out.write("<td id=\"btn_active\">\n"
                                        + "                        <button class=\"btn btn-success btn-block\" onclick=\"sttechg('" + cat.getIdsubcat() + "')\">Active</button>\n"
                                        + "                    </td>");
                            } else {
                                out.write("<td id=\"btn_deactive\">\n"
                                        + "                        <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('" + cat.getIdsubcat() + "')\">Deactive</button>\n"
                                        + "                    </td>");
                            }
                            out.write("</tr>");
                        }
                    } catch (Exception e) {
                    }
                }
            }
            if (searchitem != null) {
                if (searchitem.equals("ok")) {
                    //out.write("tb");
                    try {
                        Criteria c = objsave.getses().createCriteria(Item.class).add(Restrictions.like("itemname", searchtf, MatchMode.START));
                        List<Item> list = c.list();
                        for (Item cat : list) {
                            out.write("<tr>");
                            out.write("<td>");
                            out.write(cat.getSubcat().getCat().getCatname());
                            out.write("</td>");
                            out.write("<td class=\"item\">");
                            out.write(cat.getSubcat().getSubname());
                            out.write("</td>");
                            out.write("<td class=\"item\">");
                            out.write(cat.getItemname());
                            out.write("</td>");
                            if (cat.getStatus().toString().equals("1")) {
                                out.write("<td id=\"btn_active\">\n"
                                        + "                        <button class=\"btn btn-success btn-block\" onclick=\"sttechg('" + cat.getIditem() + "')\">Active</button>\n"
                                        + "                    </td>");
                            } else {
                                out.write("<td id=\"btn_deactive\">\n"
                                        + "                        <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('" + cat.getIditem() + "')\">Deactive</button>\n"
                                        + "                    </td>");
                            }
                            out.write("</tr>");
                        }
                    } catch (Exception e) {
                    }
                }
            }
            if (statusupdate != null) {
                if (statusupdate.equals("ok")) {
                    //out.write("tb");
                    try {
                        Cat cats = (Cat) objsave.getses().load(Cat.class, Integer.parseInt(catid));
                        if (cats.getStatus() == 1) {
                            cats.setStatus(0);
                            objsave.update(cats);
                        } else {
                            cats.setStatus(1);
                            objsave.update(cats);
                        }
                        Criteria c = objsave.getses().createCriteria(Cat.class);
                        List<Cat> list = c.list();
                        for (Cat cat : list) {
                            out.write("<tr>");
                            out.write("<td class=\"cat\">");
                            out.write(cat.getCatname());
                            out.write("</td>");
                            if (cat.getStatus().toString().equals("1")) {
                                out.write("<td id=\"btn_active\">\n"
                                        + "                        <button class=\"btn btn-success btn-block\" onclick=\"sttechg('" + cat.getIdcat() + "')\">Active</button>\n"
                                        + "                    </td>");
                            } else {
                                out.write("<td id=\"btn_deactive\">\n"
                                        + "                        <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('" + cat.getIdcat() + "')\">Deactive</button>\n"
                                        + "                    </td>");
                            }
                            out.write("</tr>");
                        }
                    } catch (Exception e) {
                    }
                }
            }
            if (statusupdatesubcat != null) {
                if (statusupdatesubcat.equals("ok")) {
                    //out.write("tb");
                    try {
                        Subcat subcat = (Subcat) objsave.getses().load(Subcat.class, Integer.parseInt(subcatid));
                        if (subcat.getStatus() == 1) {
                            subcat.setStatus(0);
                            objsave.update(subcat);
                        } else {
                            subcat.setStatus(1);
                            objsave.update(subcat);
                        }
                        Criteria c = objsave.getses().createCriteria(Subcat.class);
                        List<Subcat> list = c.list();
                        for (Subcat cat : list) {
                            out.write("<tr>");
                            out.write("<td>");
                            out.write(cat.getCat().getCatname());
                            out.write("</td>");
                            out.write("<td class=\"subcat\">");
                            out.write(cat.getSubname());
                            out.write("</td>");
                            if (cat.getStatus().toString().equals("1")) {
                                out.write("<td id=\"btn_active\">\n"
                                        + "                        <button class=\"btn btn-success btn-block\" onclick=\"sttechg('" + cat.getIdsubcat() + "')\">Active</button>\n"
                                        + "                    </td>");
                            } else {
                                out.write("<td id=\"btn_deactive\">\n"
                                        + "                        <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('" + cat.getIdsubcat() + "')\">Deactive</button>\n"
                                        + "                    </td>");
                            }
                            out.write("</tr>");
                        }
                    } catch (Exception e) {
                    }
                }
            }
            if (statusupdateitem != null) {
                if (statusupdateitem.equals("ok")) {
                    out.write("itemid");
                    try {
                        Item item = (Item) objsave.getses().load(Item.class, Integer.parseInt(itemid));
                        if (item.getStatus() == 1) {
                            item.setStatus(0);
                            objsave.update(item);
                        } else {
                            item.setStatus(1);
                            objsave.update(item);
                        }
                        Criteria c = objsave.getses().createCriteria(Item.class);
                        List<Item> list = c.list();
                        for (Item cat : list) {
                            out.write("<tr>");
                            out.write("<td>");
                            out.write(cat.getSubcat().getCat().getCatname());
                            out.write("</td>");
                            out.write("<td class=\"item\">");
                            out.write(cat.getSubcat().getSubname());
                            out.write("</td>");
                            out.write("<td class=\"item\">");
                            out.write(cat.getItemname());
                            out.write("</td>");
                            if (cat.getStatus().toString().equals("1")) {
                                out.write("<td id=\"btn_active\">\n"
                                        + "                        <button class=\"btn btn-success btn-block\" onclick=\"sttechg('" + cat.getIditem() + "')\">Active</button>\n"
                                        + "                    </td>");
                            } else {
                                out.write("<td id=\"btn_deactive\">\n"
                                        + "                        <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('" + cat.getIditem() + "')\">Deactive</button>\n"
                                        + "                    </td>");
                            }
                            out.write("</tr>");
                        }
                    } catch (Exception e) {
                    }
                }
            }
            if (synproduct != null) {
                if (synproduct.equals("ok")) {
                    //out.write("itemid");
                    try {
                        
                        Criteria c = objsave.getses().createCriteria(Item.class);
                        List<Item> list = c.list();
                        for (Item cat : list) {
                            out.write("<tr>");
                            out.write("<td>");
                            out.write(cat.getSubcat().getCat().getCatname());
                            out.write("</td>");
                            out.write("<td class=\"item\">");
                            out.write(cat.getSubcat().getSubname());
                            out.write("</td>");
                            out.write("<td class=\"item\">");
                            out.write(cat.getItemname());
                            out.write("</td>");
                            if (cat.getStatus().toString().equals("1")) {
                                out.write("<td id=\"btn_active\">\n"
                                        + "                        <button class=\"btn btn-success btn-block\" onclick=\"sttechg('" + cat.getIditem() + "')\">Active</button>\n"
                                        + "                    </td>");
                            } else {
                                out.write("<td id=\"btn_deactive\">\n"
                                        + "                        <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('" + cat.getIditem() + "')\">Deactive</button>\n"
                                        + "                    </td>");
                            }
                            out.write("</tr>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
            if (synctb != null) {
                if (synctb.equals("ok")) {
                    //out.write("tb");
                    try {
                        List<Cat> list = objsave.getses().createCriteria(Cat.class).list();
                        for (Cat cat : list) {
                            out.write("<tr>");
                            out.write("<td class=\"cat\">");
                            out.write(cat.getCatname());
                            out.write("</td>");
                            if (cat.getStatus().toString().equals("1")) {
                                out.write("<td id=\"btn_active\">\n"
                                        + "                        <button class=\"btn btn-success btn-block\" onclick=\"sttechg('" + cat.getIdcat() + "')\">Active</button>\n"
                                        + "                    </td>");
                            } else {
                                out.write("<td id=\"btn_deactive\">\n"
                                        + "                        <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('" + cat.getIdcat() + "')\">Deactive</button>\n"
                                        + "                    </td>");
                            }
                            out.write("</tr>");
                        }
                    } catch (Exception e) {
                    }
                }
            }
            if (synctbsubcat != null) {
                if (synctbsubcat.equals("ok")) {
                    //out.write("tb");
                    try {
                        List<Subcat> list = objsave.getses().createCriteria(Subcat.class).list();
                        for (Subcat cat : list) {
                            out.write("<tr>");
                            out.write("<td>");
                            out.write(cat.getCat().getCatname());
                            out.write("</td>");
                            out.write("<td class=\"subcat\">");
                            out.write(cat.getSubname());
                            out.write("</td>");
                            if (cat.getStatus().toString().equals("1")) {
                                out.write("<td id=\"btn_active\">\n"
                                        + "                        <button class=\"btn btn-success btn-block\" onclick=\"sttechg('" + cat.getIdsubcat() + "')\">Active</button>\n"
                                        + "                    </td>");
                            } else {
                                out.write("<td id=\"btn_deactive\">\n"
                                        + "                        <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('" + cat.getIdsubcat() + "')\">Deactive</button>\n"
                                        + "                    </td>");
                            }
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
