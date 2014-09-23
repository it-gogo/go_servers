<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="/WEB-INF/view/client/common/head.jsp" >
    	<jsp:param value="关于公司" name="name"/>
	 </jsp:include>
</head>

<body  >
   <%@include file="/WEB-INF/view/client/common/header.jsp" %>
        
<div id="aboutBanner">
  <div class="content">
    <h1 class="aboutTitle">关于我们</h1>
    <div id="nav">
      <ul>
        <li><a href="company.htm">关于公司</a></li>
        <li><a href="technology.htm">技术伙伴</a></li>
<!--        <li><a href="/About/channel">通道伙伴</a></li>
        <li><a href="/About/careers">职位招聘</a></li>
        <li><a href="/About/startup">启动赞助</a></li>
-->      </ul>
    </div>
  </div>
</div>
<!--aboutBanner end-->
<div class="containerW">
<div class="box">
    ${company.history }    
    ${company.corecompetitiveness }
</div>
</div>
<!--containerW end-->
<div class="container">
<div class="box">
${company.briefintroduction }    
</div>
</div>
<!--container end-->

      <div class="box">
	    <%@include file="/WEB-INF/view/client/common/footerMenu.jsp" %>
		<%@include file="/WEB-INF/view/client/common/footer.jsp" %>
		</div>
   <%@include file="/WEB-INF/view/client/common/float_right.jsp" %>
 </body>
</html>