<%-- 
    Document   : init
    Created on : Nov 10, 2011, 9:21:53 AM
    Author     : FreeX
--%>

<%@page import="pojo.att"%>
<%@page import="pojo.category"%>
<%@page import="dao.categoryDAO"%>
<%@page import="dao.categoryDAO"%>
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
ArrayList<category> ds = categoryDAO.laydsDanhMuc();
    if(request.getParameter("act") != null){
        if(request.getParameter("act").equals("update")){
            int m = Integer.parseInt(request.getParameter("id"));
            String tendm="";
            for(int i = 0;i<ds.size();i++){
                category c = new category();
               if(m == c.getIds()){
                   tendm = c.getNames();
                   break;
               } 
            }
    %>
        <form action='category_ctrl.do' method="get">
            Tên mục lục : <input type="text" name="tenml" value<%="='"+request.getParameter("name")+"'" %>/><br/>
            <input type="hidden" name="idml" value<%="='"+request.getParameter("id")+"'" %> />
            <hr/>
    <input type="submit" name="submit" value="Chấp Nhận"/>
    
</form>
            
    <%
       }
       if(request.getParameter("act").equals("att")){
           category ct = (category)request.getAttribute("dm");
           
       %>
        Đây là thuộc tính của danh mục <%=ct.getNames()%><hr/>
        <table style="text-align: left; width: 664px; height: 60px;"
 border="1" cellpadding="2" cellspacing="2">
  <tbody>
    <tr style="background: #09C;">
      <td style="width: 58px;">STT</td>
      <td style="width: 120px;">Tên thuộc tính</td>
      <td style="width: 226px;">Đơn vị</td>
      <td style="width: 125px;">Loại thuộc tính</td>
      <td style="width: 91px;">Tùy chọn</td>
    </tr>


        <%
           ArrayList<att> AT = (ArrayList<att>)request.getAttribute("dstt");
           for(int i=0;i<AT.size();i++){
           att a = new att();
           a= AT.get(i);
           a.getId();
            %>
                <tr style="background: #c3c3c3;">
                  <td style="width: 58px;"><%=i%></td>
                  <td style="width: 120px;"><%=a.getValue() %></td>
                  <td style="width: 226px;"><%=a.getUnit()%></td>
                  <td style="width: 125px;"><%=a.getType()%></td>
                  <td style="width: 91px;">Ẩn Sửa</td>
                </tr>
            <%
           }
           %>
    </tbody>
    </table>
                <%
       }
    }
   else{
%>
            
                        
<table style="text-align: left; width: 510px; height: 88px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr style="border:1px solid #8B4513;font-weight: bold;">
      <td style="width: 55px; border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;color:blue;">STT</td>
      <td style="width: 267px; border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;color:blue;">Chuyên
Mục</td>
      <td style="text-align: center;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;color:blue;">Tùy Chọn</td>
    </tr>
    

<%

            //code here
            int h = 0;
            for(int i = 0;i<ds.size();i++){
                category dm = ds.get(i);
                int foo =dm.getParents();
                int bar =dm.getIds();
                //out.println(dm.getNames());
                if(foo == 0){
                    %>
                   <tr style="border:1px solid #8B4513;color:#696969;font-weight: bold;">
                    <td style="width: 55px;border:1px solid #c3c3c3;background:#c3c3c3;"><%=++h%></td>
                    <td style="width: 267px;border:1px solid #c3c3c3;background:#c3c3c3;"><%=dm.getNames()%></td>
                    <td style="border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;">
                        <a <%="href='category_ctrl.do?act=edit&id="+dm.getIds()+"&name="+dm.getNames()+"'"%>>
                            [Sửa]</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           </td>
                   </tr>
                    <%
                    for(int j = 0;j<ds.size();j++){
                        category dmt = ds.get(j);
                        if(dmt.getParents() == bar){
                            %>
                          <tr style="border:1px solid #8B4513;color:#696969;font-weight: bold;">
                            <td style="width: 55px;border:1px solid #c3c3c3;background:#c3c3c3;"><%=++h%></td>
                            <td style="width: 267px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;"><%=dmt.getNames()%></td>
                            <td style="border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;">
                                <a <%="href='category_ctrl.do?act=edit&id="+dmt.getIds()+"&name="+dmt.getNames()+"'"%>>
                                    [Sửa]</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a <%="href='category_ctrl.do?act=del&id="+dmt.getIds()+"&name="+dmt.getNames()+"'"%>>
                                    [Xóa]</a><br/>
                            <a <%="href='category_ctrl.do?act=att&id="+dmt.getIds()+"'"%>>
                                    [Xem thuộc tính]</a>
                            </td>
                           </tr>
                    
                            <%
                        }
                    }
                    out.println();
                }

            }
    %>

  </tbody>
</table>
                
<%

   }        

%>
    
  </div>  
    </body>
</html>
