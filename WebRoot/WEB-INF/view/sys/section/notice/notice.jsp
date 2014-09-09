<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%@include file="/section/common/includefile.jsp"%>
 <script language="javascript" src="<%=basePath%>/section/notice/notice.js" ></script>
<meta http-equiv="cache-control" content="no-cache">
<body>

<div class="easyui-layout"  data-options="fit:'true'">
		
		<div data-options="region:'center'">
		 <%@include file="noticeGrid.jsp" %>  
		</div>
	</div>
<!-- 数据编辑层 -->
<%-- <%@include file="noticeQuery.jsp" %> --%>
<%@include file="noticeEdit.jsp" %>

</body>
</html>
