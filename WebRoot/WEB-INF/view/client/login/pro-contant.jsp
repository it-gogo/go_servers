<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="售前联系" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
  <div id="content_left">
    <h1>售前联系</h1>
    <p class="breadcrumb"><a href="index.php">门户主页</a> > <a href="contact.php">售前联系</a></p><p>有任何售前问题，请点击进入下表。</p>
<form method="post" action="contact.php?action=send">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" />
    <table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="100" class="fieldarea">姓名</td>
            <td><input type="text" name="name" size="30" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">邮件</td>
            <td><input type="text" name="email" size="50" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">主题</td>
            <td><input type="text" name="subject" size="60" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">邮件</td>
            <td><textarea name="message" rows="8" style="width:95%"></textarea></td>
          </tr>
      </table></td>
    </tr>
  </table>
    <h2>Spam Bot验证</h2>
  <p>请在文本框中输入下图字符，避免系统自动提交。</p>
    <p align="center"><img src="includes/verifyimage.php" align="middle" /> <input type="text" name="code" size="10" maxlength="5" /></p>
      <p align="center">
    <input type="submit" value="发送邮件" />
  </p>
</form>
<br />

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>