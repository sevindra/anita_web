/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Addres;
import POJOS.Item;
import POJOS.Login;
import POJOS.State;
import POJOS.User;
import POJOS.Utype;
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
@WebServlet(name = "admin_add_user", urlPatterns = {"/admin_add_user"})
public class admin_add_user extends HttpServlet {

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
            String state = "";
            String city = "";
            String mobile = "";
            String mobile2 = "";
            String email = "";
            String nic = "";
            String utype = "";
            String thumb = "";
            String url2 = "";
            String pass = "";
            int flag = 0;
            boolean flag2 = true;
            List<FileItem> itlist = upload.parseRequest(request);
            for (FileItem fileitem : itlist) {
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
                    if (fileitem.getFieldName().equals("state")) {
                        state = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("city")) {
                        city = fileitem.getString();
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
                    if (fileitem.getFieldName().equals("utype")) {
                        utype = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("email")) {
                        email = fileitem.getString();
                    }
                    if (fileitem.getFieldName().equals("pass")) {
                        pass = fileitem.getString();
                    }
                    flag++;

                    System.out.println(fname + ", " + mname + "," + lname + "," + address + "," + city + "," + mobile + "," + nic + "," + utype + "," + state);
                    if ((itlist.size() - 1) == flag | (itlist.size() - 2) == flag | (itlist.size() - 3) == flag | (itlist.size() - 4) == flag | (itlist.size() - 5) == flag | (itlist.size() - 6) == flag | (itlist.size() - 7) == flag) {
                        if (flag2) {

//                    out.write(fname+", "+mname+","+lname+","+address+","+city+","+mobile+","+nic+","+utype);
                            flag2 = false;
                        }
                    }

                } else {
                    if (fileitem.getFieldName().equals("fupload")) {
                        if (!fileitem.getName().equals("")) {
                            System.out.println("fup---");
                            thumb = Math.random() + fileitem.getName();
                            String url1 = "C:/Users/Sevi/Documents/NetBeansProjects/anita_web/web/";
                            url2 = "adminPanel/customer_images/";
                            File f = new File(url1 + url2 + thumb);
                            System.out.println(f.getPath());

                            //out.write(item.getIditem());
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
            User u = new User();
            Utype uty = (Utype) objsave.getses().load(Utype.class, Integer.parseInt(utype));
//                
            u.setUtype(uty);
            u.setNic(nic);
            u.setFname(fname);
            u.setMname(mname);
            u.setLname(lname);
            u.setMobile(mobile);
            u.setMobile2(mobile2);
            u.setImg(url2 + thumb);
            u.setStatus(1);
            objsave.save(u);
//                
            Addres addres = new Addres();
            State st = (State) objsave.getses().load(State.class, Integer.parseInt(state));
            addres.setState(st);
            addres.setUser(u);
            addres.setAddress(address);
            addres.setCity(city);
            addres.setPrimaryAddress(1);
            addres.setStatus(1);
            objsave.save(addres);
            
            Login l= new Login();
            l.setEmail(email);
            l.setUpass(pass);
            l.setUser(u);
            objsave.save(l);
//            HttpSession hs=request.getSession();
//            hs.setAttribute("product", "add");
            //response.sendRedirect("new_admin/main.jsp?product=add");
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
