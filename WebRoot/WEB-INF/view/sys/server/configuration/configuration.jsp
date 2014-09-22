<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%@include file="/section/common/includefile.jsp"%>
 <script language="javascript" src="<%=basePath%>/section/serverInfo/configuration.js" ></script>
<meta http-equiv="cache-control" content="no-cache">
<body>

<div class="easyui-layout"  data-options="fit:'true'">
		 <div data-options="region:'west',split:true,title:'可配置项类型',collapsible:true" 
		  style="width:270px;">
			 <%@include file="/section/common/tree.jsp" %>  
		</div>
		<div data-options="region:'center'">
		 <%@include file="configurationGrid.jsp" %>  
		</div>
	</div>
<!-- 数据编辑层 -->
<%-- <%@include file="noticeQuery.jsp" %> --%>
<%@include file="configurationEdit.jsp" %>

</body>
</html>
