<%-- 
    Document   : content
    Created on : Nov 10, 2011, 12:13:25 PM
    Author     : FreeX
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<script>

$(function(){
    $('input[type="checkbox"]').attr('checked', false);
});

$(function(){
    $('input[type="checkbox"]').click(function(){
        var title = $(this).closest('.product-module').find('.product-id').html();
        
        // as user checks the checkbox, add the item to the ul		
		if($(this).attr('checked')){
                            
                requested = $('.compare input').size();
 
		if(requested > 2){
			alert("Tối Đa 3 sản phẩm mà thôi !!!"); 
			$(this).removeAttr("checked");
			//break;
		}
		else{
                    
                    var html = '&nbsp;&nbsp;<input name="'+requested+'" type="hidden" value="'+title+'"/></span>';
			$('.compare').append(html);       
		}
		} 
        else {     
        // if user is un-checking the checkbox, remove the item from the ul
        // orig: $('li[title="' + title + '"]').remove();
        //$('input[value="'+title+'"]').remove();
         }
        
        var title = $(this).closest('.product-module').find('.product-img').html();

        // as user checks the checkbox, add the item to the ul

		
		if($(this).attr('checked')){
		requested = $('.compare img').size();
		if(requested > 2){
			alert("Tối Đa 3 sản phẩm mà thôi !!!"); 
			$(this).removeAttr("checked");
			//break;
		}
		else{
			var html = '<img src="'+title+'" height="40" width="40"/>';
			$('.compare').append(html);       
		}
		} else {     
        // if user is un-checking the checkbox, remove the item from the ul
        // orig: $('li[title="' + title + '"]').remove();
        // $('img[src="'+title+'"]').remove();
		
        }
        
        
    });
});


$(function(){
    $('.clear-selections').click(function(){
        $('.compare ul').empty();
        $('input[type="checkbox"]').attr('checked', false);
    })
});


</script>

<c:if test="${param.act == 'view'}">

        <div id="titleintrofirst">
        <div id="titleintro-align">
            <strong>TỔNG HỢP CÁC MẶT HÀNG</strong> 
        </div>
    </div>
    <div id="intro">
            <table border="0" width="610">
        <c:set var="nav" value="0"/> 
       <c:forEach var="dm" items="${showAll}">
           <c:set var="tinhiem" value="Cao"/> 
           <c:if test="${nav % 4 == 0}">
                  <c:if test="${sp1.getSttp() == 'Yes'}" >
                      <c:set var="tinhiem" value="Cao"/> 
                  </c:if>
                  <c:if test="${sp1.getSttp() == 'No'}" >
                      <c:set var="tinhiem" value="Thấp"/> 
                  </c:if>
                  <c:if test="${sp1.getSttp() == 'Medium'}" >
                      <c:set var="tinhiem" value="Trung Bình"/> 
                  </c:if>
               <tr></tr><td width="80" onmouseout='UnTip()' onmouseover="Tip('<div class=\'detail\' style=\'margin-left:20px;width:150px;\'><strong><c:out value="${dm.getNamep()}"/></strong><hr/>Giá thành:<br/><span style=\'background:yellow;\'><fmt:formatNumber type="number" value="${dm.getPricep()}" maxFractionDigits="2"          
         minFractionDigits="2"/>&nbsp;&nbsp;VND</span><br/>Lượt xem:<span style=\'background:yellow;\'><c:out value="${dm.getViewp()}"/></span><br/>Mức độ tín nhiệm(credit rating)<br/><span style=\'background:yellow;\'><c:out value="${tinhiem}"/></span><br/>Số hàng trong kho :<span style=\'background:yellow;\'><c:out value="${dm.getStorep()}"/></span></div>', WIDTH, 240, ABOVE, true)">
               <a style="text-decoration:none;" href="Detail.do?msp=<c:out value="${dm.getIdp()}"/>">
              <img src='<c:out value="${dm.getImgfilep()}"/>'  height='100' width='60' />
               <br/>
               <strong style="color:Maroon"><c:out value="${dm.getNamep()}"/></strong>
               <br/><fmt:formatNumber type="number" value="${dm.getPricep()}" maxFractionDigits="2"          
         minFractionDigits="2"/>&nbsp;&nbsp;VND
               </a>
               </td> 
               
           </c:if>
           <c:if test="${nav % 4 != 0}">
               <td width="80" onmouseout='UnTip()' onmouseover="Tip('<div class=\'detail\' style=\'margin-left:20px;width:150px;\'><strong><c:out value="${dm.getNamep()}"/></strong><hr/>Giá thành:<br/><span style=\'background:yellow;\'><fmt:formatNumber type="number" value="${dm.getPricep()}" maxFractionDigits="2"          
         minFractionDigits="2"/>&nbsp;&nbsp;VND</span><br/>Lượt xem:<span style=\'background:yellow;\'><c:out value="${dm.getViewp()}"/></span><br/>Mức độ tín nhiệm(credit rating)<br/><span style=\'background:yellow;\'><c:out value="${tinhiem}"/></span><br/>Số hàng trong kho :<span style=\'background:yellow;\'><c:out value="${dm.getStorep()}"/></span></div>', WIDTH, 240, ABOVE, true)">
               <a style="text-decoration:none;" href="Detail.do?msp=<c:out value="${dm.getIdp()}"/>">
              <img src='<c:out value="${dm.getImgfilep()}"/>'  height='100' width='60' />
               <br/>
               <strong style="color:Maroon"><c:out value="${dm.getNamep()}"/></strong>
               <br/><fmt:formatNumber type="number" value="${dm.getPricep()}" maxFractionDigits="2"          
         minFractionDigits="2"/>&nbsp;&nbsp;VND
               </a>
               </td>   
           </c:if>
           <c:set var="nav" value="${nav + 1}"/>     
         </c:forEach>  
          </table>
    </div>

    
