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
    
    <title>用户管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="image/vnd.microsoft.icon" rel="shortcut icon" href="images/favicon.ico">
	<script type="text/javascript" src="js/go.js"></script>
	<link href="css/uploadify.css" type="text/css" rel="Stylesheet" rev="Stylesheet" />
	<script type="text/javascript" language="javascript" src="js/jquery.uploadify.min.js"></script>
	<script type="text/javascript">
		$(function(){
			/**
			*数据显示
			**/
			$('#dg').datagrid({  
			    url:'sys/authority/user/ajax_list.htm', 
			    striped:true,
			    loadMsg:'亲，正在加载ing...',
			    idField:'id',
			    pagination:true,
			    singleSelect:true,
			    fitColumns:true,
			    rownumbers:true,
			    pageSize:15,
			    pageList:[10,15,20,25,30,50,100,150],
			    toolbar: [{
			    	text:'增加',
					iconCls: 'icon-add',
					handler: function(){
						go.window.edit('增加新用户','sys/authority/user/add.htm',550,200);
					}
				},'-',{
			    	text:'修改',
					iconCls: 'icon-edit',
					handler: function(){
						if($('#dg').datagrid('getSelected') && $('#dg').datagrid('getSelections').length<2){
							go.window.edit('修改用户信息','sys/authority/user/edit.htm?id=' + $('#dg').datagrid('getSelected').id,600,330);
						}else{
							$.messager.alert('提示','请选择一项进行修改');
						}
					}
				},'-',{
					text:'帮助',
					iconCls: 'icon-help',
					handler: function(){alert('尚未添加帮助说明...');}
				}],
				selectOnCheck:true,
			    columns:[[  
			        {field:'id',title:'编号',width:50,checkbox:true},  
			        {field:'username',title:'账号',width:80},
			        {field:'status',title:'状态',width:80},
			        {field:'name',title:'名字',width:50},
			        {field:'telephone',title:'电话',width:80},
			    ]],
			    onLoadSuccess:function(data){
			    	// 取消当前表格选中的所有行
					$('#dg').datagrid("clearSelections");
			    }  
			}); 
			
			$("#div_receive_tel").window({
				width:250,
				height:100,
				modal:true,
				collapsible:false,
				minimizable:false,
				maximizable:false,
				closed:true
			});
		});
		
		
		//搜索加载数据
		function search_data(){
			//设置分页时查询条件
			$('#dg').datagrid({
				queryParams: {
					name:$('#name').val()
				}
			});
		}
		
	</script>
  </head>
  
  <body>
  	<div id="cc" class="easyui-layout" style="width:100%;height:100%; padding: 0;margin: 0;" fit="true">  
	  	 <div data-options="region:'north',title:'搜索',split:true,collapsible:false" style="height:80px;padding: 10px;">
	  	 	用户名称：<input type="text" value="" id="name" />
	  	 	<a id="btn" href="javascript:void(0);" onclick="search_data()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
	  	 </div>
	  	 <div data-options="region:'center'">
	  	 	<table id="dg" fit="true"></table>
	  	 </div>
  	</div>
  </body>
</html>
