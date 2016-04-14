<%-- 
    Document   : init
    Created on : Nov 10, 2011, 9:21:53 AM
    Author     : FreeX
--%>

<%@page import="pojo.att"%>
<%@page import="pojo.category"%>
<%@page import="dao.categoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
var newwindow;
function poptastic(url)
{
	newwindow=window.open(url,'name','height=300,width=300');
	if (window.focus) {newwindow.focus()}
}

</script>

    </head>
    <body>
        <div style="margin-left: 18px;margin-bottom: 20px;">
    <%
    if(request.getParameter("id") == null){
        //out.println(request.getParameter("id")+"<hr/>");

%>
<form method="get"  enctype="multipart/form-data" action="product_add.do">
<div class="form_data">
    <div class="product">
        <div>
            Product name: <input type="text" name="product_name"/>
        </div>
        <div>
            Price: <input type="text" name="price" />
        </div>
        <div>
            Số Lượng Hàng: <input type="text" name="keysearch" />
        </div>
        <div>
            Category: <select  name ='option'>
            <%
            ArrayList<category> ds = categoryDAO.laydsDanhMuc();
            for(int i = 0;i<ds.size();i++){
                category dmm = ds.get(i);
                int foo =dmm.getParents();
                int bar =dmm.getIds();
                //out.println(dm.getNames());
                if(foo == 0){
%>   
                    <option value='<%=dmm.getIds()%>' disabled='disabled'><%=dmm.getNames()%></option>
                    <%
                    for(int j = 0;j<ds.size();j++){
                        category dmtm = ds.get(j);
                        if(dmtm.getParents() == bar){
                            %>
                            <option value='<%=dmtm.getIds()%>'selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=dmtm.getNames()%></option>
                           <%
                        }
                    }
                }
            }
           %>
            </select>
        </div>
    </div>
<div class="product">    
    Description:<textarea name="des" rows="5" class='des'></textarea>
</div>
<div class="product">
   Content:<textarea name="content" id="content"></textarea>
</div>

<div class="product">

<div class="news btn">
    <input type="submit" value="Dong y" name="submit" class="btn"/>
</div>
</div>
</div>
</form>
 <% } 
      else{
               ArrayList<att> DSATT = (ArrayList<att>)request.getAttribute("dstt");
        
        %>
        Các thuộc tính của sản phẩm :
        Ảnh :    <a href="javascript:poptastic('/baitap15/a/page/upImg.jsp');"> Up ảnh cho hình</a>
       <hr/>
       <form action="product_add.do" method="get">
           <input type="hidden" name="msp" value="<%=request.getAttribute("sanpham")%>" />    
            <input type="hidden" name="dm" value="<%=request.getParameter("option")%>" />  
        <%
        for(int i=0;i< DSATT.size();i++){
            att a = new att();
            
            a = DSATT.get(i);
            if(a.getType().equals("Text")){
                %>
               <%=a.getValue()  %>&nbsp;
               Đơn vị : (<%=a.getUnit()  %>)
               <%=a.getType()  %>
            <div class="product">
               <textarea name="<%=a.getId()  %>" id="content" >
               </textarea>
            </div>
            <%
            }
            if(a.getType().equals("Varchar")){
             %>
 
                    <%=a.getValue()  %>&nbsp;
                    Đơn vị : (<%=a.getUnit()  %>)
                <div class="product">    
                    <textarea name="<%=a.getId()  %>" rows="15" class='des'></textarea>
                </div>
        <%   
            }
            if(a.getType().equals("Integer") || a.getType().equals("Double") || a.getType().equals("Float")){
                %>
                <%=a.getType()  %>
                    <%=a.getValue()  %>&nbsp;
                    Đơn vị : (<%= a.getUnit()  %>)   
                <input type="text" name="<%=a.getId()  %>" />
        <%
            }
        %>
            <br/>
        <%
        }
               %>
        
<input type="submit" name="sub" value="Dong y" />   
</form>
            <%
      //<a href="javascript:poptastic('poll/poll_result.php');">Xem Kết Quả</a>
      } 
%>   

</div> 
<script type="text/javascript">
    CKEDITOR.replace('content');
</script>

    </body>
</html>
