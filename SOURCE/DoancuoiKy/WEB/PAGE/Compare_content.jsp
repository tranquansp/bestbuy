<%-- 
    Document   : Compare_content
    Created on : Dec 8, 2011, 3:51:31 PM
    Author     : FreeX
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        

<h1 style="font-size:15px;color:#09C;">So sánh Sản Phẩm:</h1>

<div class="show_data">
  <table width="610">
    <tr class="titleC">
      <td>Tổng Quan</td>
      <td style="width: 200px;"><c:out value="${sp1.getNamep()}" />
      </td>
      
      <td style="width: 200px;" ><c:out value="${sp2.getNamep()}" />

      </td>
      <td style="width: 200px;"><c:out value="${sp3.getNamep()}" />
      </td>
    </tr>
    
    <tr>
      <td rowspan="2">&nbsp;</td>
      <td>
          <c:if test="${sp1.getIdp() != null}" >
              <form action='ShopCart.do'>  
              <input type='hidden' name='msp' id='hiddenField' value='<c:out value="${sp1.getIdp()}"/>'/>
            <div class="form_search"> 
            <input name='search' type='submit' value=' ' class='btnp'/>  
            </div>
        </form>
          </c:if>

      </td>
      <td>
          <c:if test="${sp2.getIdp() != null}" >
              <form action='ShopCart.do'>  
              <input type='hidden' name='msp' id='hiddenField' value='<c:out value="${sp2.getIdp()}"/>'/>
            <div class="form_search"> 
            <input name='search' type='submit' value=' ' class='btnp'/>  
            </div>
        </form>
          </c:if>
          
      </td>
      <td>
          <c:if test="${sp3.getIdp() != null}" >
              <form action='ShopCart.do'>  
              <input type='hidden' name='msp' id='hiddenField' value='<c:out value="${sp3.getIdp()}"/>'/>
            <div class="form_search"> 
            <input name='search' type='submit' value=' ' class='btnp'/>  
            </div>
        </form>
          </c:if>
          
      </td>
    </tr>

    <tr>
      <td style="text-align:right;">
          <c:if test="${sp1.getIdp() != null}" >
              <img src='<c:out value="${sp1.getImgfilep()}"/>'  height='125' width='100' />
          </c:if>
      </td>
      <td style="text-align:right;">
          <c:if test="${sp2.getIdp() != null}" >
              <img src='<c:out value="${sp2.getImgfilep()}"/>'  height='125' width='100' />
          </c:if>

      </td>
      <td style="text-align:right;">
          <c:if test="${sp3.getIdp() != null}" >
              <img src='<c:out value="${sp3.getImgfilep()}"/>'  height='125' width='100' />
          </c:if>

      </td>
    </tr>
  </table>

</div>
<br/>

