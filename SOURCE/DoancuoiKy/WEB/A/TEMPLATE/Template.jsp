<%-- 
    Document   : index
    Created on : Dec 10, 2011, 7:10:52 PM
    Author     : FreeX
--%>
<%@taglib  prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0044)http://localhost:1275/admin/themsanpham.aspx -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/><title>
  
</title>
        <link href="a/css/indexpage.css" rel="stylesheet" type="text/css"/>
<link href="a/css/leftpage.css" rel="stylesheet" type="text/css"/>
<link href="a/css/rightpage.css" rel="stylesheet" type="text/css"/>
         <script type="text/javascript" src="a/page/ckeditor/ckeditor.js"></script> 

    </head>
<body>
<div class="wrap_page">
<div class="header">
<tiles:insertAttribute name="header"/>
</div>
<br/>
<div class="mainpage">
<tiles:insertAttribute name="left"/>
<div class="column_right">
<div class='pathway'>
      <div>
            <span><%=request.getParameter("module")%></span> 
            <span><%=request.getParameter("child")%></span>
            <%
            String clintHost = request.getServerName();
            int clintPort = request.getServerPort();
            String clintPath = request.getContextPath();
            String xmlPath = "href = 'http://"+clintHost + ":"+String.valueOf(clintPort) +clintPath+"'";

            %>
            <span style="float:right;margin-right: 12px;"><a <%=xmlPath%>>Trang Chủ</a></span>
    </div>

            
    <br/>

 </div>
<tiles:insertAttribute name="content"/>
</div>
</div>
<script type="text/javascript">
    CKEDITOR.replace('content');
</script>
<tiles:insertAttribute name="footer"/>
</div>
</body></html>