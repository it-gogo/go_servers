<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <jsp:include page="/WEB-INF/view/client/common/head.jsp" >
    	<jsp:param value="独立服务器" name="name"/>
	 </jsp:include>
 </head>

<body  >
   <%@include file="/WEB-INF/view/client/common/header.jsp" %>
        
<div id="dedicatedserver">
</div>
<!--aboutBanner end-->
<div class="containerW" style="padding-bottom:0;">
	<div class="box">
	<ul class="oneOf5Grid">
	<c:forEach items="${list }" var="server">
		<li>
              <img src="/Public/Uploads/20131218/52b0ba319f677.jpg" width="87" height="65" alt="ATOM Server 美国服务器" /> 
              <div class="title">${server.name }</div>
              <ul>
                  <li>${server.cpu }</li>
                  <li>${server.memory }</li>
                  <li>${server.disk }</li>
                  <li>${server.flow }</li>
                  <li>${server.ipNum }</li>
                  <li>独立端口</li> 
              </ul>
              <div class="price">$${server.pricename }/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=7">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('../cart/independence.htm?id=${server.id}')"/>
      </a>
            </li>
	</c:forEach>
         </ul>
</div></div>
<!--containerW end-->
<%@include file="/WEB-INF/view/client/common/container.jsp" %>
<!--container end-->

      <div class="box">
    	<%@include file="/WEB-INF/view/client/common/footerMenu.jsp" %>
		<%@include file="/WEB-INF/view/client/common/footer.jsp" %>
	</div>
	<%@include file="/WEB-INF/view/client/common/float_right.jsp" %>
 </body>
</html>