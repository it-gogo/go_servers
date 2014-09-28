<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="服务Tickets" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
<c:if test="${loginInfo!=null }">
<%@include file="/WEB-INF/view/client/login/common/topMenu.jsp" %>
</c:if>
  <div id="content_left">
    <h1>服务Tickets</h1>
    <p class="breadcrumb"><a href="../index/index.htm">门户主页</a> > <a href="../index/customerArea.htm">客户区</a> > <a href="../ticket/support.htm">服务Tickets</a></p><h2>我的服务Tickets</h2>
<p> 服务ticket系统有助于我们尽快回复您的问题和咨询。关于ticket回复，我们会发送邮件通知您。</p>
<table width="100%" border="0" cellpadding="10" cellspacing="0">
  <tr>
    <td>打开服务Tickets: <strong></strong></td>
    <td align="right"><a href="../ticket/toAdd.htm">提交Ticket</a></td>
  </tr>
</table>
<form method="post" action="searchsupporttickets.htm">
  <p align="center"><b>主题:</b>
    <input type="text" name="title" size="25" value="${title }" />
    <input type="submit" value="搜索" />
  </p>
</form>
<table width="100%" border="0" cellpadding="10" cellspacing="0">
  <tr>
    <td>${pb.allRow } 搜索到的记录,  页面 ${pb.curentPage } of ${pb.totalPage }</td>
    <!-- <td align="right">&laquo; 上一页 &nbsp; 下一页 &raquo;</td> -->
  </tr>
</table>
<br />
<table class="data" width="100%" border="0" align="center" cellpadding="10" cellspacing="0">
  <tr>
    <th>日期</th>
    <th>部门</th>
    <th>主题</th>
    <th>状态</th>
    <th>紧急通知</th>
  </tr>
  	<c:if test="${pb.list!=null && pb.list.size()>0 }">
  		<c:forEach items="${pb.list }" var="ticket">
		  	<tr>
		    <td>${ticket.createdate }</td>
		    <td>销售部</td>
		    <td><DIV ALIGN="left"><img src="<%=request.getContextPath() %>/client/loginCss/images/article.gif" hspace="5" align="middle"><a href="../ticket/look.htm?id=${ticket.id }">${ticket.title }</a></DIV></td>
		    <td><span style="color:#779500">${ticket.isdispose}</span></td>
		    <td width=80>${ticket.urgenttype}</td>
		  </tr>
	  </c:forEach>
  	</c:if>
  	<c:if test="${pb.list==null || pb.list.size()==0 }">
	   <tr>
	    <td colspan="5">未搜索到记录</td>
	  </tr>
	  </c:if>
  </table>
<br />
<%@include file="/WEB-INF/view/client/login/common/page.jsp" %>

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>