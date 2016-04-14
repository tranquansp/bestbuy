<%-- 
    Document   : SignUp_content
    Created on : Dec 8, 2011, 8:11:27 PM
    Author     : FreeX
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page language="java" import="captchas.CaptchasDotNet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// Construct the captchas object (Default Values)
  CaptchasDotNet captchas = new captchas.CaptchasDotNet(
  request.getSession(true),     // Ensure session
  "demo",                       // client
  "secret"                      // secret
  );
// Construct the captchas object (Extended example)
// CaptchasDotNet captchas = new captchas.CaptchasDotNet(
//  request.getSession(true),     // Ensure session
//  "demo",                       // client
//  "secret",                     // secret
//  "01",                         // alphabet
//  16,                           // letters
//  500,                          // width
//  80                            // height
//  );
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<p style="background:#c3c3c3;"><strong>Đăng Ký Tài Khoản Mới</strong></p><hr/>

<c:if test="${ketqua != null}">
    <c:out value="${ketqua}" />
</c:if> 
    

<c:if test="${param.act == 'insertok'}">
    Tạo tài khoản thành công.Chào mừng bạn đến với Website của Trần Quân
</c:if> 

<c:if test="${param.act != 'insertok'}">
    <c:if test="${param.act == 'fail'}">
    Kiểm tra lại....
</c:if>    
<form id='form1' name='form1' method='post' action="<%=response.encodeUrl("SignUp.do")%>" >
    <table style="text-align: left; width: 471px; height: 200px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr>
      <td style="width: 156px;">Tên</td>
      <td style="width: 295px;"><input type='text' name='name' id='textfield' /></td>
    </tr>
    <tr>
      <td style="width: 156px;">Password</td>
      <td style="width: 295px;"><input type='password' name='pass' id='textfield' /></td>
    </tr>
    <tr>
      <td style="width: 156px;">Re-type Password</td>
      <td style="width: 295px;"><input type='password' name='repass' id='textfield' /></td>
    </tr>
    <tr>
      <td style="width: 156px;">Fullname</td>
      <td style="width: 295px;"><input type='text' name='fullname' id='textfield' /></td>
    </tr>
    <tr>
      <td style="width: 156px;">Địa chỉ</td>
      <td style="width: 295px;"><input type='text' name='address' id='textfield' /></td>
    </tr>
    <tr>
      <td style="width: 156px;">Phone</td>
      <td style="width: 295px;"><input type='text' name='phone' id='textfield' /></td>
    </tr>
    <tr>
      <td style="width: 156px;">Email</td>
      <td style="width: 295px;"><input type='text' name='email' id='textfield' /></td>
    </tr>
  </tbody>
</table>
    <hr style="width:80%;margin-left: 2px;"/>
<table style="text-align: left; width: 469px; height: 194px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>

    <tr>
        <td>
          Nhập chữ trong hình:
        </td>
        <td>
          <input name="password" size="16" />
        </td>
      </tr>
      <tr>
        <td>
        </td>
        <td>
          <%-- 
           % it's possible to set a random in captchas.image("xyz"),
           % captchas.imageUrl("xyz") and captchas.audioUrl("xyz").
           % This is only needed at the first request
           --%>
          <%= captchas.image() %><br>
          <a href="<%= captchas.audioUrl() %>">Phonetic spelling (mp3)</a>
        </td>
      </tr>
      
      
      
    <tr>
      <td style="height: 54px; width: 153px;">Nhận email
từ BQT</td>
      <td style="height: 54px; width: 296px;">
      <input type="radio" name="group2" value="Beer">Chấp Nhận<br>
      <input type="radio" name="group2" value="Wine" checked> Không Chấp Nhận
      </td>
    </tr>
    <tr>
      <td style="height: 92px; width: 153px;">Nội Quy
website</td>
      <td style="height: 92px; width: 296px;"><textarea
 cols="28" rows="7" name="1s">
Trước khi liên hệ với chúng tôi về những nội dung liên quan đến luật pháp hay bản quyền, xin vui lòng hiểu những điều sau đây...

Chúng tôi không chứa BẤT KỲ phần mềm, nhạc, e-book hay bất kỳ sản phẩm không hợp pháp nào cả. Chúng tôi không chịu trách nhiệm cho những thứ mà bạn có thể download, bởi vì chúng tôi không có những cái này trên server và chúng tôi cũng không tạo ra chúng, và chúng tôi không ủng hộ việc vi phạm quyền tác giả và những thứ tương tự. Thực tế, chúng tôi chống lại việc này và khuyến khích người duyệt web mua bản chính thức của những software được đưa link ở website. chúng tôi cũng chống lại việc vi phạm bản quyền của P2P, hoàn toàn ủng hộ và giúp đỡ cho bất kỳ nhóm chống vi phạm bản quyền.

Chúng tôi là một diễn đàn mở cho phép mọi người có thể đăng tải bất kỳ cái gì họ muốn vào diễn đàn nhằm chia sẽ với người duyệt web khác. Cơ bản là họ tạo một bản sao từ những nội dung trên website khác. Administrators, Webmater and Moderators của chúng tôi xem xét, chỉnh sửa, xóa (nếu cần thiết) những bài đăng tải này càng sớm càng tốt. Thật là điều không tưởng nếu muốn xem xét, chỉnh sửa hoặc xóa tất cả những đăng tải. Do đó, bạn cần hiểu rằng tất cả những đăng tải ở website này diễn tả cái nhìn và quan điểm của tác giả, không phải Administrators, Webmaster hay Moderators (trừ những đăng tải của những người này) và do đó họ không chịu trách nhiệm cho những nội dung của trang này.

Ngoài ra chúng tôi đã đặt chế độ ẩn link với khách viếng thăm, như vậy có nghĩa chúng tôi không tuyên truyền, cổ xúy việc download các phần mềm không bản quyền, vi phạm quyền tác giả và những thứ tương tự.
              
          </textarea>
</td>
    </tr>
  </tbody>
</table>
    <hr style="width:80%;margin-left: 2px;"/>
  <input type='submit' name='button' id='button' value='Đăng Ký' />
</form>
</c:if> 
    

    </body>
</html>
