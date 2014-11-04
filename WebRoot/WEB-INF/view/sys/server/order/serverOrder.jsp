<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%@include file="/section/common/includefile.jsp"%>
 <script language="javascript" src="<%=basePath%>/section/serverInfo/serverOrder.js" ></script>
<meta http-equiv="cache-control" content="no-cache">
<body>
<input  id="snumber"  type="hidden"  name="snumber"  value="">

<div class="easyui-layout"  data-options="fit:'true'">
		<div data-options="region:'center'">
		 <%@include file="serverOrderGrid.jsp" %>  
		</div>
	</div>
<!-- 数据编辑层 -->
<%@include file="serverOrderEdit.jsp" %>
<%@include file="../detail/orderDetailEdit.jsp" %>
</body>
</html>
