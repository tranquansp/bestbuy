/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.attDAO;
import dao.categoryDAO;
import dao.productDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.attDetail;
import pojo.category;
import pojo.price;
import pojo.product;

/**
 *
 * @author FreeX
 */
@WebServlet(name = "Detail", urlPatterns = {"/Detail.do"})
public class Detail extends HttpServlet {

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
        product sp = null;
        String ids = request.getParameter("msp");
        if(ids != null){
            //out.println("Chi tiet ve san pham : ");
            //product sp = productDAO.laySanPham(ids);
            sp = productDAO.laySanPham(ids);
            productDAO.themluotview(ids); 

            ArrayList<attDetail> AD = attDAO.getDint(ids);
            request.setAttribute("thuoctinh", AD);
            
            //attDetail a = AD.get(1);
            
            ArrayList<price> Ap = productDAO.layDothi(ids);
            request.setAttribute("dothi", Ap);
        }

        ArrayList<category> dstmp = categoryDAO.laydsDanhMuc();
        request.setAttribute("thumuc", dstmp);
        request.setAttribute("chitiet", sp);
        
        request.setAttribute("page", "Detail");
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Detail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Detail at " + request.getContextPath () + "</h1>");
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
