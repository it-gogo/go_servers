<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="知识库" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
  <div id="content_left">
    <h1>知识库</h1>
    <p class="breadcrumb"><a href="http://cn.raksmart.com/whmcs/index.php">门户主页</a> > <a href="http://cn.raksmart.com/whmcs/knowledgebase.php">知识库</a></p><p>知识库组织成不同分类。查找问题时，您可以选择下方分类或搜索知识库。</p>
<h2>搜索</h2>
<form method="post" action="knowledgebase.php?action=search">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" />
  <p align="center">
    <input type="text" name="search" size="40" /> <input type="submit" value="搜索" />
  </p>
</form>
<h2></h2>
<table width="100%" border="0" cellpadding="10" cellspacing="0">
  <tr>  </tr>
</table>
<br />
<h2>最热文章</h2>
<table width="100%">
    </table>
<br />

<p style="text-align:center;">Powered by <a href="http://www.whmcs.com/" target="_blank">WHMCompleteSolution</a></p>

<div align="right"><form method="post" action="/whmcs/knowledgebase.php" name="languagefrm" id="languagefrm">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" /><strong>语言:</strong> <select name="language" onchange="languagefrm.submit()"><option>#chinese</option><option>Arabic</option><option>Azerbaijani</option><option>Catalan</option><option selected="selected">Chinese</option><option>Croatian</option><option>Czech</option><option>Danish</option><option>Dutch</option><option>English</option><option>Farsi</option><option>French</option><option>German</option><option>Hungarian</option><option>Italian</option><option>Norwegian</option><option>Portuguese-br</option><option>Portuguese-pt</option><option>Russian</option><option>Spanish</option><option>Swedish</option><option>Turkish</option><option>Ukranian</option></select></form></div><br />  </div>
  <%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>