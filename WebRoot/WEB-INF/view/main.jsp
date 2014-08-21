<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	<script type="text/javascript" src="js/hczd-sys.js"></script>
	<script type="text/javascript">
		$(function(){
			//切换模块事件
			$('#select_model').combobox({onSelect:function(data){
				if(data.value){
					top.window.location.href = "sys/authority/index/index.htm?power_id=" + data.value;
				}
			}});
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
				$('a:[id^="item_"]').parent().removeClass("seleted_li");
				$(this).parent().addClass("seleted_li");
			});
			//站点模块选择
			$('#select_model').combobox({
				mode:'local',
				editable:false
			});   
			
			if(0=="${acl.hz_user.name }"){
				$("#editoilprice").click();
			}
			/**
			*定时器读取客户端分配数量
			*/
			/* readClientCount();
			setInterval("readClientCount()", 60000);
			setInterval("showCl()", 500); */
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
					window.location.href = '<%=basePath%>sys/authority/login/loginout.htm';
				}
			});
		}
		
		/**
		*读取客户端数量
		**/
		function readClientCount(){
			$.post('<%=basePath%>card/gas_card_allocation_record/countClientApp.htm',{},function(data){
				$('#client_app').html(data);
			});
		}
		/**
		*提醒消息
		*/
		function showCl(){
			if($('#clinet_app').css('font-color') && $('#clinet_app').css('font-color') == 'white'){
				$('#client_app').css('font-color','red');
			}else{
				$('#client_app').css('font-color','white');
			}
		}
		/***系统未读短消息弹出***/
		/* var i_time ;
		$(function(){
			i_time = setInterval("gettip_info()", 3000);
		});
		function gettip_info(){
			$.ajax({url:'sms/sys_message/read_tip_list.htm',type:'GET',
				success:function(data){
					var obj = eval(data);
					$(obj).each(function(idx){
						$.messager.show({
							title:obj[idx].title,
							msg:obj[idx].content + '<br /><a href="' + obj[idx].url + '">相关链接</a>',
							timeout:obj[idx].show_time,
							showType:'slide'
						});
					});
				},
				error:function(){
					//alert('网络异常');
					//clearInterval(i_time);
				}
			});
		} */
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
	    		欢迎 ${acl.hz_user.name}&nbsp;&nbsp;<a href="javascript:void(0);" onclick="hczd_sys.window.edit('修改资料','sys/authority/user/edit_curuser.htm',600,400);" id="editoilprice">修改资料</a>
		    	<!-- &nbsp; 选择模块  -->
		    	<%-- <select id="select_model" class="easyui-combobox" name="dept" style="width:100px;">  
				    <c:forEach items="${listModel }" var="itm">
				    	<option value="${itm.id }" ${itm.id == default_power_id ? 'selected="selected"' : "" } >${itm.name }</option>
				    </c:forEach>
				</select>  --%> 
		    	<a href="javascript:void(0);" onclick="loginOut()" id="loginOut">安全退出</a>
	    	</span>
    		<span style="padding-left:10px; font-size: 16px; "><img src="images/blocks.gif" width="20" height="20" align="absmiddle" /> 和诚智达车队管理服务系统</span>
	    </div>
		<div data-options="region:'south',border:false" style="overflow: hidden;height:30px;background:#A9FACD;padding:10px;">福建和诚智达汽车管理服务有限公司&nbsp;版权所有&nbsp;&nbsp;&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2012-2013&nbsp;hczd&nbsp;Corporation,&nbsp;All&nbsp;Rights&nbsp;Reserved</div>
		<div data-options="region:'west',split:true,title:'导航菜单'" style="width:150px;">
			<!-- 菜单 -->
			<%-- <div id="acd_menu" class="easyui-accordion">  
				<c:forEach items="${default_power.listChild}" var="itm">
					 <div title="${itm.name}" style="overflow:auto;padding:10px;">
					 	<c:forEach items="${itm.listChild}" var="menu" varStatus="row">
					 		<p>  
						    	<span class="icon-16-category">&nbsp;</span>
						        <a id="item_${row.index }" rel="${menu.url }" href="javascript:void(0);" name="null" title="${menu.name }">${menu.name }</a>
					        </p>
					 	</c:forEach>
					 </div>
				</c:forEach>
			</div> --%> 
			<div id="acd_menu" class="easyui-accordion">  
				<c:forEach items="${listModel}" var="itm">
					 <div title="${itm.name}" style="overflow:auto;padding:10px;">
					 	<c:forEach items="${itm.listChild}" var="menu" varStatus="row">
					 		<p>  
						    	<span class="icon-16-category">&nbsp;</span>
						        <a id="item_${row.index }" rel="${menu.url }" href="javascript:void(0);" name="null" title="${menu.name }">${menu.name }</a>
					        </p>
					 	</c:forEach>
					 </div>
				</c:forEach>
			</div> 
			<!-- end 菜单 -->
		</div>
		<div id="tabs_content" data-options="region:'center'">
			<!-- <div title="欢迎页面">  
				<iframe id='sd' border='0' frameborder='no' name='inner-frame' height='100%'  width='100%' src='#'></iframe>
		    </div>  -->
		</div>
	</body>
</html>
