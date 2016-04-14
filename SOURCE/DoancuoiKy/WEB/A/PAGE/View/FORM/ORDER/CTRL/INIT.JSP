<%-- 
    Document   : init
    Created on : Nov 10, 2011, 8:38:55 PM
    Author     : FreeX
--%>

<%@page import="pojo.OrderDetail"%>
<%@page import="dao.shopcartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
  <div style="background: #c3c3c3;margin-left: 15px;color: blue;width: 94%;padding-left: 12px;margin-bottom: 16px;">
    <br/>
      <p style="background: #fff;color:#800080;height:28px;padding-top: 4px;">
          <a href="order_ctrl.do?act=viewall">Xem Toàn bộ Hóa Đơn</a><span style="float:right;">
          <a href="order_ctrl.do?act=wait">Xem các hóa đơn chưa thanh toán</span></p>
        <%
               ArrayList<String> HD2 = (ArrayList<String>)(request.getAttribute("xemhd"));
                       //shopcartDAO.LayHd();
                for(int i2=0;i2<HD2.size();i2++){
                    String O2 ;
                    O2 =  HD2.get(i2);
                  out.println("<div style='margin-left:30px;'><br/>");  
                ArrayList<OrderDetail> HD = shopcartDAO.xemHoaDon(O2);
                
                OrderDetail O = new OrderDetail();
                if(HD.size() != 0){
                    O = HD.get(0);
                    
                    out.println("<p style='background:#FFFFE0;width:95%;color:red;padding-top:4px;text-align:center;"
                            + "font-size:14px;'><span style='float:left;'>Ngày đặt hàng:"
                            +O.getNgaydathang()+"</span>Mã Hóa Đơn:"+O2+""
                            + "<h4 style='float:right;font-size:12px;margin-right:47px;'>&nbsp;&nbsp;<a href='order_ctrl.do?act=del&id="+O.getMaHD()+"'>[Đưa Vào Lưu Trữ]</a></h4></p>");
                //OrderDetail O = new OrderDetail();
                %>
        
      <table style="text-align: left; width: 615px; height: 96px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr>
      <td style="width: 142px;">Tên Khách Hàng</td>
      <td style="width: 453px;color:#800080;"><%= O.getTenKH()%></td>
    </tr>
    <tr>
      <td style="width: 142px;">Tuổi</td>
      <td style="width: 453px;color:#800080;"><%= O.getAgeKH()%></td>
    </tr>
    <tr>
      <td style="width: 142px;">Địa Chỉ</td>
      <td style="width: 453px;color:#800080;"><%= O.getDiachiKH()%></td>
    </tr>
    <tr>
      <td style="width: 142px;">Phone</td>
      <td style="width: 453px;color:#800080;"><%= O.getDtKH()%></td>
    </tr>
  </tbody>
</table>
                <%

                out.println ("<table width='549' border='0'>");
                out.println ("  <tr style='background:#778899'>");
                out.println ("    <td width='112' style='background:#778899;color:#8B4513;'><strong>Tên Sản Phẩm</strong></td>");
                out.println ("    <td width='84' style='background:#778899;color:#8B4513;'><strong>Giá Hiện Tại</strong></td>");
                out.println ("    <td width='137' style='background:#778899;color:#8B4513;'><strong>Số Lượng</strong></td>");
                out.println ("    <td width='188' style='background:#778899;color:#8B4513;'><strong>Đơn Giá(thời điểm mua)</strong></td>");
                out.println ("  </tr>");
                //int test = 0;
                for(int i=0;i<HD.size();i++){
                  //  test = 1;
                    O = HD.get(i);
                    out.println ("  <tr>");
                    out.println ("    <td>"+O.getTenSP()+"</td>");
                    out.println ("    <td>"+O.getGiaSP()+"</td>");
                    out.println ("    <td>"+O.getSoluong()+"</td>");
                    out.println ("    <td>"+O.getDongia()+"</td>");
                    out.println ("  </tr>");
                }
                out.println ("</table><hr style='margin-left:4px;width:94%;'/>");
               
                }
                
               out.println("</div>");  
      }             
%>

</div>
    </body>
</html>
