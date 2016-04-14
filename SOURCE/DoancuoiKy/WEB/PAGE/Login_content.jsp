<%-- 
    Document   : Login_content
    Created on : Dec 8, 2011, 3:52:10 PM
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
        
        <p style="background:#c3c3c3;"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Đăng Nhập</strong></p><hr/>
<c:if test="${param.act eq 'fail'}">
<h5 style="color:red;">&nbsp;&nbsp;&nbsp;&nbsp;Sai password hoặc username !!</h5><hr/>
</c:if>                     
<form id='form1' name='form1' method='post' action='Login.do'>
<table style="text-align: left; width: 454px; height: 93px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr>
      <td style="width: 116px;">&nbsp;&nbsp;&nbsp;&nbsp;User Name</td>
      <td style="width: 302px;"><input type='text' name='textfield' id='textfield' /></td>
    </tr>
    <tr>
      <td style="width: 116px;">&nbsp;&nbsp;&nbsp;&nbsp;Pass Word</td>
      <td style="width: 302px;"><input type='password' name='textfield2' id='textfield2' /></td>
    </tr>
  </tbody>
</table>

&nbsp;&nbsp;&nbsp;<input type='submit' name='button' id='button' value='Đăng Nhập' />


</form>  

<hr/>

        
        
    </body>
</html>
