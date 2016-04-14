/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import javax.servlet.http.HttpSession;
import pojo.category;
import pojo.product;

/**
 *
 * @author FreeX
 */
@WebServlet(name = "Order", urlPatterns = {"/Order.do"})
public class Order extends HttpServlet {
    private ArrayList<product> dmsp;

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
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        ArrayList<category> dstmp = categoryDAO.laydsDanhMuc();
        String n = request.getParameter("name");
        String ad = request.getParameter("ad");
        String p = request.getParameter("phone");
        String e = request.getParameter("email");
        String a = request.getParameter("age");    
        String view = "index.jsp?name="+n+"&ad="+ad+"&phone="+p+"&email="+e+"&age="+a;
        ArrayList<product> dmsp = (ArrayList<product>)session.getAttribute("shopcart");
        ArrayList<Integer> sl = (ArrayList<Integer>)session.getAttribute("soluong");
        
        request.setAttribute("thumuc", dstmp);
        request.setAttribute("giohang", dmsp);
        request.setAttribute("sluong", sl);
        request.setAttribute("page", "Order");
        
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Order</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Order at " + request.getContextPath () + "</h1>");
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
