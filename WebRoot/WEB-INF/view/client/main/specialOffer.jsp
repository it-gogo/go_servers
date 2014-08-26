<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="/WEB-INF/view/client/common/head.jsp" >
    	<jsp:param value="每周特价" name="name"/>
	 </jsp:include>
</head>

<body  >
   <%@include file="/WEB-INF/view/client/common/header.jsp" %>
        
<div id="weeklyspecial">
</div>
<!--aboutBanner end-->
<div class="container">
<div class="box">
<div class="tableTitle"><a name="dedicated" id="dedicated"></a>专用服务器</div>
<table width="100%" border="1">
  <tr class="stress">
    <td>套餐</td>
    <td>详细信息</td>
    <td>价格</td>
    <td>RAKsmart优惠码</td>
    <td>购买</td>
  </tr>
<tr>
   <td>E3, 16G, 1T, 5IP, 100M带宽 10TB流量</td>
   <td>E3, 16G, 1T, 5IP, 100M带宽 10TB流量</td>
   <td>$129/month</td>
   <td>不支持优惠码</td>
   <td><a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=42">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=42')"/>
      </a></td>
  </tr><tr>
   <td>E3, 32G内存 , 4x1T HDD, RAID10, 29IP</td>
   <td>E3, 32G内存 , 4x1T HDD, RAID10, 29IP</td>
   <td>$259/月</td>
   <td>不支持优惠码</td>
   <td><a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=37">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=37')"/>
      </a></td>
  </tr></table>
<div class="tableTitle"><a name="cloud" id="cloud"></a>云服务器</div>
<table width="100%" border="1">
  <tr class="stress">
    <td>套餐</td>
    <td>详细信息</td>
    <td>价格</td>
    <td>RAKsmart优惠码</td>
    <td>购买</td>
  </tr>
<tr>
   <td>CloudServer 2x vCPU,1024M RAM</td>
   <td>2x vCPU, 1024M RAM, 20G SAN, 6TB Transfer, 20G Backup</td>
   <td>$18/month</td>
   <td>Cloud50%</td>
   <td><a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=41">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=41')"/>
      </a></td>
  </tr><tr>
   <td>CloudServer 1x vCPU, 512M RAM</td>
   <td>1x vCPU, 512M RAM, 10G SAN, 3TB Transfer, 10G Backup</td>
   <td>$9/month</td>
   <td>Cloud50%</td>
   <td><a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=40">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=40')"/>
      </a></td>
  </tr></table>
<div class="tableTitle"><a name="vps" id="vps"></a>VPS服务器</div>
<table width="100%" border="1">
  <tr class="stress">
    <td>套餐</td>
    <td>详细信息</td>
    <td>价格</td>
    <td>RAKsmart优惠码</td>
    <td>购买</td>
  </tr>
<tr>
   <td>512MB 内存 Windows VPS </td>
   <td>512MB,20G,200GB 流量,1 IP地址,SolusVM</td>
   <td>$5.48/月</td>
   <td>Windows50%</td>
   <td><a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=39">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=39')"/>
      </a></td>
  </tr><tr>
   <td>256MB 内存 Linux VPS </td>
   <td>256MB,10G,100GB 流量,1 IP地址,SolusVM</td>
   <td>$2.98/月</td>
   <td>Linux50%</td>
   <td><a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=38">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=38')"/>
      </a></td>
  </tr><tr>
   <td>HK V1024, 1024MB Guaranteed 内存</td>
   <td>1 CPU Cores,40GB RAID10,200GB 流量,3M 带宽,1IP,SolusVM</td>
   <td>$19.97/月</td>
   <td>HKVPS50</td>
   <td><a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=49">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=49')"/>
      </a></td>
  </tr><tr>
   <td>HK V1024+, 1024MB Guaranteed 内存</td>
   <td>2 CPU Cores,40GB RAID10,300GB 流量,3M 带宽,1IP,SolusVM</td>
   <td>$24.97/月</td>
   <td>HKVPS50</td>
   <td><a href="http://cn.raksmart.com/whmcs/cart.php?a=add&pid=50">
      <input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('http://cn.raksmart.com/whmcs/cart.php?a=add&pid=50')"/>
      </a></td>
  </tr></table>

<div class="tableTitle"><a name="zhanqun" id="zhanqun"></a>站群服务器</div>
<table width="100%" border="1">
  <tr class="stress">
    <td>套餐</td>
    <td>详细信息</td>
    <td>价格</td>
    <td>RAKsmart优惠码</td>
    <td>购买</td>
  </tr>
</table>

</div></div>
<!--container end-->
      <div class="box">
    	<%@include file="/WEB-INF/view/client/common/footerMenu.jsp" %>
		<%@include file="/WEB-INF/view/client/common/footer.jsp" %>
</div>
   <%@include file="/WEB-INF/view/client/common/float_right.jsp" %>
 </body>
</html>