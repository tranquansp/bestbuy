<%-- 
    Document   : init
    Created on : Nov 10, 2011, 9:21:53 AM
    Author     : FreeX
--%>

<%@page import="pojo.att"%>
<%@page import="dao.categoryDAO"%>
<%@page import="pojo.category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <div style="margin-left: 18px;margin-bottom: 20px;">
        <%
        if(request.getParameter("act") != null){
        %>
        <h1 style="font-size: 23px;">Chèn Thành CÔng dòng sản phẩm tên là<%=session.getAttribute("tensp")%></h1><hr/>
        Thêm các thuộc tính :
        
        <%
        
            out.println("<form action='category_add.do' method='get'>");
            ArrayList<att> M = (ArrayList<att>)session.getAttribute("thuoctinh");
            for(int i=0;i<M.size();i++){
                    att a = new att();
                    a = M.get(i);
                    if(a.getValue() == null){
                        out.println("<input type='text' size='80' name='nameatt"+i+"' value=''><br/>Đơn vị");
                        out.println("<input type='text' size='30' name='unitatt"+i+"' value=''><br/>Kiểu thuộc tính");
                    }
                    if(a.getValue() != null){
                        out.println("<input type='text' size='80' name='nameatt"+i+"' value='"+a.getValue()+"'><br/>Đơn vị");
                        out.println("<input type='text' size='30' name='unitatt"+i+"' value='"+a.getUnit()+"'><br/>Kiểu thuộc tính");
                    }
                    if(a.getType().equals("Số nguyên")){
                    out.println("<select name='type"+i+"'>"
                            + "<option   selected='selected'>Số nguyên</option>");
                    out.println("<option>Số thập phân</option>");
                    out.println("<option>Số lớn</option>");
                    out.println("<option>Câu ngắn</option>");
                    out.println("<option>văn bản</option>");
                    out.println("</select><br/>");
                        
                    }
                    if(a.getType().equals("Số thập phân")){
                        out.println("<select name='type"+i+"'>"
                                + "<option   >Số nguyên</option>");
                        out.println("<option selected='selected'>Số thập phân</option>");
                        out.println("<option>Số lớn</option>");
                        out.println("<option>Câu ngắn</option>");
                        out.println("<option>văn bản</option>");
                        out.println("</select><br/>");
                    }
                    if(a.getType().equals("Số lớn")){
                        out.println("<select name='type"+i+"'>"
                                + "<option   >Số nguyên</option>");
                        out.println("<option '>Số thập phân</option>");
                        out.println("<option selected='selected'>Số lớn</option>");
                        out.println("<option>Câu ngắn</option>");
                        out.println("<option>văn bản</option>");
                        out.println("</select><br/>");
                    }     
                    if(a.getType().equals("Câu ngắn")){
                        out.println("<select name='type"+i+"'>"
                                + "<option   >Số nguyên</option>");
                        out.println("<option '>Số thập phân</option>");
                        out.println("<option >Số lớn</option>");
                        out.println("<option selected='selected'>Câu ngắn</option>");
                        out.println("<option>văn bản</option>");
                        out.println("</select><br/>");                    
                    }   
                    if(a.getType().equals("văn bản")){
                        out.println("<select name='type"+i+"'>"
                                + "<option   >Số nguyên</option>");
                        out.println("<option '>Số thập phân</option>");
                        out.println("<option >Số lớn</option>");
                        out.println("<option >Câu ngắn</option>");
                        out.println("<option selected='selected'>văn bản</option>");
                        out.println("</select><br/>");                       
                    }                       
                    //out.println("<input type='text' size='80' name='nameatt"+i+"' value='"+a.getValue()+"'>Kiểu thuộc tính");
            }
            out.println("<input type='text' size='80' name='nameatt"+M.size()+"' value=''><br/>Đơn vị");
            out.println("<input type='text' size='30' name='unitatt"+M.size()+"' value=''><br/>");
            
            out.println("Kiểu thuộc tính<select name='type"+M.size()+"'><option   selected='selected'>Số nguyên</option>");
            out.println("<option>Số thập phân</option>");
            out.println("<option>Số lớn</option>");
            out.println("<option>Câu ngắn</option>");
            out.println("<option>văn bản</option>");
            out.println("</select><br/>");
            out.println("<input type='submit' name='sm1' value='Thêm Thuộc tính'><hr/>");
            out.println("<input type='submit' name='sm' value='save'>");
            out.println("<a href='category_add.do?del=ss'>Hủy tất cả</a>");
            out.println("</form>");
        }
       else
{
%>
<form action='category_add.do' method="get">
            
Tên mục lục : <input type="text" name="ml" /><br/>
Thuộc Nhóm :
<select  name ='option'>
            <option disabled='disabled'>---SELECT---</option>
            <%
            ArrayList<category> ds = categoryDAO.laydsDanhMuc();
            for(int i = 0;i<ds.size();i++){
                category dmm = ds.get(i);
                int foo =dmm.getParents();
                int bar =dmm.getIds();
                //out.println(dm.getNames());
                if(foo == 0){
%>   
                    <option value='<%=dmm.getIds()%>'><%=dmm.getNames()%></option>
                    <%
                }
            }
           %>
            </select>
            <hr/>
    <input type="submit" name="submit" value="Chấp Nhận"/>
    
</form>
            <% } %>
    </div>
    </body>
</html>
