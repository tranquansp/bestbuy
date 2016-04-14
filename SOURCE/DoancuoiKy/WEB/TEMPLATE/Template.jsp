<%-- 
    Document   : Template
    Created on : Oct 22, 2011, 4:12:00 PM
    Author     :  Nguyễn Hoàng Anh - nhanh@fit.hcmus.edu.vn
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" class="section-user">
<head>
    
<script>
            var flag = true;
         function resetIndex(selObj) {
            if(flag) selObj.selectedIndex = -1;
            flag = true;
           }
            function doSomething(selObj) {
            <c:if test="${param.id != null}">
                   window.location = 'Intro.do?id=<c:out value="${param.id}&" escapeXml="false"/>pageNav='+selObj.value; ;
            </c:if>
            <c:if test="${param.id == null}">
                <c:if test="${param.q != null}">
                    <c:if test="${param.option == null}">
                         window.location = 'Intro.do?search=+<c:out value="&q=${param.q}&" escapeXml="false"/>pageNav='+selObj.value;   
                    </c:if>
                    <c:if test="${param.option != null}">
                        window.location = 'Intro.do?search=+<c:out value="&q=${param.q}&" escapeXml="false"/>option=<c:out value="${param.option}&" escapeXml="false"/>;pageNav='+selObj.value;
                    </c:if>    
                </c:if>
            </c:if>
            flag = false;
            }
</script>

     
                    
                    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title"/></title>
	<script src="script/jquery.js"></script>
	<script src="script/loadajax.js"></script>
        <script type="text/javascript" src="script/scripts.js"></script>
<link rel="stylesheet" href="style/css.css" type="text/css" media="screen,projection,tv,print" charset="utf-8">
</link>
</meta>        
</head>
<body id="myopera" class="loggedin">
<div id="wrap0"><div id="wrap1"><div id="wrap2"><div id="wrap3">
<tiles:insertAttribute name="header"/>                          
<div id="wrap4">

</div>
<div id="content" class="blogfront">
<div id="mainwrap"><div id="main">

        
<div class="post even">
    <h2 class="title">Trang Chủ</h2>
    
<div class="content" style="height: 190px;width:100%;">
    <div style="margin-right: 15px;background: #000000;">
        

   <div id="slide-holder">
<div id="slide-runner">
    <a href="Detail.do?msp=2"><img id="slide-img-1" src="img/slide/1.png" class="slide" alt="" /></a>
    <a href="Detail.do?msp=16"><img id="slide-img-2" src="img/slide/2.png" class="slide" alt="" /></a>
    <a href="Detail.do?msp=6"><img id="slide-img-3" src="img/slide/3.png" class="slide" alt="" /></a>
    <a href="Detail.do?msp=7"><img id="slide-img-4" src="img/slide/4.png" class="slide" alt="" /></a>
	<a href="Detail.do?msp=12"><img id="slide-img-5" src="img/slide/5.png" class="slide" alt="" /></a> 
    <div id="slide-controls">
     <p id="slide-nav"></p>
    </div>
</div>
	
	<!--content featured gallery here -->
   </div>
       </div> 
    
   <script type="text/javascript">
    if(!window.slider) var slider={};slider.data=[{"id":"slide-img-1","client":"nature beauty","desc":"nature beauty photography"},{"id":"slide-img-2","client":"nature beauty","desc":"add your description here"},{"id":"slide-img-3","client":"nature beauty","desc":"add your description here"},{"id":"slide-img-4","client":"nature beauty","desc":"add your description here"},{"id":"slide-img-5","client":"nature beauty","desc":"add your description here"}];
   </script>
    
</div>

</div>



<div class="post even">
<h2 class="title">

<div class="form_search" action="a.jsp"> 
<form method="get" action="Intro.do?">

<div class="form_search"> 
Tìm Kiếm Nhanh:<input type="text" name='q' size="50"/>
<input name='search' type='submit' value=' ' class='btn'/>  
</div>

</form>

</div>	
</h2>

<div class="content">
    

<tiles:insertAttribute name="content"/>     
</div>

</div>
<script src="script/wz_tooltip.js"></script>

</div></div>
<tiles:insertAttribute name="left"/>
</div>
<tiles:insertAttribute name="footer"/>
</div>
</div>
</div></div>

</body>
</html>

                
                


