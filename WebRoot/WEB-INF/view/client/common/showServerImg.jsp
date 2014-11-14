<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:if test="${server.imgUrl==null }">
     <img src="<%=request.getContextPath() %>/client/images/server.jpg" width="87" height="65" alt="RAK C512 公有云服务器" /> 
</c:if>
<c:if test="${server.imgUrl!=null }">
	<img src="<%=basePath%>${server.imgUrl }" width="87" height="65" alt="RAK C512 公有云服务器" />
</c:if>