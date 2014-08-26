<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="/WEB-INF/view/client/common/head.jsp" >
    	<jsp:param value="私有服务器" name="name"/>
	 </jsp:include>
</head>

<body  >
   <%@include file="/WEB-INF/view/client/common/header.jsp" %>
        
<div id="privatecloud">
</div>
<!--aboutBanner end-->
<div class="containerW">
	<div class="box">
	<h2>RAKsmart 私有云</h2>
		<p>RAKsmart私有云托管数据中心或合作伙伴数据中心基于专属的基础架构云环境配置并拥有公有云服务的高效性和灵活性。</p><h2>咨询云服务专家</h2>
		<p><p>
	基于RAKsmart云管理和操作，拥有DevOps经验和技能的专家为您提供关于私有云规模运行方面的咨询服务！
</p></p><h2>RAKsmart私有云服务</h2>
		<p><p>
	基于RAKsmart云架构和操作专业知识！
</p>
<p>
	<br />
</p>
<p>
	RAKsmart的云平台设计、部署和操作服务便于您集中精力进行业务运营和创新。RAKsmart云专家将满足您庞大的数据计算和存储要求，严格遵循您的业务准则及确保数据控制/安全性。
</p></p>		<p>&nbsp;</p>
	</div>
</div>
<!--containerW end-->
<%@include file="/WEB-INF/view/client/common/container.jsp" %>
<!--container end-->

      <div class="box">
   			<%@include file="/WEB-INF/view/client/common/footerMenu.jsp" %>
			<%@include file="/WEB-INF/view/client/common/footer.jsp" %>
		</div>
</div>
<%@include file="/WEB-INF/view/client/common/float_right.jsp" %>
 </body>
</html>