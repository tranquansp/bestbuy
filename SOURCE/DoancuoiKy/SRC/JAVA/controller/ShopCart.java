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
@WebServlet(name = "ShopCart", urlPatterns = {"/ShopCart.do"})
public class ShopCart extends HttpServlet {

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
        String msp = request.getParameter("msp");
        String view = "index.jsp?act=sc&msp="+msp;
        //soluong0=2&sachthu=0&tongcong=1&submit2=Update        
        HttpSession session = request.getSession();
        
        
        if(request.getParameter("submitdel") != null){
            session.removeAttribute("shopcart");
            session.removeAttribute("soluong");
        }
        //delp
        if(request.getParameter("act") != null){
            if(request.getParameter("act").equals("delp")){
            
            ArrayList<product> dmsp = (ArrayList<product>)session.getAttribute("shopcart");
            ArrayList<Integer> qr = new ArrayList<Integer>();
            qr = (ArrayList<Integer>)session.getAttribute("soluong");
            int transf = Integer.parseInt(request.getParameter("id"));
            
            dmsp.remove(transf);
            qr.remove(transf);
            
            session.removeAttribute("shopcart");
            session.removeAttribute("soluong");
            
            session.setAttribute("shopcart", dmsp);
            session.setAttribute("soluong", qr);
            
            }
        }
        
        if(session.getAttribute("shopcart") == null){
            ArrayList<product> dmsp = new ArrayList<product>();
            session.setAttribute("shopcart",dmsp);
        }
        String sp = null;
        int test = -1;
        int test1 = -1;
        //if(request.getParameter("submit") != null){
        if(request.getParameter("msp") != null){
            sp = request.getParameter("msp");
        }
        sp = request.getParameter("msp");
        //}
        ArrayList<Integer> sl = new ArrayList<Integer>();
                
        sl.clear();
        ArrayList<product> dmsp = (ArrayList<product>)session.getAttribute("shopcart");
        if(sp != null){
            int flag =0;
            int next = Integer.parseInt(sp);
            for(int foo=0;foo<dmsp.size();foo++){
                product q = new product();
                q = dmsp.get(foo);
                int bar = q.getIdp();
                if(bar == next){// kiem tra trung san pham hay khong
                    //test1 = 99;
                    ArrayList<Integer> qr = new ArrayList<Integer>();
                    qr = (ArrayList<Integer>)session.getAttribute("soluong");
                    //test = bar1;
                    int m = qr.get(foo);
                    qr.set(foo, m+1);
                    //test1 = m;
                    session.removeAttribute("soluong");
                    session.setAttribute("soluong", qr);
                    flag = 1;
                }
            }
            if(flag == 0){
                product p = productDAO.laySanPham(sp);
                dmsp.add(p);

                session.removeAttribute("shopcart");
                session.setAttribute("shopcart",dmsp );
                if(session.getAttribute("soluong") == null){
                    ArrayList<Integer> qr = new ArrayList<Integer>();
                //test = bar1;
                    qr.add(1);
                    session.removeAttribute("soluong");
                    session.setAttribute("soluong", qr);
                }
                else{
                    ArrayList<Integer> qr = new ArrayList<Integer>();
                    qr = (ArrayList<Integer>)session.getAttribute("soluong");
                    //test = bar1;
                    qr.add(1);
                    session.removeAttribute("soluong");
                    session.setAttribute("soluong", qr);
                }

            }
        }
        
        if(request.getParameter("submit2") != null){
            int foo = Integer.parseInt(request.getParameter("tongcong"));
            for(int bar =0;bar < foo;bar ++){
                
                //int foo2 = Integer.parseInt(request.getParameter("soluong"));
                //.add(foo2);
                String foo1 = "soluong" + bar;
                int foo2 = Integer.parseInt(request.getParameter(foo1));
                product pd = new product();
                pd = dmsp.get(bar);
                
                if(foo2 > 10 ){
                      foo2 = 10;
                }
                if(foo2 > pd.getStorep() ){
                      foo2 = pd.getStorep();
                }
                
                sl.add(foo2);
                test = sl.size();
                session.removeAttribute("soluong");
                session.setAttribute("soluong", sl);
            }
        }
        else{
            if(request.getParameter("tongcong") != null){
                test = sl.size();
                
                int foo1 = Integer.parseInt(request.getParameter("tongcong"));
                for(int bar1 =0;bar1<foo1;bar1++){
                    String rm = "remove" + bar1;
                    if(request.getParameter(rm) != null){
                        ArrayList<Integer> qr = new ArrayList<Integer>();
                        qr = (ArrayList<Integer>)session.getAttribute("soluong");
                        //test = bar1;
                        dmsp.remove(bar1);
                        
                        qr.remove(bar1);//qr.get(bar1);
                        session.removeAttribute("soluong");
                        session.setAttribute("soluong", qr);
                        
                    }
                }
            }
        }
        
        if(request.getParameter("submit3") != null){
            view = "index.jsp?act=order";
        }

        ArrayList<category> dstmp = categoryDAO.laydsDanhMuc();
        if(dmsp.size() > 0){
            ArrayList<Integer> tmp = (ArrayList<Integer>)session.getAttribute("soluong");
            request.setAttribute("sluong", tmp);
        }
        request.setAttribute("thumuc", dstmp);
        request.setAttribute("giohang", dmsp);
        request.setAttribute("size", dmsp.size());
        //dmsp
        request.setAttribute("page", "ShopCart");
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShopCart</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopCart at " + request.getContextPath () + "</h1>");
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
