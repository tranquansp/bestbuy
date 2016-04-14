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
import javax.servlet.http.HttpSession;
import pojo.category;
import pojo.user;

/**
 *
 * @author FreeX
 */
@WebServlet(name = "Login", urlPatterns = {"/Login.do"})
public class Login extends HttpServlet {

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
        HttpSession session = request.getSession();
        String pos="Login";
            if(session.getAttribute("userID") != null){
                String view = "index.jsp"; 
                pos = "Intro";
            }
             
            String view = "index.jsp?act=view";          
            String idu = request.getParameter("textfield");
            String nameu = request.getParameter("textfield2");
            if(idu != null && nameu != null){
            //out.println(userDAO.checkUser(idu, nameu));
            
            
            if(userDAO.checkUser(idu, nameu) == true){
                //out.println(idu+"_______---------"+nameu+"<br/>");
                user usr = userDAO.layUser(idu,nameu);

                session.setAttribute("userID", usr.getIdu());
                session.setAttribute("userName", usr.getNameu());
                view = "index.jsp?act=view";
                pos = "Intro";
                //response.setStatus(response.SC_MOVED_TEMPORARILY);
                //response.sendRedirect("Intro.do");
                
            }
            else{
                view = "index.jsp?act=fail";
                pos = "Login";
            }
          //  out.println("sai username hoặc pass");
            }

                //String view = "index.jsp?act=fail";
                ArrayList<category> dstmp = categoryDAO.laydsDanhMuc();
                request.setAttribute("thumuc", dstmp);
                request.setAttribute("page", pos);
                RequestDispatcher rd = request.getRequestDispatcher(view);
                rd.forward(request, response);

        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath () + "</h1>");
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
