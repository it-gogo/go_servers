<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%@include file="/section/common/includefile.jsp"%>
 <script language="javascript" src="<%=basePath%>/section/serverInfo/serverInfo.js" ></script>
<meta http-equiv="cache-control" content="no-cache">
<body>
<input  id="snumber"  type="hidden"  name="snumber"  value="">

<div class="easyui-layout"  data-options="fit:'true'">
		
		<div data-options="region:'center'">
		 <%@include file="serverInfoGrid.jsp" %>  
		</div>
	</div>
<!-- 数据编辑层 -->
<%-- <%@include file="noticeQuery.jsp" %> --%>
<%@include file="serverInfoEdit.jsp" %>
<%@include file="../price/serverPriceEdit.jsp" %>
<%@include file="configuration.jsp" %>
</body>
</html>
