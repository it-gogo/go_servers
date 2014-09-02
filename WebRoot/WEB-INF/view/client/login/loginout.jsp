<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="退出" name="name"/>
	 </jsp:include>

</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
  <div id="content_left">
    <h1>退出</h1>
    <p class="breadcrumb"><a href="../index/index.htm">门户主页</a>> <a href="../index/customerArea.htm">客户区</a></p>
    <p>欢迎进入我们的支持门户。<a href="../index/index.htm"> 点击此处继续……</a></p>


<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>