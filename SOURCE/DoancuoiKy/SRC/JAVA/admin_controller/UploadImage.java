/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin_controller;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.MySqlDataAccessHelper;
import dao.productDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author FreeX
 */
@WebServlet(name = "UploadImage", urlPatterns = {"/UploadImage.do"})
public class UploadImage extends HttpServlet {
    private File tmpDir;
    //private static final String TMP_DIR_PATH = "c:\\tmp";
    //private static final String DESTINATION_DIR_PATH ="/files";
    private File destinationDir;
    String str=null;
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
        
        try {
            out.println("<br/>"+request.getParameter("textfield"));
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
        //out.println("<br/>"+request.getParameter("textfield"));
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    PrintWriter out = response.getWriter();
	    response.setContentType("text/plain");
	    //out.println("<h1>Servlet File Upload Example using Commons File Upload</h1>");
	    //out.println();
                HttpSession session = request.getSession();
		DiskFileItemFactory  fileItemFactory = new DiskFileItemFactory ();
		/*
		 *Set the size threshold, above which content will be stored on disk.
		 */
		fileItemFactory.setSizeThreshold(1*1024*1024); //1 MB
		/*
		 * Set the temporary directory to store the uploaded files of size above threshold.
		 */
		fileItemFactory.setRepository(tmpDir);
 
		ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);
		try {
			/*
			 * Parse the request
			 */
			List items = uploadHandler.parseRequest(request);
			Iterator itr = items.iterator();
			while(itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				/*
				 * Handle Form Fields.
				 */
                        if(item.isFormField()) {
                                out.println("File Name = "+item.getFieldName()+", Value = "+item.getString());
                        } else {
                                //Handle Uploaded files.
                                str = "Field Name = "+item.getFieldName()+
                                        ", File Name = "+item.getName()+
                                        ", Content type = "+item.getContentType()+
                                        ", File Size = "+item.getSize();
                                /*
                                 * Write file to the ultimate location.
                                 */
                                //File file=new File(getServletContext().getRealPath("") + "/a/a.exe");

                                //out.println(item.get);
                                
                                if(session.getAttribute("them") !=  null){
                                   // out.println((String)session.getAttribute("them"));

                                    int i1 = item.getName().indexOf('.');
                                    String s2 = item.getName().substring(i1);                                        
                                    String imgf = getServletContext().getRealPath("")+"\\img\\imgProduct\\"+
                                            (String)session.getAttribute("them") + s2;
                                    out.println(imgf);
                                    //productDAO.themSP2(imgf, (String)session.getAttribute("them"));
                                    
                                    try{
                                    //            MySqlDataAccessHelper help = new MySqlDataAccessHelper();
                                        
                                    MySqlDataAccessHelper helper = new MySqlDataAccessHelper();
                                    helper.open();
                                    //UPDATE  `shopcart`.`tbl_products` SET  `imgfile` =  'asd' WHERE  `tbl_products`.`id` =46;
                                    String sql = "UPDATE  `shopcart`.`tbl_products` SET  `imgfile` =  '"
                                            + "img/imgProduct/"
                                            + (String)session.getAttribute("them") + s2
                                            + "'"
                                            + " WHERE  `tbl_products`.`id` = "+(String)session.getAttribute("them");
                                    int i =helper.executeUpdate(sql);

                                    helper.close();
                                    }
                                    //UPDATE  `shopcart`.`tbl_products` SET  `imgfile` =  'img/imgProduct/29.jpg' WHERE  `tbl_products`.`id` =29;
                                    catch(Exception ex){
                                    System.out.print(ex);
                                    }


                                    out.println("<h1>chèn thành công</h1>");
                                    File file=new File(imgf);
                                    item.write(file);
                                }
                                
                        }

                                //out.println(str);
				out.close();
			}
                    //out.println(str);    
                    out.println("<br/>"+request.getParameter("textfield"));
                    
		}catch(FileUploadException ex) {
                    out.println(ex);
			log("Error encountered while parsing the request",ex);
		} catch(Exception ex) {
                    out.println(ex);
			log("Error encountered while uploading file",ex);
		}

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
