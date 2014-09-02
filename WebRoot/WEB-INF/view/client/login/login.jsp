<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="登陆" name="name"/>
	 </jsp:include>
</head>
<body>
<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
  <div id="content_left">
    <h1>客户区</h1>
    <p class="breadcrumb"><a href="index.htm">门户主页</a> > <a href="customerArea.htm">客户区</a></p>

<p>登录访问，该登录信息区别于您的网站控制面板用户名和密码。</p>
<form action="login.htm" method="post" name="frmlogin" id="frmlogin">
	<c:if test="${error_msg!=null }">
	 	<div class="errorbox">登录错误，请重试。</div>
	  	<br />
  	</c:if>
    <table style="margin: 0 auto;" cellpadding="0" cellspacing="0" border="0" align="center" class="frame">
    <tr>
      <td><table border="0" align="center" cellpadding="10" cellspacing="0">
          <tr>
            <td width="150" align="right" class="fieldarea">邮件地址:</td>
            <td><input type="text" name="email" size="40" value="${email }" /></td>
          </tr>
          <tr>
            <td width="150" align="right" class="fieldarea">密码:</td>
            <td><input type="password" name="password" size="25" value="${password }" /></td>
          </tr>
          <tr>
            <td width="150" align="right" class="fieldarea">
            	<c:if test="${rememberme==1 }">
            		<input type="checkbox" name="rememberme" value="1" checked="checked" />
            	</c:if>
            	<c:if test="${rememberme!=1 }">
            		<input type="checkbox" name="rememberme" value="1"  />
            	</c:if>
            </td>
            <td>记住我</td>
          </tr>
          <tr>
            <td width="150" align="right" class="fieldarea">&nbsp;</td>
            <td><input type="submit" value="登录" /></td>
          </tr>
        </table></td>
    </tr>
  </table><br />
</form>
<p align="center"><strong>忘记密码？</strong> <a href="pwreset.php">请求密码重置</a></p>
<script type="text/javascript">
document.frmlogin.email.focus();
</script>
<br />

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>