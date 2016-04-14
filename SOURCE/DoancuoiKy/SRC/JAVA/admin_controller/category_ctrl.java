/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin_controller;

import dao.attDAO;
import dao.categoryDAO;
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

/**
 *
 * @author FreeX
 */
@WebServlet(name = "category_ctrl", urlPatterns = {"/category_ctrl.do"})
public class category_ctrl extends HttpServlet {

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
        String view = "a/index.jsp";
        if(request.getParameter("act") != null){
            if(request.getParameter("act").equals("edit")){
                view = "a/index.jsp?act=update";
            }
            if(request.getParameter("act").equals("del")){
                categoryDAO.xoaDM(request.getParameter("id"));
                view = "a/index.jsp?act=del";
            }
            if(request.getParameter("act").equals("att")){
                ArrayList A = attDAO.layDSTT(request.getParameter("id"));
                request.setAttribute("dstt", A);
                category c = categoryDAO.layDanhMuc(request.getParameter("id"));
                request.setAttribute("dm", c);
                view = "a/index.jsp?act=att";
            }
        }
        if(request.getParameter("submit") != null){
            categoryDAO.capnhatDM(request.getParameter("idml"), request.getParameter("tenml"));
        }
        
        
        request.setAttribute("page", "Ctrl_Category");
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet category_ctrl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet category_ctrl at " + request.getContextPath () + "</h1>");
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
