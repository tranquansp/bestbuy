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
import javax.servlet.http.HttpSession;
import pojo.att;

/**
 *
 * @author FreeX
 */
@WebServlet(name = "category_add", urlPatterns = {"/category_add.do"})
public class category_add extends HttpServlet {

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
                if(request.getParameter("submit") != null){
                   int mdm = 0;
                   if(request.getParameter("ml") != null){
                   
                       if(request.getParameter("option") == null){
                           mdm = categoryDAO.themDM(request.getParameter("ml"),0);
                       }
                       else{
                           mdm = categoryDAO.themDM(request.getParameter("ml"),Integer.parseInt(request.getParameter("option")));
                           view = "a/index.jsp?act=next&moithem="+mdm;
                       }
                   }
                   session.setAttribute("tensp",request.getParameter("ml"));
                   session.setAttribute("loaisp", String.valueOf(mdm));
                   if(session.getAttribute("thuoctinh") == null){
                        ArrayList<att> M = new ArrayList<att>();
                        session.setAttribute("thuoctinh", M);
                    }
                   
                }
         
          
         if(request.getParameter("sm") != null){       
           String foo = (String)session.getAttribute("loaisp");    
           int bar = Integer.parseInt(foo);
        ArrayList<att> MA = (ArrayList<att>)session.getAttribute("thuoctinh");
                       
        String tt = String.valueOf(MA.size());
        String val = request.getParameter("nameatt"+tt);
        String unit = request.getParameter("unitatt"+tt);
        String typ = request.getParameter("type"+tt);
             att a1 = new att();
             a1.setType(typ);
             a1.setValue(val);
             a1.setUnit(unit);
             MA.add(a1);
            //out.println("tongcong là :"+(MA.size()+1));
            
           

            for(int i=0;i<MA.size();i++){
                att a = new att();
                a = MA.get(i);
                //out.println(a.getValue()+"---->"+a.getType());
                String typeins = null;
                    if(a.getType().equals("Số nguyên")){
                        typeins = "Integer";
                    }
                    if(a.getType().equals("Số thập phân")){
                        typeins = "Float";
                    }
                    if(a.getType().equals("Số lớn")){
                        typeins = "Double";
                    }     
                    if(a.getType().equals("Câu ngắn")){
                        typeins = "Varchar";
                    }   
                    if(a.getType().equals("văn bản")){
                        typeins = "Text";
                    }               
                attDAO.themTT(bar, typeins ,a.getValue(),a.getUnit()); 
            }
            
            
            if(session.getAttribute("thuoctinh") != null){
            session.removeAttribute("thuoctinh");
            }
            if(session.getAttribute("loaisp") != null){
            session.removeAttribute("loaisp");
            }
            if(session.getAttribute("tensp") != null){
            session.removeAttribute("tensp");
            }  
         }      
                
         if(request.getParameter("sm1") != null){
                if(session.getAttribute("thuoctinh") == null){
                    att a = new att();
                    a.setUnit(request.getParameter("unitatt0"));
                    a.setType(request.getParameter("nameatt0"));
                    a.setValue(request.getParameter("typeatt0"));
                    ArrayList<att> M = new ArrayList<att>();
                    M.add(a);
                    session.setAttribute("thuoctinh", M);
                }
                
            else{
                    
                    ArrayList<att> M = (ArrayList<att>)session.getAttribute("thuoctinh");
                    //out.println("trap1");
                    String tt = String.valueOf(M.size());
                    String val = request.getParameter("nameatt"+tt);
                    String typ = request.getParameter("type"+tt);
                    String unt = request.getParameter("unitatt"+tt);
                    //out.println("trap"+request.getParameter("nameatt"+tt));
                    
                    att a = new att();
                    a.setType(typ);
                    a.setValue(val);
                    a.setUnit(unt);
                    M.add(a);
                    session.removeAttribute("thuoctinh");
                    session.setAttribute("thuoctinh", M);
                }
                view = "a/index.jsp?act=next";
            }
         
         
        if(request.getParameter("del") != null){
            if(request.getParameter("del").equals("ss")){
                if(session.getAttribute("thuoctinh") != null){
                session.removeAttribute("thuoctinh");
                }
                if(session.getAttribute("loaisp") != null){
                session.removeAttribute("loaisp");
                }
                if(session.getAttribute("tensp") != null){
                session.removeAttribute("tensp");
                }        
                //view = "a/index.jsp";
                        //delss
            }                   
        }
       
        request.setAttribute("page", "Add_Category");
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
        try {
            /* TODO output your page here
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet category_add</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet category_add at " + request.getContextPath () + "</h1>");
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
