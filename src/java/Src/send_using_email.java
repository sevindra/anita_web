/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Src;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sevi
 */
@WebServlet(name = "send_using_email", urlPatterns = {"/send_using_email"})
public class send_using_email extends HttpServlet {

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
            HttpSession hs = request.getSession();
            POJOS.User user = (POJOS.User) hs.getAttribute("user");
            POJOS.Login login=(POJOS.Login) hs.getAttribute("login");
            double d = Math.random();
            int code = (int) (d * 1000000000);

            hs.setAttribute("mycode", code);
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
                    + "            <label style=\"color red;"
                    + "\">Click here to Continue - </label><a href=\"http://localhost:8080/anita_Web/send_email.jsp?code='"+code+"'\"><button class=\"btn btn-danger\" style=\"margin-left: 10px\"><span class=\"glyphicon glyphicon-ok\"></span> Continue</button></a>\n"
                    + "        </div>\n"
                    + "    </body>\n"
                    + "</html>";

            if (user == null) {
                out.write("Session Expired");
                response.sendRedirect("foget_password.jsp?session=912");
            } else {
                email.sendmail("cygnetic.info@gmail.com", "Sevindra1", "DEAR " + user.getFname() + content, new String[]{login.getEmail()}, "PASSWORD RESET ");
                //email.sendmail("cygnetic.info@gmail.com", "Sevindra1", "DEAR " + user.getFname() + ", Click to continue http://localhost:8080/anita_Web/send_email.jsp?code=" + code, new String[]{"sevindra@gmail.com"}, "PASSWORD RESET CODE");
                response.sendRedirect("send_email.jsp");
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
