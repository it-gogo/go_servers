<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${loginInfo==null}">
<div id="top_container">
	<div id="top">
		<div id="company_title">RakSmart</div>
		<div id="welcome_box">
			请 <a href="../portal/toLogin.htm" title="登录"><strong>登录</strong>
			</a> 或 <a href="../portal/registration.htm" title="注册"><strong>注册</strong>
			</a>
		</div>
	</div>
</div>
</c:if>
<c:if test="${loginInfo!=null}">
<!-- 存在登陆账号 -->
<div id="top_container">
  <div id="top">
    <div id="company_title">RakSmart</div>
    <div id="welcome_box">欢迎回来, <strong>${loginInfo.name }</strong>&nbsp;&nbsp;&nbsp;<img src="<%=request.getContextPath() %>/client/loginCss/images/details.gif" alt="我的详细信息" width="16" height="16" border="0" class="absmiddle" /> <a href="clientarea.php?action=details" title="我的详细信息"><strong>我的详细信息</strong></a>&nbsp;&nbsp;&nbsp;<img src="<%=request.getContextPath() %>/client/loginCss/images/logout.gif" alt="退出" width="16" height="16" border="0" class="absmiddle" /> <a href="../portal/loginout.htm" title="Logout"><strong>退出</strong></a></div>
  </div>
</div>
</c:if>
