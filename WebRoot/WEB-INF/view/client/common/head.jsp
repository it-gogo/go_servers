<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%
	String name=request.getParameter("name");
	request.setAttribute("name", name);
 %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>智易推服务器_${name }</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/client/css/style.css" />
<script language="JavaScript" src="http://code.54kefu.net/kefu/js/163/712363.js" type="text/javascript" charset="utf-8"></script>