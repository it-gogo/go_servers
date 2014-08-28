<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="公告" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
  <div id="content_left">
    <h1>公告</h1>
    <p class="breadcrumb"><a href="index.php">门户主页</a> > <a href="announcements.php">公告</a></p><h2><a href="/whmcs/announcements.php?id=1">IP价格优惠已经停止</a></h2>
<p class="small"><strong>Friday, July 18, 2014</strong></p>
 Dear Raksmart Partners or customers, 
 因近期IPv4地址趋于紧张，大于64 IP的优惠价格已停止，现调整如下： 
  Additional IP: 
 61个可用IP $48 
 128个可用IP $96...
<p><a href="/whmcs/announcements.php?id=1">更多 &raquo;</a></p><hr />


<br />

<p align="center"><img src="images/rssfeed.gif" class="absmiddle" alt="" border="0" /> <a href="announcementsrss.php">查看RSS订阅</a></p>

<p style="text-align:center;">Powered by <a href="http://www.whmcs.com/" target="_blank">WHMCompleteSolution</a></p>

<div align="right"><form method="post" action="/whmcs/announcements.php" name="languagefrm" id="languagefrm">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" /><strong>语言:</strong> <select name="language" onchange="languagefrm.submit()"><option>#chinese</option><option>Arabic</option><option>Azerbaijani</option><option>Catalan</option><option selected="selected">Chinese</option><option>Croatian</option><option>Czech</option><option>Danish</option><option>Dutch</option><option>English</option><option>Farsi</option><option>French</option><option>German</option><option>Hungarian</option><option>Italian</option><option>Norwegian</option><option>Portuguese-br</option><option>Portuguese-pt</option><option>Russian</option><option>Spanish</option><option>Swedish</option><option>Turkish</option><option>Ukranian</option></select></form></div><br />  </div>
  <%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>