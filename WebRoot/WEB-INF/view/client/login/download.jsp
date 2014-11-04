<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>RakSmart - 下载</title>
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="下载" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
<c:if test="${loginInfo!=null }">
<%@include file="/WEB-INF/view/client/login/common/topMenu.jsp" %>
</c:if>
  <div id="content_left">
    <h1>下载</h1>
    <p class="breadcrumb"><a href="index.htm">门户主页</a> > <a href="download.htm">下载</a></p><p>下载文库包含所有产品指南、程序和其他网站运行文件。</p>
<h2>分类</h2>
<table width="100%" border="0" cellpadding="10" cellspacing="0">
  <tr>  </tr>
</table>
<br />
<table width="100%" border="0" cellpadding="0" cellspacing="10">
  <tr>
    <td width="50%" align="left" valign="top"><h3>流行下载</h3>
      <table width="100%" border="0" cellpadding="10" cellspacing="0">
              </table></td>
    <td width="50%" align="left" valign="top"><form method="post" action="downloads.php?action=search">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" />
        <h3>搜索</h3>
        <p align="center">
          <input type="text" name="search" size="25" /> 
          <input type="submit" value="搜索" />
        </p>
      </form></td>
  </tr>
</table><br />

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>