</c:if>    



<c:if test="${param.act != 'view'}">
    

<form action="Compare.do" method="post">
<div style="background: #ADD8E6;padding-top: 4px;height: 40px;">
<c:set var="j" value="1"/> 
  <span style="float:right;margin-right: 15px;margin-top: 4px;">
       <input type="submit" name="sosanh" value="So Sánh"/>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<c:forEach var="i" begin="0" end="${soluong}" step="${sotrang}"  > 
    <c:set var="j" value="${j+1}" /> 
        <a style="border:1px solid #800000;padding: 2px 2px 2px 2px;background: #A9A9A9;text-decoration: none;color:#008B8B;"href='<c:out value="${phtrang}&page=${j-2}&pageNav=${sotrang}" escapeXml="false"/>'><c:out value="${j-1}" /></a>
</c:forEach>
</span>     
<div class="compare">


</div>
 
</div>

</form>
    


    
<p style="background: #c3c3c3;height: 30px;padding-top: 4px;">


Hiển thị bao nhiêu sản phẩm 1 trang :
<select onchange='doSomething(this)' onclick='resetIndex(this)'>
    <option value='5'
    <c:if test="${sotrang == 5}">
          selected='selected'
    </c:if>
    >5</option>
    <option value='10'
    <c:if test="${sotrang == 10}">
           selected='selected'
    </c:if>
    >10</option>
    
    <option value='20'
    <c:if test="${sotrang == 20}">
          selected='selected'
    </c:if>
    >20</option>
    
    <option value='50'
    <c:if test="${sotrang == 50}">
          selected='selected'
    </c:if>
    >50</option>
</select>
   <span style="float:right;margin-right: 15px;margin-top: 4px;">
<select>
<option>theo giá tăng dần</option>
</select>
   </span>
</p>
<hr/>
<c:set var="foo" value="0"/>
<c:forEach var="row" items="${sanpham}"> 
    <c:if test="${foo >= trang*sotrang && foo <trang*sotrang+sotrang }">
        
        <div class="mainproduct">
        <form id='form1' name='form1' method='get' action='ShopCart.do'>
        <div class="leftproduct">
        <h1 style="color:blueviolet;"><c:out value="${row.getNamep()}"/> </h1>
        <hr/>
        Thông tin :<br/><c:out value="${row.getDetailp()}" escapeXml="false"/><br/>
        <br/>Giá cả :<br/>
        <fmt:formatNumber type="number" value="${row.getPricep()}" maxFractionDigits="2"          
         minFractionDigits="2"/> 
        &nbsp;&nbsp;VND
        <input type='hidden' name='msp' id='hiddenField' value='<c:out value="${row.getIdp()}"/>'/>
        <br/>
        </div>
        <div class="rightproduct">
        <img src='<c:out value="${row.getImgfilep()}"/>'  height='100' width='150' />
        <br/>
        
        <div class="product-module">
        <input type="checkbox" class="checkbox" name="compare" id="compare1" />
        So sánh 
        <span class="product-id" style="display: none;">
        <c:out value="${row.getIdp()}"/>
        </span>

        <span class="product-img" style="display: none;">
        <c:out value="${row.getImgfilep()}"/>
        </span>
        </div>
        
        <a href='Detail.do?msp=<c:out value="${row.getIdp()}"/>'>Chi&nbsp;tiết&nbsp;&nbsp;&nbsp;</a>

        <div class="form_search"> 
        <input name='search' type='submit' value=' ' class='btnp'/>  
        </div>
        </div>
        </form>
        </div>
          
    </c:if>
    <c:set var="foo" value="${foo+1}"/>
</c:forEach> 
<hr/>

<p style="background: #c3c3c3;height: 30px;padding-top: 4px;">
<c:set var="j" value="1"/> 
    
Hiển thị bao nhiêu sản phẩm 1 trang :
<select onchange='doSomething(this)' onclick='resetIndex(this)'>
    <option value='5'
    <c:if test="${sotrang == 5}">
          selected='selected'
    </c:if>
    >5</option>
    <option value='10'
    <c:if test="${sotrang == 10}">
           selected='selected'
    </c:if>
    >10</option>
    
    <option value='20'
    <c:if test="${sotrang == 20}">
          selected='selected'
    </c:if>
    >20</option>
    
    <option value='50'
    <c:if test="${sotrang == 50}">
          selected='selected'
    </c:if>
    >50</option>
</select>
<span style="float:right;margin-right: 15px;margin-top: 4px;">
<c:forEach var="i" begin="0" end="${soluong}" step="${sotrang}"  > 
    <c:set var="j" value="${j+1}" /> 
        <a style="border:1px solid #800000;padding: 2px 2px 2px 2px;background: #A9A9A9;text-decoration: none;color:#008B8B;"href='<c:out value="${phtrang}&page=${j-2}&pageNav=${sotrang}" escapeXml="false"/>'><c:out value="${j-1}" /></a>
</c:forEach>
</span>    
</p>
<p style="background: #ADD8E6;height: 30px;padding-top: 4px;">
So sánh :
</p>
</c:if> 
