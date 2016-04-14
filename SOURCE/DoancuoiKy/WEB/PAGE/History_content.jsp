<%-- 
    Document   : History_content
    Created on : Dec 9, 2011, 11:05:56 PM
    Author     : FreeX
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
<body>

<p style="text-align: center;background: #c3c3c3;height: 30px;padding-top: 4px;font-size: 18px;color:blueviolet;">Lịch Sử Mua Hàng</p>    
Nhập số Hóa Đơn của bạn : !!<br />
<form id='form1' name='form1' method='get' action='History.do'>
<input type='text' name='mshd' id='textfield' />
<input type='submit' name='button' id='button' value='OK' />
</form>
<hr/>
<p style="text-align: center;background: #c3c3c3;height: 30px;padding-top: 4px;font-size: 18px;color:blueviolet;">Thông Tin</p>
<c:set var="flag" value="0"/>
<c:if test="${param.act != null}">
        <c:forEach var="row" items="${hoadon}">
            <c:if test="${flag == 0}">
                Thông tin hóa đơn số :
                 <c:out value="${row.getMaHD()}"/>
                 <c:set var="flag" value="1"/>
                 
                 <table style="text-align: left; width: 612px; height: 144px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr>
      <td style="width: 165px;">Tên Khách Hàng</td>
      <td style="width: 409px;"><c:out value="${row.getTenKH()}"/></td>
    </tr>

    <tr>
      <td style="width: 165px;">Tuổi</td>
      <td style="width: 409px;"><c:out value="${row.getAgeKH()}"/></td>
    </tr>
    <tr>
      <td style="width: 165px;">Địa Chỉ Ship Hàng</td>
      <td style="width: 409px;"><c:out value="${row.getDiachiKH()}"/></td>
    </tr>
    <tr>
      <td style="width: 165px;">Số Điện Thoại</td>
      <td style="width: 409px;"><c:out value="${row.getDtKH()}"/></td>
    </tr>
    <tr>
      <td style="width: 165px;">Email</td>
      <td style="width: 409px;">abc@gmail.com</td>
    </tr>
  </tbody>
</table>

             </c:if>
        </c:forEach> 
</c:if>  
<hr/>

<c:set var="tongcong" value="0"/>            
<c:if test="${param.act != null}">
    <table style="text-align: left; width: 612px; height: 88px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr style="border:1px solid #c3c3c3;color:#696969;font-weight: bold;">
      <td style="width: 145px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;">Tên</td>
      <td style="width: 136px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;">Giá</td>
      <td style="width: 95px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;">Số Lượng</td>
      <td style="width: 187px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;">Tổng giá</td>
    </tr>

        <c:forEach var="row" items="${hoadon}">
            <tr style="border:1px solid #c3c3c3;color:#696969;font-weight: bold;">
                <td style="border:1px solid #c3c3c3;text-align:center;"><c:out value="${row.getTenSP()}"/><br/></td>
                <td style="border:1px solid #c3c3c3;text-align:center;">
                 <fmt:formatNumber type="number" value="${row.getGiaSP()}" maxFractionDigits="2" minFractionDigits="2"/>
                &nbsp;&nbsp;&nbsp;VND</td>
                <td style="border:1px solid #c3c3c3;text-align:center;"> <c:out value="${row.getSoluong()}"/><br/></td>
                <td style="border:1px solid #c3c3c3;text-align:center;"> 
                    <fmt:formatNumber type="number" value="${row.getDongia()}" maxFractionDigits="2" minFractionDigits="2"/>&nbsp;&nbsp;&nbsp;VND
                </td>
               <c:set var="tongcong" value="${tongcong + row.getDongia()}"/> 
            </tr>
        </c:forEach> 
    <tr>
      <td colspan="4" rowspan="1" style="width: 145px;border:1px solid #c3c3c3;background:#c3c3c3;text-align:center;">Tổng
Cộng&nbsp;&nbsp;&nbsp;<fmt:formatNumber type="number" value="${tongcong}" maxFractionDigits="2" minFractionDigits="2"/>&nbsp;&nbsp;&nbsp;VND  </td>
    </tr>
  </tbody>
</table>
</c:if>  
             
                
                

    <br/>
    <hr/>

</body>
</html>
