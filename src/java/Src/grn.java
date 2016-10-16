/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Cat;
import POJOS.Color;
import POJOS.Grn;
import POJOS.GrnItem;
import POJOS.Item;
import POJOS.Size;
import POJOS.Stock;
import POJOS.Supplier;
import POJOS.TempGrnItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.json.JsonArray;
import javax.json.JsonNumber;
import javax.json.JsonObject;
import javax.json.JsonString;
import javax.json.JsonValue;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.json.JSONObject;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "grn", urlPatterns = {"/grn"})
public class grn extends HttpServlet {

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
            String pid = request.getParameter("pid");
            String cost = request.getParameter("cost");
            String price = request.getParameter("price");
            String qty = request.getParameter("qty");
            String dis = request.getParameter("dis");
            String tot = request.getParameter("tot");
            String color = request.getParameter("color");
            String size = request.getParameter("size");
            String addbtn = request.getParameter("addbtn");
            String rembtn = request.getParameter("rembtn");
            String itemid = request.getParameter("itemid");
            String synctb = request.getParameter("synctb");
            String grnsave = request.getParameter("grnsave");
            String grnid = request.getParameter("grnid");
            String supid = request.getParameter("supid");
            String totalam = request.getParameter("totalam");
            //out.write(pid+", "+cost+", "+price+", "+qty+", "+dis+", "+tot+", "+color+", "+size+", "+addbtn);
            //out.write(rembtn);

            if (addbtn != null) {
                if (addbtn.equals("add")) {
                    Item item = (Item) objsave.getses().load(Item.class, Integer.parseInt(pid));
                    Color col = (Color) objsave.getses().load(Color.class, Integer.parseInt(color));
                    Size siz = (Size) objsave.getses().load(Size.class, Integer.parseInt(size));
                    TempGrnItem tempitem = new TempGrnItem();
                    tempitem.setItem(item);
                    tempitem.setColor(col);
                    tempitem.setSize(siz);
                    tempitem.setCost(Double.parseDouble(cost));
                    tempitem.setPrice(Double.parseDouble(price));
                    tempitem.setQty(Integer.parseInt(qty));
                    tempitem.setDiscount(Integer.parseInt(dis));
                    tempitem.setTotal(Double.parseDouble(tot));
                    objsave.save(tempitem);
                    out.write("added");
                }
            }
            if (rembtn != null) {
                if (rembtn.equals("remove")) {
                    TempGrnItem tempitem = (TempGrnItem) objsave.getses().load(TempGrnItem.class, Integer.parseInt(itemid));
                    out.write(tempitem.getIdtempGrnItem());
                    objsave.delete(tempitem);
//                    Session s = controler.connector.getSessionFactory().openSession();
//                    Transaction tr = s.beginTransaction();
//                    s.delete(tempitem);
//                    tr.commit();
                    out.write("deleted");
                }
            }
            if (synctb != null) {
                if (synctb.equals("ok")) {
                    //out.write("tb");
                    try {
                        out.write("<tr>");
                        List<TempGrnItem> tblist = objsave.getses().createCriteria(TempGrnItem.class).list();
                        for (TempGrnItem item : tblist) {
                            out.write("<td>");
                            out.print(item.getIdtempGrnItem());
                            out.write("</td>");
                            out.write("<td>");
                            out.print(item.getItem().getItemname());
                            out.write("</td>");
                            out.write("<td style=\"text-align: right\">");
                            out.print(item.getCost());
                            out.write("</td>");
                            out.write("<td style=\"text-align: right\">");
                            out.print(item.getPrice());
                            out.write("</td>");
                            out.write("<td>");
                            out.print(item.getQty());
                            out.write("</td>");
                            out.write("<td>");
                            out.print(item.getDiscount());
                            out.write("</td>");
                            out.write("<td style=\"text-align: right\">");
                            out.print(item.getTotal());
                            out.write("</td>");
                            out.write("<td>");
                            out.print(item.getColor().getColor());
                            out.write("</td>");
                            out.write("<td>");
                            out.print(item.getSize().getSize());
                            out.write("</td>");
                            out.write("<td><button class=\"btn btn-default myhover btn-block it\" id=\"rembtn\" value=\"remove\">Remove</button></td>");
                            out.write("</tr>\n");
                            out.write("");

                        }

                    } catch (Exception e) {
                    }
                }
            }
            if (grnsave != null) {
                if (grnsave.equals("save")) {
                    //out.write(grnid+"saved"+supid+" "+totalam);
                    Supplier supplier = (Supplier) objsave.getses().load(Supplier.class, Integer.parseInt(supid));
                    Grn grn = new Grn();
                    grn.setGrnidreal(grnid);
                    grn.setSupplier(supplier);
                    grn.setDeteTime(new Date());
                    grn.setTotal(Double.parseDouble(totalam));
                    grn.setStatus(1);
                    objsave.save(grn);

                    List<TempGrnItem> list = objsave.getses().createCriteria(TempGrnItem.class).list();
                    for (TempGrnItem list1 : list) {
                        GrnItem grnitem = new GrnItem();
                        grnitem.setGrn(grn);
                        grnitem.setItem(list1.getItem());
                        grnitem.setCost(list1.getCost());
                        grnitem.setQty(list1.getQty());
                        grnitem.setDiscount(list1.getDiscount());
                        grnitem.setTotal(list1.getTotal());
                        grnitem.setStatus(1);
                        objsave.save(grnitem);

                        Stock stock = new Stock();
                        stock.setItem(list1.getItem());
                        stock.setSize(list1.getSize());
                        stock.setColor(list1.getColor());
                        stock.setGrn(grn);
                        stock.setPrice(list1.getPrice());
                        stock.setQty(list1.getQty());
                        stock.setAvalQty(list1.getQty());
                        stock.setStatus(1);
                        objsave.save(stock);

                        objsave.delete(list1);
                        out.write("okgrn");
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
