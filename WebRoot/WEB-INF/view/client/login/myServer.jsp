<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="我的服务" name="name"/>
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
    <p class="breadcrumb"><a href="../index/index.htm">门户主页</a> > <a href="../index/customerArea.htm">客户区</a> > <a href="../server/myserver.htm">我的产品&amp;服务</a></p>

<h2>我的产品&amp;服务</h2>
<table width="100%" border="0" cellpadding="10" cellspacing="0">
  <tr>
    <td>${pb.allRow } 搜索到的记录,  页面 ${pb.curentPage } of ${pb.totalPage }</td>
    <td align="right">
    	<form method="post" action="searchserver.htm">
			域名:<input type="text" name="hostname" value="${hostname }" class="searchinput"  /> 
			<input type="submit" value="过滤" class="searchinput" />
		</form>
	</td>
  </tr>
</table>
<br />
<table class="data" width="100%" border="0" cellpadding="10" cellspacing="0">
  <%-- <tr>
    <th><a href="clientarea.php?action=products&orderby=product">产品/服务</a></th>
    <th><a href="clientarea.php?action=products&orderby=price">价格</a></th>
    <th><a href="clientarea.php?action=products&orderby=billingcycle">订单周期</a></th>
    <th><a href="clientarea.php?action=products&orderby=nextduedate">下次到期日</a> <img src="<%=request.getContextPath() %>/client/loginCss/images/desc.gif" alt="" border="0" /></th>
    <th width="20">&nbsp;</th>
  </tr> --%>
  <tr>
    <th>产品/服务</th>
    <th>价格</th>
    <th>订单周期</th>
    <th>下次到期日</th>
    <th width="20">&nbsp;</th>
  </tr>
  	<c:if test="${pb.list!=null && pb.list.size()>0 }">
  		<c:forEach items="${pb.list }" var="detail">
		    <tr class="clientareatablepending">
			    <td>${detail.servertype } - ${detail.servername }<br /><a href="http://1" target="_blank">${detail.hostname }</a></td>
			    <td>￥${detail.price }</td>
			    <td>${detail.quarter }</td>
			    <td>${detail.maturity }</td>
			    <td>
				    <form method="post" action="detail.htm">
				        <input type="hidden" name="id" value="${detail.id }" />
				        <input type="image" src="<%=request.getContextPath() %>/client/loginCss/images/viewdetails.gif" alt="查看详情" />
				    </form>
			    </td>
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
<!-- <table border="0" align="center" cellpadding="10" cellspacing="0">
  <tr>
    <td width="10" align="right" class="clientareatableactive">&nbsp;</td>
    <td>激活</td>
    <td width="10" align="right" class="clientareatablepending">&nbsp;</td>
    <td>待定</td>
    <td width="10" align="right" class="clientareatablesuspended">&nbsp;</td>
    <td>暂停</td>
    <td width="10" align="right" class="clientareatableterminated">&nbsp;</td>
    <td>终止</td>
  </tr>
</table><br /> -->

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>