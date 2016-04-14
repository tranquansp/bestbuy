<%-- 
    Document   : Header
    Created on : Oct 22, 2011, 3:46:01 PM
    Author     : Nguyễn Hoàng Anh - nhanh@fit.hcmus.edu.vn
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="header">
    <div id="leftH">
<ul>
<li><a href="Intro.do">Trang Chủ</a>
</li>
<li><a href="">Sản Phẩm</a>
</li>
<li><a href="">Dịch Vụ</a>
</li>
<li><a href="BaoGia.do">Báo Giá</a>
</li>
<li><a href="">Liên Hệ</a>
</li>
<li><a href="History.do">Lịch Sử Mua Hàng</a>
</li>
<li>


</li>
</ul>
</div>
<br/>    
<c:if test="${sessionScope.userID != null}">
    Xin Chào &nbsp;<c:out value="${sessionScope.userName}" />
    <a href="Logout.do" style="text-decoration: none;">Thoát</a>
</c:if>  
<c:if test="${sessionScope.userID == null}">
        <a href="SignUp.do" style="text-decoration: none"><strong style="text-decoration: none;font-size: 16;">Đăng ký&nbsp;&nbsp;</strong></a>   
<a href="Login.do" style="text-decoration: none"><strong style="text-decoration: none;font-size: 16;">Đăng nhập&nbsp;</strong></a>

</c:if> 
&nbsp;&nbsp;&nbsp;

</div>