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
import javax.servlet.http.HttpSession;
import pojo.attDetail;
import pojo.category;
import pojo.price;
import pojo.product;

/**
 *
 * @author FreeX
 */
@WebServlet(name = "Compare", urlPatterns = {"/Compare.do"})
public class Compare extends HttpServlet {

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
        HttpSession session = request.getSession();
        session.removeAttribute("ss");
        ArrayList<category> dstmp = categoryDAO.laydsDanhMuc();
        if(request.getParameter("0") != null ){
            String msp1 = request.getParameter("0").trim();
            product sp1 = new product();
             sp1 = productDAO.laySanPham(msp1);
             //sp1.getNamep()
             request.setAttribute("sp1", sp1);
             ArrayList<attDetail> AD = attDAO.getDint(msp1);
            request.setAttribute("thuoctinh1", AD);
            request.setAttribute("dodai", AD.size());
            
        }
        
        if(request.getParameter("1") != null ){
            String msp2 = request.getParameter("1").trim();
            product sp2 = new product();
             sp2 = productDAO.laySanPham(msp2);
             request.setAttribute("sp2", sp2);
            ArrayList<attDetail> AD = attDAO.getDint(msp2);
            request.setAttribute("thuoctinh2", AD);
            
             
        }
                
        if(request.getParameter("2") != null ){
            String msp3 = request.getParameter("2").trim();
            product sp3 = new product();
             sp3 = productDAO.laySanPham(msp3);
             request.setAttribute("sp3", sp3);
             ArrayList<attDetail> AD = attDAO.getDint(msp3);
            request.setAttribute("thuoctinh3", AD);
            
        }
        
        request.setAttribute("thumuc", dstmp);
        request.setAttribute("page", "Compare");
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Sosanh</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Sosanh at " + request.getContextPath () + "</h1>");
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
