/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin_controller;

import dao.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author FreeX
 */
@WebServlet(name = "product_ctrl", urlPatterns = {"/product_ctrl.do"})
public class product_ctrl extends HttpServlet {

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
        
        if(request.getParameter("upprice") != null){
            productDAO.suagiaSP(request.getParameter("price"), request.getParameter("msp"));
            productDAO.themGia(request.getParameter("msp"), request.getParameter("price"));
            //INSERT INTO `shopcart`.`tbl_price_series` (`id`, `idp`, `price`) VALUES (NULL, '2', '3600000');
        }
        if(request.getParameter("submit") != null){
            String ten = request.getParameter("product_name");
            String gia = request.getParameter("price");
            String mieuta = request.getParameter("des");
            String chitiet = request.getParameter("content");
            String id = request.getParameter("masp");
            productDAO.suaSP(ten, gia, mieuta, chitiet, id);
        }
        if(request.getParameter("mis") != null){
            productDAO.luutruSP(request.getParameter("id"));
        }
        String view = "a/index.jsp?q=&search=+";
        request.setAttribute("page", "Ctrl_Product");
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet product_ctrl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet product_ctrl at " + request.getContextPath () + "</h1>");
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
