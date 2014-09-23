<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="公告" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
  <div id="content_left">
    <h1>公告</h1>
    <p class="breadcrumb">
	    <a href="../index/index.htm">门户主页</a> > 
	    <a href="../notice/notice.htm">公告</a>
    </p>
    <c:forEach items="${list }" var="notice">
    <h2><a href="../notice/detail.htm?id=${notice.id }">${notice.title }</a></h2>
	<p class="small"><strong>${notice.createdate }</strong></p>
	${notice.content }
	<p><a href="../notice/detail.htm?id=${notice.id }">更多 &raquo;</a></p><hr />
	</c:forEach>

<br />

<%-- <p align="center"><img src="<%=request.getContextPath() %>/client/loginCss/images/rssfeed.gif" class="absmiddle" alt="" border="0" /> <a href="announcementsrss.php">查看RSS订阅</a></p> --%>

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>