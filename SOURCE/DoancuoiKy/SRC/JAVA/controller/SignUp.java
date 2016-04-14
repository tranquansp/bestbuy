/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.categoryDAO;
import dao.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.category;
import captchas.CaptchasDotNet;
/**
 *
 * @author FreeX
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp.do"})
public class SignUp extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String view = "index.jsp";
        if(request.getParameter("button") != null){
            
         CaptchasDotNet captchas = new captchas.CaptchasDotNet(
          request.getSession(true),     // Ensure session
          "demo",                       // client
          "secret"                      // secret
          );
        // Read the form values
        String password = request.getParameter("password");

// Check captcha
        String body="";
        switch (captchas.check(password)) {
          case 's':
            body = "Session seems to be timed out or broken. ";
            body += "Please try again or report error to administrator.";
            break;
          case 'm':
            body = "Every CAPTCHA can only be used once. ";
            body += "The current CAPTCHA has already been used. ";
            body += "Please use back button and reload";
            break;
          case 'w':
            body = "You entered the wrong password. ";
            body += "Please use back button and try again. ";
            break;
          default:
               if(request.getParameter("name") != null && request.getParameter("email") != null
                        && request.getParameter("pass") != null && request.getParameter("address") != null
                        )
                {
                    boolean test = userDAO.themUser(request.getParameter("name"), request.getParameter("pass"), request.getParameter("email"), request.getParameter("fullname"), request.getParameter("address"), request.getParameter("phone"));
                    if(test == true){
                        view= "index.jsp?act=insertok";
                    }
                    else{
                        view= "index.jsp?act=insertfail";
                    }
                }
                else{
                    view= "index.jsp?act=insertfail";
                }  
            //body = "OK";
            break;
        }
        request.setAttribute("ketqua", body);
        // Check captcha
        /*
        String body;
        if(captchas.check(password) == 's'){
            view= "index.jsp?act=capt1";
        }
        if(captchas.check(password) == 'm'){
            view= "index.jsp?act=capt2";
        }
        if(captchas.check(password) == 'w'){
            view= "index.jsp?a=capt3";
        }
        if(captchas.check(password) == '*'){
                if(request.getParameter("name") != null && request.getParameter("email") != null
                        && request.getParameter("pass") != null && request.getParameter("address") != null
                        )
                {
                    boolean test = userDAO.themUser(request.getParameter("name"), request.getParameter("pass"), request.getParameter("email"), request.getParameter("fullname"), request.getParameter("address"), request.getParameter("phone"));
                    if(test == true){
                        view= "index.jsp?act=insertok";
                    }
                    else{
                        view= "index.jsp?act=insertfail";
                    }
                }
                else{
                    view= "index.jsp?act=insertfail";
                }  
        }
        
        else{
                view= "index.jsp?act=capt";
            }      
        }
        
        */
        
        }
        request.setAttribute("page", "SignUp");
       ArrayList<category> dstmp = categoryDAO.laydsDanhMuc();
        request.setAttribute("thumuc", dstmp);
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SignUp</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignUp at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
             */
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
