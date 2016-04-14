<%-- 
    Document   : Left
    Created on : Oct 22, 2011, 3:46:09 PM
    Author     :  Nguyễn Hoàng Anh - nhanh@fit.hcmus.edu.vn
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="sidewrap">
<div id="side">

    
    <div class="sidebox" id="sideshopcart">
<h2 class="flip2">Thông tin mua hàng</h2>

<div class="pad">
<div class="panel2" id = "emo">




<table style="text-align: left; width: 225px; height: 40px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr>
      <td style="width: 36px; height: 28px;"><img src="img/1.png" height="20"/></td>
      <td style="width: 169px; height: 28px;"><a style="text-decoration: none;" href="ShopCart.do">Giỏ Hàng Của Bạn</a></td>
    </tr>
  </tbody>
</table>
<table style="text-align: left; width: 225px; height: 32px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr>
      <td style="width: 36px; height: 28px;"><img src="img/2.png" height="20"/></td>
      <td style="width: 169px; height: 28px;">Đăng ký thông tin mua hàng</td>
    </tr>
  </tbody>
</table>
    
        <table style="text-align: left; width: 225px; height: 32px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr>
      <td style="width: 36px; height: 28px;"><img src="img/3.png" height="20"/></td>
      <td style="width: 169px; height: 28px;">Xác nhận đơn hàng</td>
    </tr>
  </tbody>
</table>

</div>
</div>
</div>
    
<div class="sidebox" id="newcomments">
<h2 class="flip2">Danh Mục</h2>
<div class="pad">
<c:forEach var="row" items="${thumuc}"> 
     <c:if test="${row.getParents() == 0}">
         <p style='background:#808080;font-size: 16px; height: 22px;border:2px solid #000000;text-align: center;'><c:out value="${row.getNames()}"/></p>
        <c:forEach var="cell" items="${thumuc}"> 
            <c:if test="${cell.getParents()==row.getIds()}">
               <p style="background:#C0C0C0; height: 27px;padding-top: 8px;border-left: 1px solid #778899;border-bottom: 1px solid #778899;border-right: 1px solid #778899;text-align: center;"><a style="text-decoration:none;color: #5F0009;" href='Intro.do?id=<c:out value="${cell.getIds()}"/>'><span><c:out value="${cell.getNames()}"/></span></a></p>
            </c:if>
        </c:forEach>
          <hr/>
     </c:if>  
</c:forEach>
</div>
</div>

    
<div class="sidebox" id="newcomments">
<img src="img/khieunai.png" />
</div>
    
    
<div class="sidebox" id="newcomments">
<h2 class="flip1">Tìm kiếm nâng cao</h2>

<div class="pad">

<div class="panel5">
<div class="form_search"> 
<form id="form1" name="form1" method="get" action="Intro.do">
<p>Danh mục : </p>
Tên :
<input type="text" name="q" id="textfield" />
<br/>
<select  name ='option'>
<c:forEach var="row" items="${thumuc}"> 
     <c:if test="${row.getParents() == 0}">
                <option value='<c:out value="${row.getIds()}"/>' disabled='disabled'><c:out value="${row.getNames()}"/></option>
        <c:forEach var="cell" items="${thumuc}"> 
            <c:if test="${cell.getParents()==row.getIds()}">
               <option value='<c:out value="${cell.getIds()}"/>' selected="selected" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${cell.getNames()}"/></option>
            </c:if>
        </c:forEach>
          <hr/>
     </c:if>  
  </c:forEach> 
</select>
<br/>
Giá từ :
<select  name ='minPrice'>
    <option value="500000">500 000 VND</option>
    <option value="1000000">1 000 000 VND</option>
    <option value="5000000">5 000 000 VND</option>
    <option value="10000000">10 000 000 VND</option>
    <option value="20000000">20 000 000 VND</option>
</select>
<br/>Đến :
<select  name ='maxPrice'>
    <option value="1000000">1 000 000 VND</option>
    <option value="5000000">5 000 000 VND</option>
    <option value="10000000">10 000 000 VND</option>
    <option value="20000000">20 000 000 VND</option>
    <option value="50000000">50 000 000 VND</option>
</select>
<br/>
<input name="search" type="submit" id="pollsubmit" value=" " class="btn"/>  
<br/>
</form>
</div>
</div> 
<div class="clear"></div>
</div>
</div>

</div>
</div>