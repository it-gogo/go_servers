<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="/WEB-INF/view/client/common/head.jsp" >
    	<jsp:param value="公共服务器" name="name"/>
	 </jsp:include>
</head>

<body  >
   <%@include file="/WEB-INF/view/client/common/header.jsp" %>
        
<div id="publicloud">
</div>
<!--aboutBanner end-->
<div class="containerW" style="padding-bottom:0;">
<div class="box">
<ul class="oneOf5Grid">
	<c:forEach items="${list }" var="server" >
		<li>
			<%@include file="/WEB-INF/view/client/common/showServerImg.jsp" %>
	      <div class="title">${server.name }</div>
	      <ul>
	          <li>${server.cpu }</li>
	          <li>${server.memory }</li>
	          <li>${server.disk }</li>
	          <li>${server.backups }</li>
	          <li>${server.flow }</li>
	          <li>${server.ipNum }</li> 
	      </ul>
	      <%@include file="/WEB-INF/view/client/login/common/order.jsp" %>
	    </li>
	</c:forEach>
    <!-- <li>
      <img src="/Public/Uploads/20131218/52b0b61e84d63.jpg" width="87" height="65" alt="RAK C512 公有云服务器" /> 
      <div class="title">RAK C512</div>
      <ul>
          <li>1x vCPU</li>
          <li>512M 内存</li>
          <li>10G SAN存储</li>
          <li>10G 备份</li>
          <li>3T 流量</li>
          <li>1 IPv4 地址</li> 
      </ul>
      <div class="price">$18/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=28">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=28')"/>
      </a>
    </li>
    <li>
      <img src="/Public/Uploads/20131218/52b0b604130ff.jpg" width="87" height="65" alt="RAK C1024 公有云服务器" /> 
      <div class="title">RAK C1024</div>
      <ul>
          <li>2x vCPU</li>
          <li>1024M 内存</li>
          <li>20G SAN存储</li>
          <li>20G 备份</li>
          <li>6T 流量</li>
          <li>1 IPv4 地址</li> 
      </ul>
      <div class="price">$36/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=27">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=27')"/>
      </a>
    </li>
    <li>
      <img src="/Public/Uploads/20131218/52b0b5dddb608.jpg" width="87" height="65" alt="RAK C1536 公有云服务器" /> 
      <div class="title">RAK C1536</div>
      <ul>
          <li>3x vCPU</li>
          <li>1536M 内存</li>
          <li>30G SAN存储</li>
          <li>30G 备份</li>
          <li>9T 流量</li>
          <li>1 IPv4 地址</li> 
      </ul>
      <div class="price">$54/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=33">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=33')"/>
      </a>
    </li><li>
      <img src="/Public/Uploads/20131218/52b0b5ac22161.jpg" width="87" height="65" alt="RAK C2048 公有云服务器" /> 
      <div class="title">RAK C2048</div>
      <ul>
          <li>4x vCPU</li>
          <li>2048M 内存</li>
          <li>40G  SAN存储</li>
          <li>40G 备份</li>
          <li>12T 流量</li>
          <li>1 IPv4 地址</li> 
      </ul>
      <div class="price">$72/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=32">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=32')"/>
      </a>
    </li><li>
      <img src="/Public/Uploads/20131218/52b0b5427b2ad.jpg" width="87" height="65" alt="RAK C2560 公有云服务器" /> 
      <div class="title">RAK C2560</div>
      <ul>
          <li>5x vCPU</li>
          <li>2560M 内存</li>
          <li>50G SAN存储</li>
          <li>50G 备份</li>
          <li>15T 流量</li>
          <li>1 IPv4 地址</li> 
      </ul>
      <div class="price">$90/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=31">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=31')"/>
      </a>
    </li><li>
      <img src="/Public/Uploads/20131218/52b0af39d3af9.jpg" width="87" height="65" alt="RAK C3072 公有云服务器" /> 
      <div class="title">RAK C3072</div>
      <ul>
          <li>6x vCPU</li>
          <li>3072M 内存</li>
          <li>60G SAN存储</li>
          <li>60G 备份</li>
          <li>18T 流量</li>
          <li>1 IPv4 地址</li> 
      </ul>
      <div class="price">$108/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=29">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=29')"/>
      </a>
    </li><li>
      <img src="/Public/Uploads/20131218/52b0b72ab7bcc.jpg" width="87" height="65" alt="RAK C3584 公有云服务器" /> 
      <div class="title">RAK C3584</div>
      <ul>
          <li>7x vCPU</li>
          <li>3584M 内存</li>
          <li>70G SAN存储</li>
          <li>70G 备份</li>
          <li>21T 流量</li>
          <li>1 IPv4 地址</li> 
      </ul>
      <div class="price">$126.00/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=35">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=35')"/>
      </a>
    </li><li>
      <img src="/Public/Uploads/20131218/52b0b7fdb4a12.jpg" width="87" height="65" alt="RAK C4096 公有云服务器" /> 
      <div class="title">RAK C4096</div>
      <ul>
          <li>8x vCPU</li>
          <li>4096M 内存</li>
          <li>80G SAN存储</li>
          <li>80G 备份</li>
          <li>24T 流量</li>
          <li>1 IPv4 地址</li> 
      </ul>
      <div class="price">$144.00/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=26">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=26')"/>
      </a>
    </li><li>
      <img src="/Public/Uploads/20131218/52b0b8bcc70d9.jpg" width="87" height="65" alt="RAK C4608 公有云服务器" /> 
      <div class="title">RAK C4608</div>
      <ul>
          <li>9x vCPU</li>
          <li>4608M 内存</li>
          <li>90G SAN硬盘</li>
          <li>90G 备份</li>
          <li>27T 流量</li>
          <li>1 IPv4 地址</li> 
      </ul>
      <div class="price">$162.00/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=30">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=30')"/>
      </a>
    </li><li>
      <img src="/Public/Uploads/20131218/52b0b9713f15d.jpg" width="87" height="65" alt="RAK C5120 公有云服务器" /> 
      <div class="title">RAK C5120</div>
      <ul>
          <li>10x vCPU</li>
          <li>5120M 内存</li>
          <li>100G SAN存储</li>
          <li>100G 备份</li>
          <li>30T 流量</li>
          <li>1 IPv4 地址</li> 
      </ul>
      <div class="price">$180.00/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=34">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=34')"/>
      </a>
    </li> -->
    </ul>
</div>
</div>
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