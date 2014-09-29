<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%@include file="/section/common/includefile.jsp"%>
 <script language="javascript" src="<%=basePath%>/section/reply/reply.js" ></script>
<meta http-equiv="cache-control" content="no-cache">
<body>
<input type="hidden" id="rowIndex"  name="rowIndex" value="${rowIndex}">
<input type="hidden" id="tabIndex"  name="tabIndex" value="${tabIndex}">
<div class="easyui-layout"  data-options="fit:'true'">
		
		<div data-options="region:'center'">
		 <%@include file="replyGrid.jsp" %>  
		</div>
	</div>
<!-- 数据编辑层 -->
<%-- <%@include file="noticeQuery.jsp" %> --%>
<%-- <%@include file="replyEdit.jsp" %> --%>

</body>
</html>
