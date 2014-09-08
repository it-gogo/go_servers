<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String name=request.getParameter("name");
	request.setAttribute("name", name);
 %>
<div class="contentbox">
	<c:if test="${name=='我的详细信息' }">
		<strong>我的详细信息</strong> | 
		<a href="/whmcs/clientarea.php?action=contacts">联系方式/子账户</a> | 
		<a href="/whmcs/clientarea.php?action=addcontact">添加新的联系方式</a> | 
		<a href="../portal/toChangePassword.htm">更改密码</a>
	</c:if>
	<c:if test="${name=='联系方式/子账户' }">
		<a href="../portal/myDetail.htm">我的详细信息</a> | 
		<strong>联系方式/子账户</strong> | 
		<a href="/whmcs/clientarea.php?action=addcontact">添加新的联系方式</a> | 
		<a href="../portal/toChangePassword.htm">更改密码</a>
	</c:if>
	<c:if test="${name=='添加新的联系方式' }">
		<a href="../portal/myDetail.htm">我的详细信息</a> | 
		<a href="/whmcs/clientarea.php?action=addcontact">联系方式/子账户</a> | 
		<strong>添加新的联系方式</strong> | 
		<a href="../portal/toChangePassword.htm">更改密码</a>
	</c:if>
	<c:if test="${name=='更改密码' }">
		<a href="../portal/myDetail.htm">我的详细信息</a> | 
		<a href="/whmcs/clientarea.php?action=addcontact">联系方式/子账户</a> | 
		<a href="/whmcs/clientarea.php?action=addcontact">添加新的联系方式</a>
		<strong>更改密码</strong> 
	</c:if>
</div>

