<%-- 
    Document   : baogia
    Created on : Nov 3, 2011, 1:58:27 PM
    Author     : FreeX
--%>

<%@page import="pojo.category"%>
<%@page import="pojo.category"%>
<%@page import="dao.categoryDAO"%>
<%@page import="pojo.product"%>
<%@page import="dao.productDAO"%>
<%@page import="dao.productDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="application/vnd.ms-excel" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

  <%
   ArrayList<category> DM =  categoryDAO.laydsDanhMucCon();
  
  for(int i=0;i<DM.size();i++){
      category c = new category();
      c = DM.get(i);
      String msp = String.valueOf(c.getIds());
      out.println(c.getNames()+"<br/>");
      %>
         <table width="446" height="221" border="1">
           
  <tr>
    <td>STT</td>
    <td>Mã Sản Phẩm</td>
    <td> Tên Sản Phẩm</td>
    <td><p>Giá Thành</p>
    </td>
  </tr>
        <%
      ArrayList<product> dmsp = productDAO.laydsSanPham(msp);
      
      for(int j=0;j<dmsp.size();j++){
          product p = new product();
          p = dmsp.get(j);
          %>
    <tr>
    <td><%=j%></td>
    <td><%=p.getIdp()%></td>
    <td><%=p.getNamep()%></td>
    <td><%=p.getPricep()%></td>
  </tr>
  <%
      }
  }
  %>

</table>
    </body>
</html>
