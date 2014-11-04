<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="我的发票" name="name"/>
	 </jsp:include>
</head>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
  <c:if test="${loginInfo!=null }">
<%@include file="/WEB-INF/view/client/login/common/topMenu.jsp" %>
</c:if>
  <div id="content_left">
    <h1>客户区</h1>
    <p class="breadcrumb"><a href="../index/index.htm">门户主页</a> > <a href="../index/customerArea.htm">客户区</a> > <a href="../invoices/myinvocies.htm">我的发票</a></p>

<h2 >我的发票</h2>
<table width="100%" border="0" cellpadding="10" cellspacing="0">
  <tr>
    <td>${pb.allRow } 搜索到的记录,  页面 ${pb.curentPage } of ${pb.totalPage }</td>
    <!-- <td align="right">&laquo; 上一页 &nbsp; 下一页 &raquo;</td> -->
  </tr>
</table>
<br />
<table class="data" width="100%" border="0" cellpadding="10" cellspacing="0">
  <tr>
    <th>发票 #</th>
    <th>发票日期</th>
    <!-- <th>到期日</th> -->
    <th>共计</th>
    <th>状态</th>
    <th>&nbsp;</th>
  </tr>
  	<c:if test="${pb.list!=null && pb.list.size()>0 }">
  		<c:forEach items="${pb.list }" var="order">
		    <tr>
		    <td><a href="detail.htm?id=${order.id }" target="_blank">${order.id }</a></td>
		    <td>${order.createdate }</td>
		    <!-- <td>2014/09/25</td> -->
		    <td>￥${order.totalprice }</td>
		    <td><span class="textred">${order.status }</span></td>
		    <td><a href="detail.htm?id=${order.id }" target="_blank">查看发票</a></td>
		  </tr>
	</c:forEach>
  	</c:if>
  	<c:if test="${pb.list==null || pb.list.size()==0 }">
	   <tr>
	    <td colspan="6">未搜索到记录</td>
	  </tr>
	  </c:if>
    <!-- <tr>
    <td><a href="viewinvoice.php?id=2836" target="_blank">2836</a></td>
    <td>2014/09/28</td>
    <td>2014/09/28</td>
    <td>$299.54USD</td>
    <td><span class="textred">未付款</span></td>
    <td><a href="viewinvoice.php?id=2836" target="_blank">查看发票</a></td>
  </tr> -->
  </table>
<br />
<%@include file="/WEB-INF/view/client/login/common/page.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>