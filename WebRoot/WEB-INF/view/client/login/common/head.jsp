<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
	String name=request.getParameter("name");
	request.setAttribute("name", name);
 %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>RakSmart - ${name }</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/client/loginCss/style.css" />