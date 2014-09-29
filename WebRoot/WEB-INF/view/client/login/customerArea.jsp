<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="客户区" name="name"/>
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
    <p class="breadcrumb"><a href="../index/index.htm">门户主页</a> > <a href="../index/customerArea.htm">客户区</a></p>

<p>您可以进入客户端管理账户。该页面简单概述了账户情况如公开服务请求和未付款发票。请确保提供最新的联系方式。 </p>
<h2><strong>${listTicket.size() }</strong> 打开服务Tickets</h2>
<p><a href="../ticket/toAdd.htm">提交Ticket</a></p>
<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0" class="data">
  <tr>
    <th>日期</th>
    <th>主题</th>
    <th>状态</th>
    <th>紧急通知</th>
  </tr>
  <c:if test="${listTicket!=null && listTicket.size()!=0 }">
  	<c:forEach items="${listTicket }" var="ticket">
	    <tr>
	    	<td align="left">${ticket.createdate }</td>
	    	<td align="left">
	    		<div align="left">
		    		<img src="<%=request.getContextPath() %>/client/loginCss/images/article.gif" hspace="5" align="middle" alt="" />
		    		<a href="../ticket/look.htm?id=${ticket.id }">${ticket.title }</a>
	    		</div>
	    	</td>
	    	<td align="left">${ticket.isdispose }</td>
	    	<td align="left">${ticket.urgenttype }</td>
	  </tr>
	  </c:forEach>
  </c:if>
  <c:if test="${listTicket==null || listTicket.size()==0 }">
	    <tr>
	    	<td colspan="4" align="center">未搜索到记录</td>
	  </tr>
  </c:if>
  </table>
<!-- <h2><strong>0</strong> 到期发票</h2>
<form method="post" action="clientarea.php?action=masspay">
<input type="hidden" name="token" value="90a10a2f755c23086f6a1c29fd1fe38f5a393240" />
<table width="100%" border="0" align="center" cellpadding="10" cellspacing="0" class="data">
  <tr>
    <th width="15"></th>    <th>Invoice 发票#</th>
    <th>发票日期</th>
    <th>到期日</th>
    <th>共计</th>
    <th>余额</th>
    <th>状态</th>
    <th>&nbsp;</th>
  </tr>
    <tr>
    <td colspan="8" align="center">未搜索到记录</td>
  </tr>
    </table> -->
</form>

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>