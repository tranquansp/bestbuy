<%-- 
    Document   : init
    Created on : Nov 10, 2011, 8:40:04 PM
    Author     : FreeX
--%>

<%@page import="pojo.user"%>
<%@page import="dao.userDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<div style="margin-left: 18px;margin-bottom: 20px;background: #c3c3c3;margin-right: 20px;padding-left: 23px;">
    <br/><br/>
    <p style="background: #808080;margin-right: 20px;height: 26px;font-size: 16px;padding-top: 5px;text-align: center;">Danh Sách User:</p>
    <hr style="margin-left: 2px;width: 94%;"/><br/>

    <%
if(request.getParameter("act")!= null){
    if(request.getParameter("act").equals("edit")){
        ArrayList<user> AU= userDAO.layDSUser();
        user foo = new user();
        for(int i=0;i<AU.size();i++){
            user u = new user();
            u = AU.get(i);
            if(u.getIdu() == Integer.parseInt(request.getParameter("id"))){
                foo = AU.get(i);
                break;
            }
        }
    %>
        <form action="user_ctrl.do" method="get"> 
            Tên:<br/>
            <input type="text" name="ten" value=<%="'"+foo.getNameu()+"'"%>/><br/>
            Điện Thoại:<br/>
            <input type="text" name="dienthoai" value=<%="'"+foo.getPhoneu()+"'"%> /><br/>
            Địa chỉ:<br/>
            <input type="text" name="diachi" value=<%="'"+foo.getAddressu()+"'"%> />
            <input type="hidden" name="mauser" value=<%="'"+foo.getIdu()+"'"%> /><br/>
            <input type="submit" name="submit" value="cập nhật" />
        </form>
            <hr/>
    <%
    }
}
    else{

}
%>
<table style="text-align: left; width: 850px; height: 60px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr>
      <td style="width: 190px; text-align: center;border: 1px solid #D2B48C;background: #D2B48C;"><strong>Tên</strong></td>
      <td style="width: 137px; text-align: center;border: 1px solid #D2B48C;background: #D2B48C;"><strong>Địa Chỉ</strong></td>
      <td style="width: 102px; text-align: center;border: 1px solid #D2B48C;background: #D2B48C;"><strong>Phone</strong></td>
      <td style="width: 106px; text-align: center;border: 1px solid #D2B48C;background: #D2B48C;"><strong>Option</strong></td>
    </tr>
    
<%
ArrayList<user> AU= userDAO.layDSUser();
//out.println(AU.size());
for(int i=0;i<AU.size();i++){
    user usr = new user();
    usr = AU.get(i);
    //usr.getIdu();
%>

    <tr>
      <td style="width: 190px;text-align: center;border-left: 1px solid #CD853F;border-bottom:  1px solid #CD853F;"><%= usr.getNameu() %></td>
      <td style="width: 137px;text-align: center;border-left: 1px solid #CD853F;border-bottom:  1px solid #CD853F;"><%= usr.getAddressu() %></td>
      <td style="width: 102px;text-align: center;border-left: 1px solid #CD853F;border-bottom:  1px solid #CD853F;"><%= usr.getPhoneu() %></td>
      <td style="width: 106px;text-align: center;border-left: 1px solid #CD853F;border-bottom:  1px solid #CD853F;border-right: 1px solid #CD853F;">
          <a <%= "href='user_ctrl.do?act=edit&id="+usr.getIdu()+"'"%>>[Sửa]</a>&nbsp;&nbsp;&nbsp;<a <%= "href='user_ctrl.do?act=del&id="+usr.getIdu()+"'"%>>[xóa]</a></td>
    </tr>


<%
}

%>
  </tbody>
</table>
  <br/>
  <br/>
    </div>
    </body>
</html>
