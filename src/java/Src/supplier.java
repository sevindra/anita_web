/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.State;
import POJOS.Supplier;
import POJOS.User;
import POJOS.Utype;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javassist.CtMethod;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "supplier", urlPatterns = {"/supplier"})
public class supplier extends HttpServlet {

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
            //out.write("okkk");
            String fname = request.getParameter("fname");
            String mname = request.getParameter("mname");
            String lname = request.getParameter("lname");
            String cname = request.getParameter("cname");
            String phone1 = request.getParameter("cno1");
            String phone2 = request.getParameter("cno2");
            String email = request.getParameter("email");
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
                Supplier supplier = (Supplier) c.uniqueResult();
                if (supplier == null) {
                    String regexStr = "^[0-9]{10}$";
                    if (phone1.matches(regexStr)) {
                        //out.write("ok_phone1");
                        String a = email;
                        String emailreg = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
                        boolean b = a.matches(emailreg);
                        if (b == false) {
                            out.write("error_email");
                        } else {
                            //out.write("email_ok");
                            //Session ses=controler.connector.getSessionFactory().openSession();
                            Supplier sup = new Supplier();
                            objsave.getses();
                            State statee = (State) objsave.ses.load(State.class, Integer.parseInt(state));
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

                            objsave.save(sup);
                            out.write("Supplier Saved");
                            //response.sendRedirect("A");
//                            ses.save(sup);
//                            Transaction tr=ses.beginTransaction();
//                            tr.commit();

                        }
                    } else {
                        out.write("error_phone1");
                    }

                } else {
                    out.write("Already Saved this Supplier");
                }

            }

            
            
//            Cookie myCookie = new Cookie("name", "val");
//            myCookie.setMaxAge(5);
//            response.addCookie(myCookie);
//            
//            
//            Cookie[] cookies= request.getCookies();
//
//        for(int i = 0; i < cookies.length; i++) { 
//            Cookie cookie1 = cookies[i];
//            if (cookie1.getName().equals("name")) {
//                out.println("name = " + cookie1.getValue());
//            }else{
//                out.println("time Out");
//            }
//        } 
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
