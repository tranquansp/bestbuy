<%-- 
    Document   : Detail_content
    Created on : Dec 8, 2011, 3:51:44 PM
    Author     : FreeX
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p style="text-align: center;background: #c3c3c3;height: 30px;padding-top: 4px;font-size: 18px;color:blueviolet;"><c:out value="${chitiet.getNamep()}"/></p>
         <form id='form1' name='form1' method='get' action='ShopCart.do'>       
        <table style="text-align: left; width: 520px; height: 200px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr>
      <td colspan="2" rowspan="1" style="width: 179px;"></td>
    </tr>
    <tr>
      <td colspan="1" rowspan="2" style="width: 179px;"><img src='<c:out value="${chitiet.getImgfilep()}"/>'  height='200' width='250' /></td>
      <td style="width: 321px;"><c:out value="${chitiet.getDescp()}"/></td>
    </tr>
    <tr>
      <td style="width: 321px;">Giá : <fmt:formatNumber type="number" value="${chitiet.getPricep()}" maxFractionDigits="2"          
         minFractionDigits="2"/><br/>
          Lượt xem:
      <c:out value="${chitiet.getViewp()}"/>
      <br/>
      Số hàng còn trong kho :
      <c:out value="${chitiet.getStorep()}"/>
      <hr/>
      <img src="https://chart.googleapis.com/chart?cht=bvg&amp;chs=250x220&amp;chd=t:<c:out value="${chitiet.getPricep()}"/><c:forEach var="row" items="${dothi}">|<c:out value="${row.getPrice()}" escapeXml="false"/></c:forEach>&amp;chds=FF0000,20&amp;chco=4d89f9,c6d9fd,00B88A&amp;chds=0,<c:out value="${chitiet.getPricep()*1.4}"/>&amp;chbh=a&amp;chxs=0,000000,0,0,_&amp;chxt=y&amp;chm=N,000000,0,,10|N,000000,1,,10|N,000000,2,,10|N,000000,3,,10|N,000000,4,,10&chtt=Biểu Đồ Giá&chxl=Jan|Feb|Mar|Apr|May" alt="Grouped chart">
      </td>
    </tr>
    <tr>
        <td colspan="2" rowspan="1" style="width: 179px;"><hr/><c:out value="${chitiet.getDetailp()}" escapeXml="false"/></td>
    </tr>
    <tr>
    </tr>
    <tr>
    </tr>
    <tr>
    </tr>
  </tbody>
</table>
    <hr/>
  Chi tiết tính năng :
  <table style="text-align: left; width: 591px; height: 60px;"
 border="0" cellpadding="2" cellspacing="2">
        
  <tbody>
      <c:forEach var="row" items="${thuoctinh}" >
    <tr style="border: 1px solid #898980;background: #c3c3c3;">
      <td style="width: 190px;"><c:out value="${row.getName()}" /></td>
      <td><c:out value="${row.getDetail()}" escapeXml="false"/>&nbsp;&nbsp;
      <c:out value="${row.getUnit()}" />
      </td>
    </tr>
      </c:forEach>
  </tbody>
</table>

<input type='hidden' name='msp' id='hiddenField' value='<c:out value="${chitiet.getIdp()}"/>'/>
<div class="form_search"> 
<input name='search' type='submit' value=' ' class='btnp'/>  
</div>
</form>
                
<br />
    </body>
</html>
