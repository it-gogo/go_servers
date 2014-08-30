<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="门户主页" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
  <div id="content_left">
    <h1>门户主页</h1>
    <p class="breadcrumb"><a href="index.hml">门户主页</a></p><p>欢迎进入我们的支持门户。</p>
<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
  <tr>
    <td><div align="center"><a href="customerArea.htm"><img src="<%=request.getContextPath() %>/client/loginCss/images/clientarea.png" border="0" alt="" /></a></div></td>
    <td width="50%"><strong><a href="customerArea.htm">客户区</a></strong><br />
      参考&更新账户详情</td>
    <td><div align="center"><a href="notice.htm"><img src="<%=request.getContextPath() %>/client/loginCss/images/announcements.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="notice.htm">公告</a></strong><br />
      查看最新新闻&公告</td>
  </tr>
  <tr>
    <td><div align="center"><a href="submitticket.htm"><img src="<%=request.getContextPath() %>/client/loginCss/images/submitticket.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="submitticket.htm">提交Ticket</a></strong><br />
      提交问题ticket</td>
    <td><div align="center"><a href="download.htm"><img src="<%=request.getContextPath() %>/client/loginCss/images/downloads.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="download.htm">下载</a></strong><br />
      查看下载文库</td>
  </tr>
  <tr>
    <td><div align="center"><a href="supportticket.htm"><img src="<%=request.getContextPath() %>/client/loginCss/images/supporttickets.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="supportticket.htm">服务Tickets</a><br />
    </strong>查看回复当前</td>
    <td><div align="center"><a href="knowledge.htm"><img src="<%=request.getContextPath() %>/client/loginCss/images/knowledgebase.png" border="0" alt="" /></a></div></td>
    <td width="50%"><strong><a href="knowledge.htm">知识库</a></strong><br />
      浏览KB进行FAQs回复</td>
  </tr>
  <tr>
    <td><div align="center"><a href="affiliates.htm"><img src="<%=request.getContextPath() %>/client/loginCss/images/affiliates.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="affiliates.htm">Affiliates</a></strong><br />
      加入我们的affiliate活动或查看收入</td>
    <td><div align="center"><a href="cart.php"><img src="<%=request.getContextPath() %>/client/loginCss/images/cart.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="cart.php">订单</a></strong><br />
      下新订单</td>
  </tr>
  <tr>
    <td><div align="center"><a href="proContant.htm"><img src="<%=request.getContextPath() %>/client/loginCss/images/contact.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="proContant.htm">售前联系</a></strong><br />
      此处输入售前咨询</td>
    <td><div align="center"><a href="demain.htm"><img src="<%=request.getContextPath() %>/client/loginCss/images/domainchecker.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="demain.htm">域名检查</a></strong><br />
      查看域名是否可用</td>
  </tr>
  <tr>
    <td><div align="center"><a href="serverStatus.htm"><img src="<%=request.getContextPath() %>/client/loginCss/images/serverstatus.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="serverStatus.htm">服务器状态</a></strong><br />
      查看服务器在线状态信息</td>
    <td><div align="center"><a href="networkProblems.htm"><img src="<%=request.getContextPath() %>/client/loginCss/images/networkissues.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="networkProblems.htm">网络问题</a></strong><br />
      阅读当前/计划网络中断</td>
  </tr>
</table>

<h2>最新公告</h2>
<p>2014/07/18 - <a href="announcements.php?id=1">IP价格优惠已经停止</a><br /> Dear Raksmart Partners or customers, 
 因近期IPv4地址趋于紧张，大于64...</p>


<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>