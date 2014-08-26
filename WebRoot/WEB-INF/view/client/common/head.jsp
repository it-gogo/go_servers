<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
	String name=request.getParameter("name");
	request.setAttribute("name", name);
 %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>RAKsmart美国公有云服务器_${name }</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/client/css/style.css" />