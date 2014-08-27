<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 	<jsp:include page="/WEB-INF/view/client/common/head.jsp" >
    	<jsp:param value="技术伙伴" name="name"/>
	 </jsp:include>
 </head>

<body  >
    <%@include file="/WEB-INF/view/client/common/header.jsp" %>
        
<div id="aboutBanner">
  <div class="content">
    <h1 class="aboutTitle">关于我们</h1>
    <div id="nav">
      <ul>
        <li><a href="/company">关于公司</a></li>
        <li><a href="/technology">技术伙伴</a></li>
<!--        <li><a href="/About/channel">通道伙伴</a></li>
        <li><a href="/About/careers">职位招聘</a></li>
        <li><a href="/About/startup">启动赞助</a></li>
-->      </ul>
    </div>
  </div>
</div>
<!--aboutBanner end-->
<div class="superiority">
  <div class="box">
    <p style="font-size:18px; color:#7d7d7d; margin:48px 0 78px 0;">Raksmart的合作伙伴都是全球领先的技术公司，公司列表如下： </p>
	<h3>硬件伙伴:</h3>
        <ul class="partner">
        	<li>
	<img src="/wanyun/Modules/Home/Tpl/images/cisco.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/dell.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/juniper.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/huawei.jpg" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/intel.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/supermicr.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/radware.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/emc.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/jaf.gif" /> 
</li>    	</ul><h3>软件伙伴:</h3>
        <ul class="partner">
        	<li>
	<img src="/wanyun/Modules/Home/Tpl/images/pccw.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/gtt.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/ctc.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/cu.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/cmb.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/he.gif" /> 
</li>    	</ul><h3>解决方案伙伴:</h3>
        <ul class="partner">
        	<li>
	<img src="/wanyun/Modules/Home/Tpl/images/cpanel.jpg" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/plesk.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/onapp.jpg" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/microsoft.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/kvm.jpg" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/rlsoft.jpg" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/redhat.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/vmware.gif" /> 
</li>
<li>
	<img src="/wanyun/Modules/Home/Tpl/images/solusvm.gif" /> 
</li>    	</ul>  </div>
  <!--box end--> 
</div>
<!--superiority end-->

      <div class="box">
	    <%@include file="/WEB-INF/view/client/common/footerMenu.jsp" %>
		<%@include file="/WEB-INF/view/client/common/footer.jsp" %>
		</div>
   <%@include file="/WEB-INF/view/client/common/float_right.jsp" %>
 </body>
</html>