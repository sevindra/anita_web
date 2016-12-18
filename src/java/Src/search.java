/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Cat;
import POJOS.Item;
import POJOS.ItemImage;
import POJOS.State;
import POJOS.Supplier;
import POJOS.User;
import POJOS.Utype;
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
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "search", urlPatterns = {"/search"})
public class search extends HttpServlet {

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

            String pname = request.getParameter("pname");
            String search = request.getParameter("search");
            String statusupdate = request.getParameter("status");
            String pstatus = request.getParameter("pstatus");
            String itemid = request.getParameter("itemid");
            String byname = request.getParameter("byname");
            String fname = request.getParameter("fname");
            String cname = request.getParameter("cname");
            String email = request.getParameter("email");
            String bycname = request.getParameter("bycname");
            String byemail = request.getParameter("byemail");
            String supsearch = request.getParameter("supsearch");
            String supname = request.getParameter("supname");
            String supdate = request.getParameter("supdate");
            String sid = request.getParameter("sid");
            String synuser = request.getParameter("synuser");
            //out.write(pname+catid+subcat);
            if (search != null) {
                if (search.equals("ok")) {
                    // out.write(pname);
                    Criteria c = objsave.getses().createCriteria(Item.class).add(Restrictions.like("itemname", pname, MatchMode.START));
                    List<Item> list = c.list();
                    for (Item item : list) {

                        out.write("\n");
                        out.write("                    <tr>\n");
                        out.write("                        <td>");
                        out.print(item.getItemname());
                        out.write("</td>\n");
                        out.write("                        <td>");
                        out.print(item.getSubcat().getSubname());
                        out.write("</td>\n");
                        out.write("                        <td>");
                        out.print(item.getDescription());
                        out.write("</td>\n");
                        out.write("                        ");

                        Criteria c1 = objsave.getses().createCriteria(ItemImage.class);
                        c1.add(Restrictions.eq("item", item));
                        //c1.setFirstResult(1);
                        c1.setMaxResults(1);
                        List<ItemImage> itemimage = c1.list();
                        for (ItemImage i : itemimage) {

                            out.write("<td><img src=\"");
                            out.write("../" + i.getUrl());
                            out.write("\" width=\"200\" height=\"150\"/></td>");

                        }

                        out.write("\n");
                        out.write("\n");
                        out.write("\n");
                        out.write("\n");
                        out.write("                        ");

                        if (item.getStatus().toString().equals("1")) {

                            out.write("\n");
                            out.write("                        <td id=\"btn_active\">\n");
                            out.write("                            <button class=\"btn btn-success btn-block\" onclick=\"sttechg('");
                            out.print(item.getStatus());
                            out.write("')\">Active</button>\n");
                            out.write("                        </td>\n");
                            out.write("                        ");

                        } else {

                            out.write("\n");
                            out.write("                        <td id=\"btn_deactive\">\n");
                            out.write("                            <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('");
                            out.print(item.getStatus());
                            out.write("')\">Deactive</button>\n");
                            out.write("                        </td>\n");
                            out.write("                        ");
                        }
                        out.write("\n");
                        out.write("                    </tr>\n");

                    }
                }
            }
            if (statusupdate != null) {
                if (statusupdate.equals("ok")) {
                    //out.write("tb");
                    try {
                        Cat cats = (Cat) objsave.getses().load(Cat.class, Integer.parseInt(itemid));
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
            if (pstatus != null) {
                if (pstatus.equals("ok")) {
                    //out.write("tb");
                    Item cats = (Item) objsave.getses().load(Item.class, Integer.parseInt(itemid));
                    if (cats.getStatus() == 1) {
                        cats.setStatus(0);
                        objsave.update(cats);
                    } else {
                        cats.setStatus(1);
                        objsave.update(cats);
                    }
                    Session ses = objsave.getses();
                    Criteria c = ses.createCriteria(Item.class);
                    List<Item> list = c.list();
                    for (Item item : list) {

                        out.write(" <tr>\n");
                        out.write("<td>");
                        out.print(item.getItemname());
                        out.write("</td>\n");
                        out.write("<td>");
                        out.print(item.getSubcat().getSubname());
                        out.write("</td>\n");
                        out.write("<td>");
                        out.print(item.getDescription());
                        out.write("</td>\n");
                        out.write("");

                        Criteria c1 = ses.createCriteria(ItemImage.class);
                        c1.add(Restrictions.eq("item", item));
                        //c1.setFirstResult(1);
                        c1.setMaxResults(1);
                        List<ItemImage> itemimage = c1.list();
                        for (ItemImage i : itemimage) {

                            out.write("<td><img src=\"");
                            out.write("../" + i.getUrl());
                            out.write("\" width=\"200\" height=\"150\"/></td>");

                        }

                        out.write("\n");
                        out.write("\n");
                        out.write("\n");
                        out.write("\n");
                        out.write("                        ");

                        if (item.getStatus().toString().equals("1")) {

                            out.write("\n");
                            out.write("                        <td id=\"btn_active\">\n");
                            out.write("                            <button class=\"btn btn-success btn-block\" onclick=\"sttechg('");
                            out.print(item.getIditem());
                            out.write("')\">Active</button>\n");
                            out.write("                        </td>\n");
                            out.write("                        ");

                        } else {

                            out.write("\n");
                            out.write("                        <td id=\"btn_deactive\">\n");
                            out.write("                            <button class=\"btn btn-danger btn-block\" onclick=\"sttechg('");
                            out.print(item.getIditem());
                            out.write("')\">Deactive</button>\n");
                            out.write("                        </td>\n");
                            out.write("                        ");
                        }
                        out.write("\n");
                        out.write("                    </tr>\n");
                    }
                }
            }
            if (byname != null) {
                if (byname.equals("ok")) {
                    //out.write("tb");
                    Criteria c = objsave.getses().createCriteria(Supplier.class).add(Restrictions.like("fname", fname, MatchMode.ANYWHERE));
                    List<Supplier> sup = c.list();
                    for (Supplier sup1 : sup) {

                        out.write("\n");
                        out.write("                                            <tr>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getFname());
                        out.write("</td>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getLname());
                        out.write("</td>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getCname());
                        out.write("</td>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getEmail());
                        out.write("</td>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getContact1());
                        out.write("</td>\n");
                        out.write("                                            </tr>\n");
                        out.write("                                            ");
                    }
                }
            }
            if (bycname != null) {
                if (bycname.equals("ok")) {
                    //out.write("tb");
                    Criteria c = objsave.getses().createCriteria(Supplier.class).add(Restrictions.like("cname", cname, MatchMode.ANYWHERE));
                    List<Supplier> sup = c.list();
                    for (Supplier sup1 : sup) {

                        out.write("\n");
                        out.write("                                            <tr>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getFname());
                        out.write("</td>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getLname());
                        out.write("</td>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getCname());
                        out.write("</td>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getEmail());
                        out.write("</td>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getContact1());
                        out.write("</td>\n");
                        out.write("                                            </tr>\n");
                        out.write("                                            ");
                    }
                }
            }
            if (byemail != null) {
                if (byemail.equals("ok")) {
                    //out.write("tb");
                    Criteria c = objsave.getses().createCriteria(Supplier.class).add(Restrictions.like("email", email, MatchMode.ANYWHERE));
                    List<Supplier> sup = c.list();
                    for (Supplier sup1 : sup) {

                        out.write("\n");
                        out.write("                                            <tr>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getFname());
                        out.write("</td>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getLname());
                        out.write("</td>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getCname());
                        out.write("</td>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getEmail());
                        out.write("</td>\n");
                        out.write("                                                <td>");
                        out.print(sup1.getContact1());
                        out.write("</td>\n");
                        out.write("                                            </tr>\n");
                        out.write("                                            ");
                    }
                }
            }
            if (supsearch != null) {
                if (supsearch.equals("ok")) {
                    //out.write("tb");
                    Supplier c = (Supplier) objsave.getses().createCriteria(Supplier.class).add(Restrictions.eq("fname", supname)).uniqueResult();
                    out.write(c.getFname() + "~@~" + c.getMname() + "~@~" + c.getLname() + "~@~" + c.getCname() + "~@~" + c.getContact1() + "~@~" + c.getContact2() + "~@~" + c.getEmail() + "~@~" + c.getAddress1() + "~@~" + c.getAddress2() + "~@~" + c.getAddress3() + "~@~" + c.getState().getState() + "~@~" + c.getIdsupplier());
                }
            }
            if (synuser != null) {
                if (synuser.equals("ok")) {
                    //out.write("tb");
                    Utype uty = (Utype) objsave.getses().load(Utype.class, 4);
                    Session s = objsave.getses();
                    Criteria c = s.createCriteria(User.class);
                    c.add(Restrictions.eq("status", 1));
                    c.add(Restrictions.not(Restrictions.eq("utype", uty)));
                    List<User> us = c.list();
                    for (User u : us) {

                        out.write("\n");
                        out.write("                <tr>\n");
                        out.write("                    <td>");
                        out.print(u.getNic());
                        out.write("</td>\n");
                        out.write("                    <td>");
                        out.print(u.getFname());
                        out.write("</td>\n");
                        out.write("                </tr>\n");
                        out.write("                ");
                    }
                }
            }
            if (supdate != null) {
                if (supdate.equals("ok")) {
                    //out.write("tb");
                    //String fname = request.getParameter("fname");
                    String mname = request.getParameter("mname");
                    String lname = request.getParameter("lname");
                    //String cname = request.getParameter("cname");
                    String phone1 = request.getParameter("cno1");
                    String phone2 = request.getParameter("cno2");
                    //String email = request.getParameter("email");
                    String Address1 = request.getParameter("add1");
                    String Address2 = request.getParameter("add2");
                    String Address3 = request.getParameter("add3");
                    String state = request.getParameter("state");
                    //out.print(fname+" "+mname+" "+lname+" "+cname+" "+phone1+" "+phone2+" "+email+" "+Address1+" "+Address2+" "+Address3+" "+state);
                    if (fname.equals("")) {
                        out.write("Please Fill First Name");
                    } else if (cname.equals("")) {
                        out.write("Please Fill Company Name");
                    } else if (phone1.equals("")) {
                        out.write("Please Fill Phone1");
                    } else if (email.equals("")) {
                        out.write("Please Fill Email");
                    } else if (Address1.equals("")) {
                        out.write("Please Fill Address1");
                    } else {
                        Session sesi = objsave.getses();
                        Criteria c = sesi.createCriteria(Supplier.class);
                        c.add(Restrictions.eq("fname", fname));
                        c.add(Restrictions.eq("mname", mname));
                        Supplier supplier = (Supplier) c.uniqueResult();

                        String regexStr = "^[0-9]{10}$";
                        if (phone1.matches(regexStr)) {
                            //out.write("ok_phone1");
                            String a = email;
                            String emailreg = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
                            boolean b = a.matches(emailreg);
                            if (b == false) {
                                out.write("error_email");
                            } else {
                                //out.write(sid);
                                //Session ses=controler.connector.getSessionFactory().openSession();
                                Supplier sup = (Supplier) objsave.getses().load(Supplier.class, Integer.parseInt(sid));
                                State statee = (State) objsave.getses().load(State.class, Integer.parseInt(state));
                                sup.setState(statee);
                                sup.setFname(fname);
                                sup.setMname(mname);
                                sup.setLname(lname);
                                sup.setCname(cname);
                                sup.setContact1(phone1);
                                sup.setContact2(phone2);
                                sup.setEmail(email);
                                sup.setAddress1(Address1);
                                sup.setAddress2(Address2);
                                sup.setAddress3(Address3);
                                sup.setStatus(1);

                                objsave.update(sup);
                                out.write("Supplier Updated");
                                //response.sendRedirect("A");
//                            ses.save(sup);
//                            Transaction tr=ses.beginTransaction();
//                            tr.commit();

                            }
                        } else {
                            out.write("error_phone1");
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