<div class="show_data">
  <table width="610">
    <tr class="titleC">
      <td>Thuộc tính</td>
      <td><c:out value="${sp1.getNamep()}" /></td>
      <td><c:out value="${sp2.getNamep()}" /></td>
      <td><c:out value="${sp3.getNamep()}" /></td>
    </tr>
    
    <tr>
      <td style="color:blue;">Giá cả</td>
      <td style="width:200px;"><fmt:formatNumber type="number" value="${sp1.getPricep()}" maxFractionDigits="2"          
         minFractionDigits="2"/></td>
      <td style="width:200px;"><fmt:formatNumber type="number" value="${sp2.getPricep()}" maxFractionDigits="2"          
         minFractionDigits="2"/></td>
      <td style="width:200px;"><fmt:formatNumber type="number" value="${sp3.getPricep()}" maxFractionDigits="2"          
         minFractionDigits="2"/></td>
    </tr>
    <tr>
      <td style="color:blue;">Miêu tả</td>
      <td><c:out value="${sp1.getDescp()}"/></td>
      <td><c:out value="${sp2.getDescp()}"/></td>
      <td><c:out value="${sp3.getDescp()}"/></td>
    </tr>
    
    <tr>
      <td style="color:blue;">Chi tiết</td>
      <td><c:out value="${sp1.getDetailp()}" escapeXml="false"/></td>
      <td><c:out value="${sp2.getDetailp()}" escapeXml="false"/></td>
      <td><c:out value="${sp3.getDetailp()}" escapeXml="false"/></td>
    </tr>
    
    <tr >
      <td style="color:blue;">Mức độ tín nhiệm</td>
      <td>
          <c:if test="${sp1.getSttp() == 'Yes'}" >
              <c:out value="Tín Nhiệm Cao"/>
          </c:if>
          <c:if test="${sp1.getSttp() == 'No'}" >
              <c:out value="Tín Nhiệm Thấp"/>>
          </c:if>
          <c:if test="${sp1.getSttp() == 'Medium'}" >
              <c:out value="Tín Nhiệm Trung Bình"/>
          </c:if>
      </td>
          
      <td>
          <c:if test="${sp2.getSttp() == 'Yes'}" >
              <c:out value="Tín Nhiệm Cao"/>
          </c:if>
          <c:if test="${sp2.getSttp() == 'No'}" >
              <c:out value="Tín Nhiệm Cao"/>>
          </c:if>
          <c:if test="${sp2.getSttp() == 'Medium'}" >
              <c:out value="Tín Nhiệm Cao"/>
          </c:if>
      </td>
      
      <td>
          <c:if test="${sp3.getSttp() == 'Yes'}" >
              <c:out value="Tín Nhiệm Cao"/>
          </c:if>
          <c:if test="${sp3.getSttp() == 'No'}" >
              <c:out value="Tín Nhiệm Thấp"/>>
          </c:if>
          <c:if test="${sp3.getSttp() == 'Medium'}" >
              <c:out value="Tín Nhiệm Trung Bình"/>
          </c:if>
      </td>
      
    </tr>
    
    <tr>
      <td style="color:blue;">Lượt Xem</td>
      <td><c:out value="${sp1.getViewp()}"/></td>
      <td><c:out value="${sp2.getViewp()}"/></td>
      <td><c:out value="${sp3.getViewp()}"/></td>
    </tr>
    
    <tr>
      <td style="color:blue;">Số hàng trong kho</td>
      <td><c:out value="${sp1.getStorep()}"/></td>
      <td><c:out value="${sp2.getStorep()}"/></td>
      <td><c:out value="${sp3.getStorep()}"/></td>
    </tr>

  <c:forEach var="i" begin="0" end="${dodai}" step="1"  >
    <tr style="background: #F0F8FF;">
  <c:set var="foo" value="0"/>
      <c:forEach var="row" items="${thuoctinh1}" >
          <c:if test="${foo == i}" >
          <td>
              <c:out value="${row.getName()}" />(<c:out value="${row.getUnit()}" />)
          </td>
          </c:if>
          <c:set var="foo" value="${foo+1}"/>
      </c:forEach>
        <c:set var="foo" value="0"/>
      <c:forEach var="row" items="${thuoctinh1}" >
          <c:if test="${foo == i}" >
          <td>
              <c:out value="${row.getDetail()}" escapeXml="false"/>
          </td>
          </c:if>
          <c:set var="foo" value="${foo+1}"/>
      </c:forEach>
      <c:set var="foo" value="0"/>
        <td>  
          <c:forEach var="row" items="${thuoctinh2}" >
          <c:if test="${foo == i}" >
          
              <c:out value="${row.getDetail()}" escapeXml="false"/>
          
          </c:if>
          <c:set var="foo" value="${foo+1}"/>
      </c:forEach>
          </td>
          <td>
      <c:set var="foo" value="0"/>
          <c:forEach var="row" items="${thuoctinh3}" >
          <c:if test="${foo == i}" >
          
              <c:out value="${row.getDetail()}" escapeXml="false"/>
          
          </c:if>
          <c:set var="foo" value="${foo+1}"/>
      </c:forEach>
          </td>
    </tr>
  
</c:forEach> 
    
  </table>

</div>

    
</body>
</html>
