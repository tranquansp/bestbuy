/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DetailDAO;
import dao.categoryDAO;
import dao.customerDAO;
import dao.productDAO;
import dao.shopcartDAO;
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
@WebServlet(name = "Finish", urlPatterns = {"/Finish.do"})
public class Finish extends HttpServlet {

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
        
        String name,age,phone,address,dongia,currentTime;
    int test =0;
    int idd = 0;
    ArrayList<Integer> sl = new ArrayList<Integer>();
    ArrayList<product> dmsp = new ArrayList<product>();
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        
        if(request.getParameter("buy") != null){
            test = 1;
            name = request.getParameter("name");
            age = request.getParameter("age");
            phone = request.getParameter("phone");
            address = request.getParameter("address");
            dongia = request.getParameter("total");
            
            java.util.Date dt = new java.util.Date();
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
            currentTime = sdf.format(dt);
        
        
        //them vao tbl_customer name,age,phone,address => tra ve id vua insert(idc)
        
        int idc = customerDAO.themKH(name, age, address, phone);
        
        //test = idc;
        //them vao tbl_order currenTime,idc,currentTime => tra ve id vua insert(ido)
        
        int ido = shopcartDAO.themHD(idc, currentTime);
            dmsp = (ArrayList<product>)session.getAttribute("shopcart");
            sl = (ArrayList<Integer>)session.getAttribute("soluong");
            double total = 0;
            
            for(int i=0;i<dmsp.size();++i){
                product pr = new product();
                pr = dmsp.get(i);
                int foo = pr.getIdp();
                double bar = pr.getPricep();
                int soluong = sl.get(i);
                //out.println(i);
                total = bar * soluong;
                idd = DetailDAO.themCT(foo, ido, soluong, total);
                productDAO.giamSP(foo, soluong);
                //UPDATE  `shopcart`.`tbl_products` SET  `store` =  `store` - 2 WHERE  `tbl_products`.`id` =2;
            }
            
        //them vao tbl_order_detail masanpham,maorder,soluong,dongia
        session.removeAttribute("shopcart");
        session.removeAttribute("soluong");
        
        if(idd == 0){
                view = "index.jsp?ord=fail";
            }
        else{ 
            view = "index.jsp?ord=suc&mhd="+ido;
        }
                
        }
        
        ArrayList<category> dstmp = categoryDAO.laydsDanhMuc();
        //ido
        request.setAttribute("thumuc", dstmp);
        request.setAttribute("page", "Finish");
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Finish</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Finish at " + request.getContextPath () + "</h1>");
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
