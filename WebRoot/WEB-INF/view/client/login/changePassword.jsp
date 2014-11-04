<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="更改密码" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
<c:if test="${loginInfo!=null }">
<%@include file="/WEB-INF/view/client/login/common/topMenu.jsp" %>
</c:if>
  <div id="content_left">
    <h1>客户区</h1>
    <p class="breadcrumb"><a href="../index/index.htm">门户主页</a> > <a href="../index/customerArea.htm">客户区</a> > <a href="../portal/myDetail.htm">我的详细信息</a> > <a href="../portal/changePassword.htm">更改密码</a></p>

<script type="text/javascript" src="includes/jscript/pwstrength.js"></script>
<jsp:include page="/WEB-INF/view/client/login/common/contentbox.jsp" >
   	<jsp:param value="更改密码" name="name"/>
</jsp:include>
<h2>更改密码</h2>
<c:if test="${show_msg==1 }">
<div class="successbox">已成功保存更改</div>
</c:if>
<c:if test="${show_msg==0 }">
	<div class="errorbox">当前密码错误</div>
</c:if>
<c:if test="${show_msg==2 }">
	<div class="errorbox">未确认密码</div>
</c:if>
<c:if test="${show_msg==3 }">
	<div class="errorbox">未填写新密码</div>
</c:if>
<%-- <c:if test="${show_msg!=null }">
<div class="errorbox">
	<li>${show_msg}</li>
</div>
</c:if> --%>
<form method="post" action="../portal/changePassword.htm">
  <table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="150" class="fieldarea">当前密码</td>
            <td><input type="password" name="oldpw" size="25" /></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td width="150" class="fieldarea">新密码</td>
            <td><input type="password" name="newpw" id="newpw" size="25" /></td>
          </tr>
          <tr>
            <td width="150" class="fieldarea">确认新密码</td>
            <td><input type="password" name="newpw2" size="25" /></td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
    </tr>
  </table>
  <p align="center">
    <input type="submit" value="保存更改" class="button" />
    <input type="reset" value="取消更改" class="button" />
  </p>
</form>

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>