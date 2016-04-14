<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="pojo.category"%>
<%@page import="dao.categoryDAO"%>
<%@page import="dao.productDAO"%>
<%@page import="pojo.product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<script>
            var flag = true;
         function resetIndex(selObj) {
            if(flag) selObj.selectedIndex = -1;
            flag = true;
           }
            function doSomething(selObj) {
            <%
            String q = request.getParameter("q");
            String o = request.getParameter("option");
            if(request.getParameter("id") != null){
                out.println ("    window.location = 'product_ctrl.do?id="+request.getParameter("id")+"&pageNav='+selObj.value;");
            }
            else{
                if(q != null){
                if( o == null){
                    out.println ("    window.location = 'product_ctrl.do?search=+&q="+q+"&pageNav='+selObj.value;");
                }
                else out.println ("    window.location = 'product_ctrl.do?search=+&q="+q+"&option="+o+"&pageNav='+selObj.value;");
            }
            }
            %>
            //else out.println ("    window.location = 'product_ctrl.do");
            flag = false;
            }
</script>
            <div style="background: #c3c3c3;margin-left: 15px;color: blue;width: 94%;padding-left: 12px;margin-bottom: 16px;">
<%
if(request.getParameter("edit") != null){
        NumberFormat formatter = new DecimalFormat("#0.00");
        double foo = Double.parseDouble(request.getParameter("price"))  ;               
%>
<form action="product_ctrl.do">
    Giá cũ:<%= formatter.format(foo) %>
    <br/>
    Giá mới : <input type="text" name="price" />
    <input type="hidden" name="msp" value="<%=request.getParameter("id")%>"/>
    <input type="submit" name="upprice" value="Cập nhật giá" />
</form>
<%    
}
if(request.getParameter("act") != null){
    
      product pr = productDAO.laySanPham(request.getParameter("id"));

%>

<form method="get"  enctype="multipart/form-data" action="product_ctrl.do">
<div class="form_data">
    <div class="product">
        <div>
            Product name: <input type="text" name="product_name" value=<%="'"+pr.getNamep()+"'"%>/>
        </div>
        <div>
            Price: <input disabled="disabled" type="text" name="price" value=<%="'"+pr.getPricep()+"'"%> />
        </div>
    </div>
<div class="product">    
    Description:<textarea name="des" rows="5" class='des'><%=pr.getDescp()%></textarea>
</div>
<div class="product">
   Content:<textarea name="content" id="content"><%=pr.getDetailp()%></textarea>
</div>
<input type="hidden" name="masp" value=<%="'"+pr.getIdp()+"'"%> />
<div class="product">

<div class="news btn">
    <input type="submit" value="Cập Nhật" name="submit" class="btn"/>
</div>
</div>
</div>
</form>
<%
}
else{
%>
            
  
<%
int tempage = 0;// = Integer.parseInt(request.getParameter("page"));                    
int tempageN = 5;// = Integer.parseInt(request.getParameter("pageNav"));
if(request.getParameter("page") != null){
    tempage = Integer.parseInt(request.getParameter("page")); ;
}
if(request.getParameter("pageNav") != null){
    tempageN = Integer.parseInt(request.getParameter("pageNav"));;
}

String ids = request.getParameter("id");

out.println ("<div class='content'>");
        %>
<br/>
        <p style="background: #808080;margin-right: 20px;height: 26px;font-size: 16px;padding-top: 5px;text-align: right;">           
      <%    
            out.println("Hiển thị bao nhiêu sản phẩm 1 trang :");
            if(request.getParameter("pageNav") == null){
                out.println ("<select onchange='doSomething(this)' onclick='resetIndex(this)'>");
                out.println ("<option value='5'>5</option>");
                out.println ("<option value='10'>10</option>");
                out.println ("<option value='20'>20</option>");
                out.println ("<option value='50'>50</option>");
                out.println ("</select>");
            }
            if(request.getParameter("pageNav") != null){
                out.println ("<select onchange='doSomething(this)' onclick='resetIndex(this)'>");
                out.println ("<option value='5'");
                if(Integer.parseInt(request.getParameter("pageNav"))== 5){
                     out.println ("selected='selected'");
                }
                out.println(">5</option>");

                out.println ("<option value='10'");
                if(Integer.parseInt(request.getParameter("pageNav"))== 10){
                     out.println ("selected='selected'");
                }
                out.println(">10</option>");

                out.println ("<option value='20'");
                if(Integer.parseInt(request.getParameter("pageNav"))== 20){
                     out.println ("selected='selected'");
                }
                out.println(">20</option>");

                out.println ("<option value='50'");
                if(Integer.parseInt(request.getParameter("pageNav"))== 50){
                     out.println ("selected='selected'");
                }
                out.println(">50</option>");
                out.println ("</select>");
            }
            // show danh sach san pham
%>
</p>
  <table style="text-align: left; width: 740px; height: 60px;"
 border="0" cellpadding="2" cellspacing="2">
  <tbody>
    <tr style="background: #0089fd;height: 24px;font-weight: bold;color: #3b3b1f;">
      <td style="width: 107px; text-align: center;">STT</td>
      <td style="width: 93px; text-align: center;">Tên</td>
      <td style="text-align: center; width: 99px;">Giá</td>
      <td style="text-align: center; width: 95px;">Miêu tả</td>
      <td style="text-align: center; width: 97px;">Chi tiết</td>
      <td style="text-align: center; width: 108px;">Tùy
chọn</td>
    </tr>
<%
                       // show moi san pham co ten nhu the
                       //out.println("trap code");
                       
                       ArrayList<product> dmsp1 = productDAO.timKiemRong(request.getParameter("q"));
                         //ArrayList<product> dmsp1 = productDAO.laydsSanPham(ids);
                        for(int i = tempage;i<tempage+tempageN;i++){
                        if(i==dmsp1.size()){
                            break;
                        }                       
                        product sp = dmsp1.get(i);
                        NumberFormat formatter1 = new DecimalFormat("#0.00");
                        
                        %>

    <tr>
      <td style="width: 107px; text-align: center;border: 1px solid #6495ED;"><%=(i+1)%></td>
      <td style="width: 93px; text-align: center;border: 1px solid #6495ED;"><%=sp.getNamep()%></td>
      <td style="text-align: center; width: 99px;border: 1px solid #6495ED;"><%=formatter1.format(sp.getPricep())%></td>
      <td style="text-align: center; width: 95px;border: 1px solid #6495ED;"><%=sp.getDescp()%></td>
      <td style="text-align: center; width: 97px;border: 1px solid #6495ED;"><%=sp.getDetailp()%></td>
      <td style="text-align: center; width: 108px;border: 1px solid #6495ED;"><a <%= "href='product_ctrl.do?mis=save&id="+sp.getIdp()+"'"%> >[ Lưu trữ ]</a> 
          <a <%= "href='product_ctrl.do?act=edit&id="+sp.getIdp()+"'"%> >[Sửa]</a>
          <br/>
            <a <%= "href='product_ctrl.do?edit=price&id="+sp.getIdp()+"&price="+sp.getPricep()+"'"%> >[Sửa Giá]</a>
      </td>
    </tr>
<%
                    }
                    int j = 0;
                    for(int i=0;i<dmsp1.size();i=i+tempageN){
                        j++;
                        out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
                        if(j ==  tempage){
                            out.println(j);
                        }
                        else{
                            out.println("<a href='product_ctrl.do?search=+&q="+request.getParameter("q")+"&page="+j+"&pageNav="+tempageN+"'>"+j+"</a>");
                        }
                    }
                    out.println ("<hr/></div>");
            
}%>

  </tbody>
</table>
<br/>
</div>








