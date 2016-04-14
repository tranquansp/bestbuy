<%-- 
    Document   : ShopCart_content
    Created on : Dec 8, 2011, 3:53:33 PM
    Author     : FreeX
--%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.productDAO"%>
<%@page import="pojo.product"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

<c:forEach var="row" items="${sessionScope.soluong}">
</c:forEach>
<c:forEach var="cell" items="${sessionScope.giohang}">
</c:forEach>

<br/>
<div class='content'>
    <c:if test="${param.act != null }">
        <c:if test="${param.act == 'order' }">
            
          
              <p style="text-align: center;background: #c3c3c3;height: 30px;padding-top: 4px;font-size: 18px;color:blueviolet;">Đặt Hàng</p>
            <form id='form1' name='form1' method='get' action='Order.do'><br/>
            <table style="text-align: left; width: 603px; height: 144px;"
            border="0" cellpadding="2" cellspacing="2">
            <tbody>
            <tr>
            <td style="width: 165px;">Tên Khách Hàng</td>
            <td style="width: 409px;"><input type='text' name='name' id='textfield' size="50"/></td>
            </tr>
            <tr>
            <td style="width: 165px;">Tuổi</td>
            <td style="width: 409px;"><input type='text' name='age' id='textfield' size="50"/></td>
            </tr>
            <tr>
            <td style="width: 165px;">Địa Chỉ Ship Hàng</td>
            <td style="width: 409px;"><input type='text' name='ad' id='textfield' size="50"/></td>
            </tr>
            <tr>
            <td style="width: 165px;">Số Điện Thoại</td>
            <td style="width: 409px;"><input type='text' name='phone' id='textfield' size="50"/></td>
            </tr>
            <tr>
            <td style="width: 165px;">Email</td>
            <td style="width: 409px;"><input type='text' name='email' id='textfield' size="50"/></td>
            </tr>
            </tbody>
            </table>
                <hr/>
            <input type='submit' name='buy' id='SUBMIT' /> 
            </form>
</c:if>
</c:if>

<c:if test="${param.act != null }">
        <c:if test="${param.act != 'order' }">
        <h1 style='margin-left: 10px;'>Giỏ Hàng Của Bạn</h1>
        <form id='form1' name='form1' method='get' action='ShopCart.do'>
             <table style='text-align: left; width: 600px; height: 88px;' border='0' cellpadding='2' cellspacing='2'>
            <tbody>
            <tr style='border:1px solid #c3c3c3;color:#696969;font-weight: bold;'>
                <td  style='width: 37px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;'>Stt</td>
            <td  style='width: 335px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;'>Tên Sản Phẩm</td>
            <td style='width: 182px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;'>Giá</td>
            <td style='width: 124px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;'>Số Lượng</td>
            <td style='width: 50px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;'>Hủy</td>
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
                          <td style='width: 285px;border:1px solid #c3c3c3;'>
                              <input type='text' name='<c:out value="soluong${i}"/>' id='textfield' value = '<c:out value="${row}"/>'/>
                              </td>
                              <td style='padding-top:6px;text-align: center;width: 50px;border:1px solid #c3c3c3;'>
                                  <a  href="ShopCart.do?act=delp&id=<c:out value="${i}" />"><img src="img/icon_delete.gif"/></a>
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
             </tbody>
             </table>    
             <input type='hidden' name='tongcong' id='hiddenField' value='<c:out value="${size}" />'/>
             <br/>
                  <input type='submit' name='submit2' id='button' value='Update' />
                  <hr/>
                  <input type='submit' name='submitdel' id='button' value='Hủy tất cả' />
                  
                  
                <input type='submit' name='submit3' id='button' value='Finish' />
                </form>
</c:if>
</c:if>
<br />
</div>
</body>
</html>
