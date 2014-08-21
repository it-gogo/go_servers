<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="image/vnd.microsoft.icon" rel="shortcut icon" href="images/favicon.ico">
	<script type="text/javascript" src="js/go.js"></script>
	<script type="text/javascript">
		$(function(){
			
			//初始化控制面板
			var tabs_content = $('#tabs_content').tabs({  
			    border:false, 
			    width:'100%', 
			    onSelect:function(title){  
			        //alert(title+' is selected');
			    }  
			});  
			//初始化菜单
			$('#acd_menu').accordion({  
			    animate:true,
			    fit:true
			}); 
			//初始化菜单按钮
			$('a:[id^="item_"]').click(function(event){
				var id = $(this).attr('id');
				var t_title = $(this).attr('title');
				if(tabs_content.tabs('exists', $(this).attr('title'))){
					//选中状态
					tabs_content.tabs('select',t_title);
					//刷新内容
					tabs_content.tabs('update', {
						tab: tabs_content.tabs('getTab',t_title),
						options: {
							content : "<iframe id='content_"+id+"' border='0' frameborder='no' name='inner-frame' onload=\"javascript:dyniframesize('content_"+id+"');\" height='100%' width='100%' src='"+$(this).attr("rel")+"'></iframe>"
						}
					});
          			var ieset = navigator.userAgent;  
					if(ieset.indexOf("MSIE 6.0") > -1)//浏览器判断 如果是IE6
						setTimeout('window.parent["'+id+'"].location.reload();',0);//执行这一方法
				}else{
					$('#tabs_content').tabs('add',{  
					    title:$(this).attr('title'), 
					    id:'tab_'+ id, 
					    content : "<iframe id='content_"+id+"' border='0' frameborder='no' name='inner-frame' onload=\"javascript:dyniframesize('content_"+id+"');\" height='100%' width='100%' src='"+$(this).attr("rel")+"'></iframe>",  
					    closable:true  
					});
				} 
				
				if(id != "item_client_app"){
					$('a:[id^="item_"]').parent().removeClass("seleted_li");
					$(this).parent().addClass("seleted_li");
				}
			});
			//站点模块选择
			$('#select_model').combobox({
				mode:'local',
				editable:false
			});   
			
		});
		
		/**
		*兼容性函数
		*/
		 function dyniframesize(down) { 
			var pTar = null; 
			if (document.getElementById){ 
				pTar = document.getElementById(down); 
			} else{ 
				eval('pTar = ' + down + ';'); 
			} 
			if (pTar && !window.opera){ 
				//begin resizing iframe 
				pTar.style.display="block" 
				if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight){ 
					//ns6 syntax 
					pTar.height =  document.body.scrollHeight - 100; 
					pTar.width = "100%"; 
				} else if (pTar.Document && pTar.Document.body.scrollHeight){ 
					//ie5+ syntax 
					pTar.height = pTar.Document.body.scrollHeight; 
					pTar.width = pTar.Document.body.scrollWidth; 
				} 
			} 
		}
		/**退出系统**/
		function loginOut(){
			$.messager.confirm('提示','确定要退出系统？',function(r){
				if(r){
					window.location.href = '<%=basePath%>authority/login/loginout.htm';
				}
			});
		}
		
	</script>
	<style type="text/css">
		.seleted_li{
			background-color: #FBEC88;
		}
	</style>
  </head>
  
  <body class="easyui-layout">
		<div data-options="region:'north',border:false" id="north-panel" style="overflow: hidden; height: 25px; background: url(images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">
	    	<span style="float:right; padding-right:20px;" class="head">
	    		&nbsp;&nbsp;&nbsp;
	    		欢迎  xxx &nbsp;&nbsp;<a href="javascript:void(0);" onclick="go.window.edit('修改资料','authority/user/edit_curuser.htm',600,400);" id="editoilprice">修改资料</a>
		    	<a href="javascript:void(0);" onclick="loginOut()" id="loginOut">安全退出</a>
	    	</span>
    		<span style="padding-left:10px; font-size: 16px; "><img src="images/blocks.gif" width="20" height="20" align="absmiddle" /> 智汇车管后台管理系统V2.1</span>
	    </div>
		<div data-options="region:'south',border:false" style="overflow: hidden;height:18px;background: url(images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%; line-height: 18px;color: #fff;"align="center">福建和诚智达汽车管理服务有限公司&nbsp;版权所有&nbsp;&nbsp;&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2012-2014&nbsp;hczd&nbsp;Corporation,&nbsp;All&nbsp;Rights&nbsp;Reserved</div>
		<div data-options="region:'west',split:true,title:'导航菜单'" style="width:150px;">
			<!-- 菜单 -->
			<div id="acd_menu" class="easyui-accordion">  
				<%-- <c:forEach items="${default_power.listChild }" var="itm">
					 <div title="${itm.name }" style="overflow:auto;padding:10px;">
					 	<c:forEach items="${ itm.listChild}" var="menu" varStatus="row">
					 		<p>  
						    	<span class="icon-16-category">&nbsp;</span>
						        <a id="item_${row.index }" rel="${menu.url }" href="javascript:void(0);" name="null" title="${menu.name }">${menu.name }</a>
					        </p>
					 	</c:forEach>
					 </div>
				</c:forEach> --%>
				
				<div title="套餐管理" style="overflow:auto;padding:10px;">
			 		<p>  
				    	<span class="icon-16-category">&nbsp;</span>
				        <a id="item1" rel="www.baidu.com" href="javascript:void(0);" name="null" title="百度">百度</a>
				        <a id="item1" rel="www.baidu.com" href="javascript:void(0);" name="null" title="百度2">百度2</a>
				        <a id="item1" rel="www.baidu.com" href="javascript:void(0);" name="null" title="百度3">百度3</a>
			        </p>
				 </div>
			</div> 
			<!-- end 菜单 -->
		</div>
		<div id="tabs_content" data-options="region:'center'">
			<div title="欢迎页面">  
				<iframe id='sd' border='0' frameborder='no' name='inner-frame' height='100%'  width='100%' src='authority/index/welcome.htm'></iframe>
		    </div> 
		</div>
	</body>
</html>
