/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import pojo.category;
import pojo.product;

/**
 *
 * @author FreeX
 */
@WebServlet(name = "Intro", urlPatterns = {"/Intro.do"})
public class Intro extends HttpServlet {

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
        if(session.getAttribute("shopcart") == null){
            ArrayList<product> dmsp = new ArrayList<product>();
            session.setAttribute("shopcart",dmsp);
        }
        ArrayList<category> dstmp = categoryDAO.laydsDanhMuc();
        if(request.getParameter("id") == null ){
            if(request.getParameter("q") == null ){
                ArrayList<product> showAll = new ArrayList<product>();
                showAll = productDAO.layAll();
                request.setAttribute("showAll", showAll);
               view="index.jsp?act=view"; 
            }
        }
        ArrayList<product> show = new ArrayList<product>();
        
        int tempage = 0;// = Integer.parseInt(request.getParameter("page"));  
        int tempageN = 5;// = Integer.parseInt(request.getParameter("pageNav"));
        if(request.getParameter("page") != null){
            tempage = Integer.parseInt(request.getParameter("page")); 
        }
        if(request.getParameter("pageNav") != null){
            tempageN = Integer.parseInt(request.getParameter("pageNav"));
        }

        String ids = request.getParameter("id");
        String q = request.getParameter("q");
        String o = request.getParameter("option");
            String phantrang=null;
            // show danh sach san pham
                
           if(request.getParameter("search") != null){

               if(request.getParameter("option") == null){
                   //request.getParameter("minPrice")
                   //request.getParameter("maxPrice")
                   show = productDAO.timKiemRong(request.getParameter("q"));
                   phantrang = "Intro.do?search=+&q="+request.getParameter("q");
               }
               else{
                   double min = Double.parseDouble(request.getParameter("minPrice"));
                   double max = Double.parseDouble(request.getParameter("maxPrice"));
                   show = productDAO.timKiemSau(request.getParameter("q"),request.getParameter("option"),min,max);
                   phantrang = "Intro.do?search=+&q="+request.getParameter("q")+"&option="+request.getParameter("option");
               }
           }
           else{
           if(ids != null){
               //String oder = "";
               /*
                String typ = "";
  
                if(request.getParameter("type").equals("1")){
                    typ = " order by price asc";
                }
                if(request.getParameter("type").equals("2")){
                    typ = " order by price desc";
                }
                if(request.getParameter("type").equals("3")){
                    typ = " order by store asc";
                }
                if(request.getParameter("type").equals("4")){
                    typ = " order by name asc";
                }
                if(request.getParameter("type").equals("5")){
                    typ = " order by name desc";
                }
                if(request.getParameter("type").equals("6")){
                     typ = " order by view asc";
                }
                */
               show = productDAO.laydsSanPham(ids);
                phantrang = "Intro.do?id="+ids;
           }
           }
        
        request.setAttribute("thumuc", dstmp);
        request.setAttribute("sanpham", show);
        request.setAttribute("soluong", show.size());
        request.setAttribute("trang", tempage);
        request.setAttribute("sotrang", tempageN);
        request.setAttribute("phtrang", phantrang);
        //request.setAttribute("thumuc", "haha");
        request.setAttribute("page", "Intro");
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
        
        try {
            
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
