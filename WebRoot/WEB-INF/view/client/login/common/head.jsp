<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String name=request.getParameter("name");
	request.setAttribute("name", name);
 %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>RakSmart - ${name }</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/client/loginCss/style.css" />
<script language="javascript" src="<%=request.getContextPath() %>/client/js/common.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/client/js/jquery-1.8.3.min.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/client/js/jquery.json-2.4.min.js"></script>