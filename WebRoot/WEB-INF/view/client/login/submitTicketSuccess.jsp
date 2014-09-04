<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="提交Tickets成功" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
<c:if test="${loginInfo!=null }">
<%@include file="/WEB-INF/view/client/login/common/topMenu.jsp" %>
</c:if>
  <div id="content_left">
    <h1>提交Ticket</h1>
    <p class="breadcrumb"><a href="index.php">门户主页</a> > <a href="clientarea.php">客户区</a> > <a href="supporttickets.php">服务Tickets</a> > <a href="submitticket.php">提交Ticket</a></p>
    <h2>Ticket 已创建 <a href="../ticket/look.htm?id=${ticket.id }">${ticket.id }</a></h2>
<p>您的ticket已成功创建。Ticket回复信息已发送至您的邮箱。您可以即刻查看ticket回复。</p>

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>