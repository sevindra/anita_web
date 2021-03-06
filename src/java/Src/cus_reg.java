/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import POJOS.Utype;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "cus_reg", urlPatterns = {"/cus_reg"})
public class cus_reg extends HttpServlet {

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
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String cpass = request.getParameter("cpassword");
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String register_btn = request.getParameter("register-submit");
            String mobile = request.getParameter("mobile");
            String sec_code = request.getParameter("Security_code");

            int code = 0;
            HttpSession hs = request.getSession();

            Session ses = controler.connector.getSessionFactory().openSession();
            Transaction tr = ses.beginTransaction();

            if (register_btn != null) {
                if (register_btn.equals("register")) {

                    //check karanna me email eken thawa innawada kiyala
                    double d = Math.random();
                    code = (int) (d * 1000000000);
                    hs.setAttribute("registercode", code);

                    String content = "<html>\n"
                            + "    <head>\n"
                            + "        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                            + "        <title>JSP Page</title>\n"
                            + "        <!-- Latest compiled and minified CSS -->\n"
                            + "        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">\n"
                            + "\n"
                            + "        <!-- Optional theme -->\n"
                            + "        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css\" integrity=\"sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp\" crossorigin=\"anonymous\">\n"
                            + "\n"
                            + "        <!-- Latest compiled and minified JavaScript -->\n"
                            + "        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script>\n"
                            + "    </head>\n"
                            + "    <body>\n"
                            + "        <div class=\"text-center\" style=\"margin-top: 10px\">\n"
                            + "            <label>Click here to Continue - </label><a href=\"http://localhost:8080/anita_Web/cus_reg?Security_code=" + code + "&fname=" + fname + "&email=" + email + "&cpassword=" + cpass + "&lname=" + lname + "&mobile=" + mobile+"\"><button class=\"btn btn-danger\" style=\"margin-left: 10px\"><span class=\"glyphicon glyphicon-ok\"></span> Continue</button></a>\n"
                            + "        </div>\n"
                            + "    </body>\n"
                            + "</html>";
//                    Src.email.sendmail("cygnetic.info@gmail.com", "Sevindra1", "Dear " + fname + " " + lname + ", Your Email Address is Verified, Click to continue:- http://localhost:8080/anita_Web/cus_reg?Security_code=" + code + "&fname=" + fname + "&email=" + email + "&cpassword=" + cpass + "&lname=" + lname + "&mobile=" + mobile, new String[]{email}, "Welcome to Anita");
                    Src.email.sendmail("cygnetic.info@gmail.com", "Sevindra1", "Dear " + fname + " " + lname + ", Your Email Address is Verified, Click to continue:- "+content, new String[]{email}, "Welcome to Anita");
                    response.sendRedirect("login.jsp?register=reg&verify_email=3&reg=1");
                }
            }
            if (sec_code != null) {
                String mycode = hs.getAttribute("registercode").toString();
                if (mycode.equals(sec_code)) {
                    POJOS.User user = new POJOS.User();
                    POJOS.Utype utype = (Utype) ses.load(POJOS.Utype.class, 4);
                    user.setUtype(utype);
                    user.setFname(fname);
                    user.setLname(lname);
                    user.setMobile(mobile);
                    user.setImg("adminPanel/customer_images/user.jpg");
                    user.setStatus(1);
//                    objsave.save(user);
                    ses.save(user);

                    POJOS.Login login = new POJOS.Login();

                    login.setUser(user);
                    login.setEmail(email);
                    login.setUpass(cpass);

//                    objsave.save(login);
                    ses.save(login);

                    hs.setAttribute("user_obj", user);
                    tr.commit();
                    response.sendRedirect("index.jsp");
                }

            }else{
            out.write("Session Expierd");
            
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
