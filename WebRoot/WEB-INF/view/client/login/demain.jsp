<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>RakSmart - 域名检查</title>
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="域名检查" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
  <div id="content_left">
    <h1>域名检查</h1>
    <p class="breadcrumb"><a href="index.htm">门户主页</a> > <a href="demain.htm">域名检查</a></p><p align="center"><strong>域名搜索</strong> | <a href="domainchecker.php?search=bulkregister">批量域名搜索</a> | <a href="domainchecker.php?search=bulktransfer">批量域名转移</a></p>

<form method="post" action="domainchecker.php">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" />
  <p align="right">选择货币:
    <select name="currency" onchange="submit()">
      
      <option value="2">CNY</option>
      

      <option value="1" selected>USD</option>
      
    </select>
    <input type="submit" value="Go" />
  </p>
</form>
<p>请在下表输入域名和tld，然后点击Lookup按钮，查找域名是否已被占用。</p>
<form method="post" action="domainchecker.php">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" />
  <div class="contentbox" align="center"> www.
    <input type="text" name="domain" value="" size="40">
    <br />
    <br />
    <table border="0" align="center" cellpadding="10" cellspacing="0">
      <tr>  </tr>
    </table>
    <br />
            <img src="includes/verifyimage.php" align="middle" /> <input type="text" name="code" size="10" maxlength="5" /> &nbsp;&nbsp;&nbsp;
            <input type="submit" id="Submit" value="查找">
  </div>
</form>
<br />
<h2>域名定价</h2>
<table width="100%" border="0" cellpadding="10" cellspacing="0" class="data">
  <tr>
    <th>顶级域名</th>
    <th>最低年限</th>
    <th>注册</th>
    <th>转移</th>
    <th>续费</th>
  </tr>
  </table>
<br />

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>