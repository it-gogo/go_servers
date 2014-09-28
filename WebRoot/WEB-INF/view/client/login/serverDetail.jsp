<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0065)http://cn.raksmart.com/whmcs/clientarea.php?action=productdetails -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="产品详情" name="name"/>
	 </jsp:include>
</head>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
  <c:if test="${loginInfo!=null }">
<%@include file="/WEB-INF/view/client/login/common/topMenu.jsp" %>
</c:if>
  <div id="content_left">
    <h1>客户区</h1>
    <p class="breadcrumb"><a href="../index/index.htm">门户主页</a> &gt; <a href="../index/customerArea.htm">客户区</a> &gt; <a href="../server/myserver.htm">我的产品&amp;服务</a> &gt; <a href="../server/detail.htm?id=${detail.id }">产品详情</a></p>

<h2>产品详情</h2>
<table width="100%" cellspacing="0" cellpadding="0" class="frame">
  <tbody><tr>
    <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
        <tbody><tr>
          <td width="150" class="fieldarea">注册日期:</td>
          <td>${detail.createdate }</td>
        </tr>
        <tr>
          <td class="fieldarea">产品/服务:</td>
          <td>${detail.servertype } - ${detail.servername }</td>
        </tr>
        <tr>
          <td class="fieldarea">域名:</td>
          <td><a href="http://0.0.0.1/" target="_blank">${detail.hostname }</a></td>
        </tr>
         <tr>
          <td class="fieldarea">支付方式:</td>
          <td>${detail.payment }</td>
        </tr>
        <tr>
          <td class="fieldarea">首次付款金额:</td>
          <td>￥${detail.price }</td>
        </tr>
        <!-- <tr>
          <td class="fieldarea">Recurring Amount:</td>
          <td>$180.00USD</td>
        </tr> -->
        <tr>
          <td class="fieldarea">下次到期日:</td>
          <td>${detail.maturity }</td>
        </tr>
        <tr>
          <td class="fieldarea">订单周期:</td>
          <td>${detail.quarter }</td>
        </tr>
        <tr>
          <td class="fieldarea">状态:</td>
          <td>${detail.status }</td>
        </tr>
            </tbody></table></td>
  </tr>
</tbody></table>

<br>

<div align="center"></div>


<!-- <h3>账户扩展</h3>
<p></p>
<table class="data" width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
  <tbody><tr>
    <th>扩展</th>
    <th>定价</th>
    <th>下次到期日</th>
  </tr>
    <tr>
    <td colspan="3">未订购扩展</td>
  </tr>
  </tbody></table>
<br> -->
<!-- <table border="0" align="center" cellpadding="10" cellspacing="0">
  <tbody><tr>
    <td width="10" align="right"><table style="width:10px;height:10px;" cellspacing="1" class="clientareatable">
        <tbody><tr class="clientareatableactive">
          <td></td>
        </tr>
    </tbody></table></td>
    <td>激活</td>
    <td width="10" align="right"><table style="width:10px;height:10px;" cellspacing="1" class="clientareatable">
        <tbody><tr class="clientareatablepending">
          <td></td>
        </tr>
    </tbody></table></td>
    <td>待定</td>
    <td width="10" align="right"><table style="width:10px;height:10px;" cellspacing="1" class="clientareatable">
        <tbody><tr class="clientareatablesuspended">
          <td></td>
        </tr>
    </tbody></table></td>
    <td>暂停</td>
    <td width="10" align="right"><table style="width:10px;height:10px;" cellspacing="1" class="clientareatable">
        <tbody><tr class="clientareatableterminated">
          <td></td>
        </tr>
    </tbody></table></td>
    <td>终止</td>
  </tr>
</tbody></table>
<br> -->
<table border="0" align="center" cellpadding="10" cellspacing="0">
  <tbody><tr>
    <td><input type="button" value="« 返回" onclick="window.location='../server/myserver.htm'" class="button"></td>
              </tr>
</tbody></table><br>

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>


<div><object id="ClCache" click="sendMsg" host="" width="0" height="0"></object></div></body></html>