/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin_controller;
import dao.attDAO;
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
import pojo.att;

/**
 *
 * @author FreeX
 */
@WebServlet(name = "product_add", urlPatterns = {"/product_add.do"})
public class product_add extends HttpServlet {

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
        String view = "a/index.jsp";
        //product_name=&price=&keysearch=&option=5&des=&content=&submit=Dong+y
        if(request.getParameter("submit") != null){
        String ten = request.getParameter("product_name");
        double gia = Double.parseDouble(request.getParameter("price"));
        int search = Integer.parseInt(request.getParameter("keysearch"));
        int thumuc = Integer.parseInt(request.getParameter("option"));
         ArrayList<att> A = attDAO.layDSTT(request.getParameter("option"));
         request.setAttribute("dstt", A);
         
        String des = request.getParameter("des");
        String det = request.getParameter("content");
        int test = productDAO.themSP1(ten, thumuc, gia, des, det, search);
        //email
        //if(test == 1){
            int  h = test+22;
            h = h-22;
            request.setAttribute("sanpham",h);
            session.removeAttribute("them");
            session.setAttribute("them", String.valueOf(test));
            //productDAO.themSP2("img/imgProduct/+"+test+".jpg",test);
            view = "a/index.jsp?id="+test;
        //}
        //else{
          //  view = "a/index.jsp?act=fail";
        //}
        }
        if(request.getParameter("sub") != null){
        ArrayList<att> A = attDAO.layDSTT(request.getParameter("dm"));
            for(int i=0;i<A.size();i++){
                att at = new att();
                at = A.get(i);
                String msp = request.getParameter("msp");
                String m = request.getParameter(String.valueOf(at.getId()));
                //String test = "";
                
                if(at.getType().equals("Integer")){
                  //  type = "Integer";
                    attDAO.themint(String.valueOf(at.getId()),msp,m);
                    //tbl_att_int
                }
                if(at.getType().equals("Float")){
                    //type = "Integer";
                    attDAO.themfloat(String.valueOf(at.getId()),msp,m);
                    //tbl_att_float
                }
                if(at.getType().equals("Double")){
                    //type = "Integer";
                    attDAO.themdouble(String.valueOf(at.getId()),msp,m);
                    //tbl_att_double
                }
                if(at.getType().equals("Varchar")){
                    //type = "Integer";
                    attDAO.themvarchar(String.valueOf(at.getId()),msp,m);
                    //tbl_att_varchar
                }
                if(at.getType().equals("Text")){
                    attDAO.themtext(String.valueOf(at.getId()),msp,m);
                    //type = "Integer";
                    //tbl_att_varchar
                }
            }
        }
        
        request.setAttribute("page", "Add_Product");
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet product_add</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet product_add at " + request.getContextPath () + "</h1>");
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
