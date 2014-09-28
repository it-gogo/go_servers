<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="公告详细" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
<c:if test="${loginInfo!=null }">
<%@include file="/WEB-INF/view/client/login/common/topMenu.jsp" %>
</c:if>
  <div id="content_left">
    <h1>公告</h1>
    <p class="breadcrumb"><a href="../index/index.htm">门户主页</a> > <a href="../notice/notice.htm">公告</a> > <a href="../notice/detail.htm?id=${notice.id }">${notice.title }</a></p><h2>${notice.title }</h2>

<br />

${notice.content }
<br />
<p><strong>${notice.createdate }</strong></p>




<p><a href="../notice/notice.htm">&laquo; 返回</a></p>

<%-- <p align="center"><img src="<%=request.getContextPath() %>/client/loginCss/images/rssfeed.gif" class="absmiddle" border="0" alt="" /> <a href="announcementsrss.php">查看RSS订阅</a></p><br /> --%>

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>