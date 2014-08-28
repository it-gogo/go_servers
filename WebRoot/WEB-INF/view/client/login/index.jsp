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
    <p class="breadcrumb"><a href="index.php">门户主页</a></p><p>欢迎进入我们的支持门户。</p>
<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
  <tr>
    <td><div align="center"><a href="clientarea.php"><img src="templates/portal/images/clientarea.png" border="0" alt="" /></a></div></td>
    <td width="50%"><strong><a href="clientarea.php">客户区</a></strong><br />
      参考&更新账户详情</td>
    <td><div align="center"><a href="announcements.php"><img src="templates/portal/images/announcements.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="announcements.php">公告</a></strong><br />
      查看最新新闻&公告</td>
  </tr>
  <tr>
    <td><div align="center"><a href="submitticket.php"><img src="templates/portal/images/submitticket.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="submitticket.php">提交Ticket</a></strong><br />
      提交问题ticket</td>
    <td><div align="center"><a href="downloads.php"><img src="templates/portal/images/downloads.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="downloads.php">下载</a></strong><br />
      查看下载文库</td>
  </tr>
  <tr>
    <td><div align="center"><a href="supporttickets.php"><img src="templates/portal/images/supporttickets.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="supporttickets.php">服务Tickets</a><br />
    </strong>查看回复当前</td>
    <td><div align="center"><a href="knowledgebase.php"><img src="templates/portal/images/knowledgebase.png" border="0" alt="" /></a></div></td>
    <td width="50%"><strong><a href="knowledgebase.php">知识库</a></strong><br />
      浏览KB进行FAQs回复</td>
  </tr>
  <tr>
    <td><div align="center"><a href="affiliates.php"><img src="templates/portal/images/affiliates.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="affiliates.php">Affiliates</a></strong><br />
      加入我们的affiliate活动或查看收入</td>
    <td><div align="center"><a href="cart.php"><img src="templates/portal/images/cart.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="cart.php">订单</a></strong><br />
      下新订单</td>
  </tr>
  <tr>
    <td><div align="center"><a href="contact.php"><img src="templates/portal/images/contact.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="contact.php">售前联系</a></strong><br />
      此处输入售前咨询</td>
    <td><div align="center"><a href="domainchecker.php"><img src="templates/portal/images/domainchecker.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="domainchecker.php">域名检查</a></strong><br />
      查看域名是否可用</td>
  </tr>
  <tr>
    <td><div align="center"><a href="serverstatus.php"><img src="templates/portal/images/serverstatus.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="serverstatus.php">服务器状态</a></strong><br />
      查看服务器在线状态信息</td>
    <td><div align="center"><a href="networkissues.php"><img src="templates/portal/images/networkissues.png" border="0" alt="" /></a></div></td>
    <td><strong><a href="networkissues.php">网络问题</a></strong><br />
      阅读当前/计划网络中断</td>
  </tr>
</table>

<h2>最新公告</h2>
<p>2014/07/18 - <a href="announcements.php?id=1">IP价格优惠已经停止</a><br /> Dear Raksmart Partners or customers, 
 因近期IPv4地址趋于紧张，大于64...</p>


<p style="text-align:center;">Powered by <a href="http://www.whmcs.com/" target="_blank">WHMCompleteSolution</a></p>

<div align="right"><form method="post" action="/whmcs/index.php" name="languagefrm" id="languagefrm">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" /><strong>语言:</strong> <select name="language" onchange="languagefrm.submit()"><option>#chinese</option><option>Arabic</option><option>Azerbaijani</option><option>Catalan</option><option selected="selected">Chinese</option><option>Croatian</option><option>Czech</option><option>Danish</option><option>Dutch</option><option>English</option><option>Farsi</option><option>French</option><option>German</option><option>Hungarian</option><option>Italian</option><option>Norwegian</option><option>Portuguese-br</option><option>Portuguese-pt</option><option>Russian</option><option>Spanish</option><option>Swedish</option><option>Turkish</option><option>Ukranian</option></select></form></div><br />  </div>
  <%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>