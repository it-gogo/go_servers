<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="/WEB-INF/view/client/common/head.jsp" >
    	<jsp:param value="linux/windows VPS" name="name"/>
	 </jsp:include>
 	</head>
</head>

<body  >
   <%@include file="/WEB-INF/view/client/common/header.jsp" %>
        
<div id="linuxwindows">
</div>
    <!--aboutBanner end-->
<div class="containerW" style="padding-bottom:0;">
    <div class="box">
    <ul class="oneOf5Grid">
    <h2 class="gray" style="clear:both">  <a name="windows" id="windows"></a>VPS (Windows)</h2>
    <c:forEach items="${list }" var="server">
		<li>
              <img src="/Public/Uploads/20131218/52b0ba319f677.jpg" width="87" height="65" alt="ATOM Server 美国服务器" /> 
              <div class="title">${server.name }</div>
              <ul>
                  <li>${server.memory }</li>
                  <li>${server.disk }</li>
                  <li>${server.flow }</li>
                  <li>${server.ipNum }</li>
                   <li>${server.netFast }</li>
                   <li>SolusVM 控制面板</li>
              </ul>
              <%@include file="/WEB-INF/view/client/login/common/order.jsp" %>
            </li>
	</c:forEach>
      	<!-- <li>
              <img src="/Public/Uploads/20131226/52bb1e09d1f12.jpg" width="87" height="65" alt="RAK W512 VPS服务器" /> 
              <div class="title">RAK W512</div>
              <ul>
                  <li>512M 内存</li>
                  <li>20G SAN 存储</li>
                  <li>200G 流量</li>
                  <li>1 IPv4 地址</li>
                  <li>1 GBPS 上行速度</li>
                  <li>SolusVM 控制面板</li> 
              </ul>
              <div class="price">$10.95/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=14">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=14')"/>
      </a>
            </li><li>
              <img src="/Public/Uploads/20131226/52bb1e9308a04.jpg" width="87" height="65" alt="RAK W1024 VPS服务器" /> 
              <div class="title">RAK W1024</div>
              <ul>
                  <li>1024M 内存</li>
                  <li>40G SAN存储</li>
                  <li>400G 流量</li>
                  <li>1 IPv4 地址</li>
                  <li>1 GBPS 上行速度</li>
                  <li>SolusVM 控制面板</li> 
              </ul>
              <div class="price">$20.95/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=15">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=15')"/>
      </a>
            </li><li>
              <img src="/Public/Uploads/20131226/52bb1f0f5fbe2.jpg" width="87" height="65" alt="RAK W1536 VPS服务器" /> 
              <div class="title">RAK W1536</div>
              <ul>
                  <li>1536M 内存</li>
                  <li>60G SAN 存储</li>
                  <li>600G 流量</li>
                  <li>1 IPv4 地址</li>
                  <li>1 GBPS 上行速度</li>
                  <li>SolusVM 控制面板</li> 
              </ul>
              <div class="price">$30.95/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=17">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=17')"/>
      </a>
            </li><li>
              <img src="/Public/Uploads/20131226/52bb1f824a9f2.jpg" width="87" height="65" alt="RAK W2048 VPS服务器" /> 
              <div class="title">RAK W2048</div>
              <ul>
                  <li>2048M 内存</li>
                  <li>80G SAN 存储</li>
                  <li>800G 流量</li>
                  <li>1 IPv4 地址</li>
                  <li>1 GBPS 上行速度</li>
                  <li>SolusVM 控制面板</li> 
              </ul>
              <div class="price">$40.95/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=16">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=16')"/>
      </a>
            </li><li>
              <img src="/Public/Uploads/20131226/52bb205826222.jpg" width="87" height="65" alt="RAK W4096 VPS服务器" /> 
              <div class="title">RAK W4096</div>
              <ul>
                  <li>4096M 内存</li>
                  <li>160G SAN存储</li>
                  <li>1600G 流量</li>
                  <li>1 IPv4 地址</li>
                  <li>1 GBPS 上行速度</li>
                  <li>SolusVM 控制面板</li> 
              </ul>
              <div class="price">$80.95/月</div>
      <a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=25">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=25')"/>
      </a>
            </li> -->      
    </ul>
</div></div>
    <!--containerW end-->
    <div class="container">
    <div class="box">
        <dl class="oneOf3Grid">
            <dt class="blue">企业级服务</dt>
            <dd><span style="color:#999999;">RAKsmart多年经验积累和灾难规划确保企业型服务能够满足我们大/小客户需求。</span></dd>
            </dl><dl class="oneOf3Grid">
            <dt class="blue">积极监控</dt>
            <dd>待问题发生之前，RAKsmart将积极监测到基础架构所产生的问题，并提出解决方案。</dd>
            </dl><dl class="oneOf3Grid">
            <dt class="blue">定制安全方案</dt>
            <dd>标准系统、应用程序安全政策配合定制的防火墙和IDS解决方案进一步确保了云服务的安全性。</dd>
            </dl><dl class="oneOf3Grid">
            <dt class="blue">自动备份</dt>
            <dd>全面集成备份解决方案能够确保云服务器的数据安全。</dd>
            </dl><dl class="oneOf3Grid">
            <dt class="blue">智能化控制面板</dt>
            <dd>完全智能化控制面板允许您随时随地重启、重新安装和监控基础架构。</dd>
            </dl><dl class="oneOf3Grid">
            <dt class="blue">高度定制</dt>
            <dd>根据您的需求，高度定制硬件平台允许您进行基础架构的配置。<br /></dd>
            </dl>    </div></div>
    <!--container end-->

      <div class="box">
    	<%@include file="/WEB-INF/view/client/common/footerMenu.jsp" %>
		<%@include file="/WEB-INF/view/client/common/footer.jsp" %>
	</div>
   <%@include file="/WEB-INF/view/client/common/float_right.jsp" %>
 </body>
</html>