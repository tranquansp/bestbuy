<%-- 
    Document   : Order_content
    Created on : Dec 8, 2011, 3:52:36 PM
    Author     : FreeX
--%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>JSP Page</title>
    </head>
    <body>
<form id='form1' name='form1' method='get' action='Finish.do'>

            <p style='text-align: center;background: #c3c3c3;height: 30px;padding-top: 4px;font-size: 18px;color:blueviolet;'>Thông Tin Khách Hàng</p>
            <table style='text-align: left; width: 603px; height: 144px;' border="0" cellpadding='2' cellspacing='2'>
            <tbody>
            <tr>
            <td style='width: 165px;'>Tên Khách Hàng</td>
            <td style='width: 409px;'>
            <c:out value="${param.name}" />    
            </td>
            </tr>
            <tr>
            <td style='width: 165px;'>Tuổi</td>
            <td style='width: 409px;'><c:out value="${param.age}" /></td>
            </tr>
            <tr>
            <td style='width: 165px;'>Địa Chỉ Ship Hàng</td>
            <td style='width: 409px;' ><c:out value="${param.ad}" /></td>
            </tr>
            <tr>
            <td style='width: 165px;'>Số Điện Thoại</td>
            <td style='width: 409px;'><c:out value="${param.phone}" /></td>
            </tr>
            <tr>
            <td style='width: 165px;'>Email</td>
            <td style='width: 409px;'><c:out value="${param.email}" /></td>
            </tr>
            </tbody>
            </table>

            <hr/>
        
            <input type='hidden' name='name' id='hiddenField' value='<c:out value="${param.name}" />'/>
            <input type='hidden' name='age' id='hiddenField' value='<c:out value="${param.age}" />'/>
            <input type='hidden' name='address' id='hiddenField' value='<c:out value="${param.ad}" />'/>
            <input type='hidden' name='email' id='hiddenField' value='<c:out value="${param.phone}" />'/>
            <input type='hidden' name='phone' id='hiddenField' value='<c:out value="${param.email}" />'/>
            <p style='text-align: center;background: #c3c3c3;height: 30px;padding-top: 4px;font-size: 18px;color:blueviolet;'>Thông Tin Giỏ Hàng</p>
             <table style='text-align: left; width: 600px; height: 88px;' border='0' cellpadding='2' cellspacing='2'>
            <tbody>
            <tr style='border:1px solid #c3c3c3;color:#696969;font-weight: bold;'>
                <td  style='width: 37px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;'>Stt</td>
            <td  style='width: 335px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;'>Tên Sản Phẩm</td>
            <td style='width: 182px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;'>Giá</td>
            <td style='width: 80px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;'>Số Lượng</td>
            </tr>
            <c:set var="tongtien" value="0" />
            <c:forEach var="i" begin="0" end="${size}" step="1"  >
                <tr style="border:1px solid #c3c3c3;font-weight:bold;">  
                  <c:set var="giatien" value="0" />
                <c:set var="foo" value="0"/>
                <c:set var="bar" value="0"/>
                  <c:forEach var="row" items="${giohang}" >
                      <c:if test="${foo == i}" >
                          <td style='width: 37px;border:1px solid #c3c3c3;'><c:out value="${i+1}" /></td>  
                          <td style='width: 285px;border:1px solid #c3c3c3;'><c:out value="${row.getNamep()}" /></td>
                          <td style='width: 285px;border:1px solid #c3c3c3;'>
                          <fmt:formatNumber type="number" value="${row.getPricep()}" maxFractionDigits="2" minFractionDigits="2"/>
                          &nbsp;VND</td>
                          <c:set var="giatien" value="${row.getPricep()}" />
                          <c:set var="bar" value="${row.getIdp()}" />
                      </c:if>
                      <c:set var="foo" value="${foo+1}"/>
                  </c:forEach>
                    <c:set var="foo" value="0"/>
                  <c:forEach var="row" items="${sluong}" >
                      <c:if test="${foo == i}" >
                          <td style='width: 80px;border:1px solid #c3c3c3;'>
                              <c:out value="${row}"/>
                              </td>
                          <c:set var="tongtien" value="${tongtien + giatien * row}" />
                      </c:if>
                      <c:set var="foo" value="${foo+1}"/>
                  </c:forEach>
                  <tr/>
                  
            </c:forEach>
            <tr><td colspan="5" rowspan="1" style='width: 285px;border:1px solid #c3c3c3;background: #F0F8FF;'>
                    Tổng cộng :
                    <fmt:formatNumber type="number" value="${tongtien}" maxFractionDigits="2" minFractionDigits="2"/>
                          &nbsp;VND</td><tr/>
            <input type='hidden' name='total' id='hiddenField' value="<c:out value="${tongtien}" />"/>
             </tbody>
             </table>   
           <input type='submit' name='buy' id='SUBMIT' /> 
</form>
</body>
</html>
