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
              <%@include file="/WEB-INF/view/client/common/showServerImg.jsp" %> 
              <div class="title">${server.name }</div>
              <ul>
                  <li>${server.cpu }</li>
                  <li>${server.memory }</li>
                  <li>${server.disk }</li>
                  <li>${server.flow }</li>
                  <li>${server.ipNum }</li>
                  <li>独立端口</li> 
              </ul>
              <%@include file="/WEB-INF/view/client/login/common/order.jsp" %>
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