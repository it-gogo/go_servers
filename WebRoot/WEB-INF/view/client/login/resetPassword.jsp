<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="重置密码" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
  <div id="content_left">
    <h1>丢失密码重置</h1>
    <p class="breadcrumb"><a href="../index/index.htm">门户主页</a> > <a href="../index/customerArea.htm">客户区</a> > <a href="../portal/resetPassword.htm">丢失密码重置</a></p>
<p>如果您忘记了密码，请在此处进行密码重置。填写注册邮箱（必要情况下，您还需要回答账户安全问题），然后根据指导进行密码重置。</p>


<form method="post" action="../portal/sendEmail.htm">
<input type="hidden" name="token" value="6f8efbccfe13dd8f8deff862f30ba64cefc91442" />
<input type="hidden" name="action" value="reset" />

  <p align="center">邮件地址:
    <input type="text" name="email" size="50" value="">
  </p>

  
  <p align="center">
    <input type="submit" value="提交">
  </p>

</form>



<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>