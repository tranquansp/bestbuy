<%-- 
    Document   : Finish_content
    Created on : Dec 8, 2011, 3:51:56 PM
    Author     : FreeX
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${param.ord eq 'suc'}">
            Bạn đã mua hàng thành công !!!!<br/>
            Mã hóa đơn của bạn là :<br/>
            <c:out value="${param.mhd}"/>
        </c:if>
        <c:if test="${ord eq 'fail'}">
            Bạn đã mua hàng thất bại.Vui Lòng thử lại !!!!
        </c:if>    

    </body>
</html>
