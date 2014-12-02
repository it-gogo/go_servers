<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String name=request.getParameter("name");
	request.setAttribute("name", name);
 %>
 <%@include file="/WEB-INF/view/client/common/advertising.jsp" %>
<div class="header">
  <div class="box"> <a class="logo" href="/go_servers/client/main/public.htm">
    <h1>智易推海外服务器托管_美国RAK服务器_美国KT服务器_站群服务器_香港服务器_${name }</h1>
    </a>
    <ul class="menu">
      <li><a href="public.htm">云服务器</a>
         <ul>
            <li class="menuTop"></li>
            <li><a href="public.htm">公有云服务器</a></li>
            <li><a href="private.htm">私有云服务器</a></li>
            <!-- <li><a href="specialOffer.htm">每周特价</a></li> -->         
           </ul>
      </li>
      <li><a href="independence.htm">独立服务器</a>
         <ul>
            <li class="menuTop"></li>
            <li><a href="independence.htm">独立服务器</a></li>
            <li><a href="stations.htm">站群服务器</a></li>
            <li><a href="windows.htm">Windows VPS</a></li>
            <li><a href="linux.htm">Linux VPS</a></li>
            <!-- <li><a href="specialOffer.htm">每周特价</a></li> -->
            <li><a href="HK.htm">HK VPS</a></li>         
           </ul>      
      </li>
      <li><a href="cloudSolutions.htm">解决方案</a>
          <ul>
            <li class="menuTop"></li>
            <li><a href="cloudSolutions.htm">云站点</a></li>
            <li><a href="cloudHosting.htm">云托管</a></li>
            <li><a href="serverHosting.htm">服务器托管</a></li>
            <li><a href="managedServices.htm">服务托管</a></li>         
           </ul>      
	  </li>
     <!--  <li><a href="support.htm">技术支持</a>
         <ul>
            <li class="menuTop"></li>
            <li><a href="support.htm">支持中心</a></li>
            <li><a href="apiDocumentation.htm">API文档</a></li>
            <li><a href="legal.htm">法律信息</a></li>
            <li><a href="faq.htm">FAQs</a></li>         
           </ul>      
      </li> -->
      <li><a href="company.htm">关于我们</a>
         <ul>
            <li class="menuTop"></li>
            <li><a href="company.htm">公司简介</a></li>
            <!-- <li><a href="technology.htm">技术伙伴</a></li> -->         
         </ul>      
      </li>
      <li class="memBtn"> 
          <a href="../login/portal/toLogin.htm" class="btnLogin">登录</a> 
          <a href="../login/portal/registration.htm" class="btnRegister">注册</a> 
      </li>
    </ul>
  </div>
</div>