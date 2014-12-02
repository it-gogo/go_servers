<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="/WEB-INF/view/client/common/head.jsp" >
    	<jsp:param value="站群服务器" name="name"/>
	 </jsp:include>
</head>

<body  >
   <%@include file="/WEB-INF/view/client/common/header.jsp" %>
    <div id="zhanqunserver">
	</div>
<!--aboutBanner end-->
<div class="containerW" style="padding-bottom:0;">
	<div class="box">
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<ul class="oneOf5Grid">
	<c:forEach items="${list }" var="server">
		<li>
              <%@include file="/WEB-INF/view/client/common/showServerImg.jsp" %> 
              <div class="title">${server.name }</div>
              <ul>
                  <li>${server.cpu }</li>
                  <li>${server.memory }</li>
                  <li>${server.disk }</li>
                   <li>${server.netFast }</li>
                  <li>${server.flow }</li>
                  <li>${server.ipNum }</li>
              </ul>
              <%@include file="/WEB-INF/view/client/login/common/order.jsp" %>
            </li>
	</c:forEach>
           <!--  <li>
              <img src="/Public/Uploads/20131213/52aab6131afaa.jpg" width="87" height="65" alt="E3 1230 8G站群机" /> 
              <div class="title">E3 1230 8G站群机</div>
              <ul>
                  <li>8GB内存</li>
                  <li>1x1TB硬盘</li>
                  <li>100M带宽</li>
                  <li>10TB流量</li>
                  <li>258个独立IP</li>
              
              </ul>
              <div class="price">$233.59/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=44">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('')"/>
      </a>
            </li>
            <li>
              <img src="/Public/Uploads/20131213/52aab6131afaa.jpg" width="87" height="65" alt="I3 2120 4G 站群机" /> 
              <div class="title">I3 2120 4G 站群机</div>
              <ul>
                  <li>8GB内存</li>
                  <li>1000G硬盘</li>
                  <li>100M带宽</li>
                  <li>10TB流量</li>
                  <li>258个独立IP</li>
              </ul>
              <div class="price">$227/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=43">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('')"/>
      </a>
            </li>   -->         
		</ul>
</div></div>
<!--containerW end-->
<div class="container">
<div class="box">
<h2>站群服务器优势<a name="zhanq" id="zhanq"></a></h2>
     <dl class="oneOf3Grid">
     <dt class="blue">多达258个独立IP</dt>
     <dd></dd>
     </dl>
     <dl class="oneOf3Grid">
     <dt class="blue">防御DDOS攻击能力强</dt>
     <dd></dd>
     </dl>
     <dl class="oneOf3Grid">
     <dt class="blue">BGP peering 10G光纤链接</dt>
     <dd></dd>
     </dl>
     <dl class="oneOf3Grid">
     <dt class="blue">免备案</dt>
     <dd></dd>
     </dl>
     <dl class="oneOf3Grid">
     <dt class="blue">建站速度快</dt>
     <dd></dd>
     </dl>
     <dl class="oneOf3Grid">
     <dt class="blue">具有中国电信和联通的专线</dt>
     <dd></dd>
     </dl>
     
</div></div>
<!--container end-->

      <div class="box">
    	<%@include file="/WEB-INF/view/client/common/footerMenu.jsp" %>
		<%@include file="/WEB-INF/view/client/common/footer.jsp" %>
		</div>
  <%@include file="/WEB-INF/view/client/common/float_right.jsp" %>
 </body>
</html>