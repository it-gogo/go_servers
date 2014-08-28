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
    
    <title>数据字典类型列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="image/vnd.microsoft.icon" rel="shortcut icon" href="images/favicon.ico">
	<script type="text/javascript" src="js/go.js"></script>
	<script type="text/javascript">
		$(function(){
			/**
			*数据显示
			**/
			$('#dg').datagrid({  
			    url:'sys/common/data_type/ajax_list.htm', 
			    striped:true,
			    loadMsg:'亲，正在加载ing...',
			    idField:'id',
			    pagination:true,
			    singleSelect:true,
			    rownumbers:true,
			    pageSize:15,
			    pageList:[10,15,20,25,30,50],
			    toolbar: [{
			    	text:'新增',
					iconCls: 'icon-add',
					handler: function(){
						//多种编辑框
						go.window.edit('添加数据字典类型','sys/common/data_type/add.htm',600,400);
					}
				},'-',{
			    	text:'修改',
					iconCls: 'icon-edit',
					handler: function(){
						if($('#dg').datagrid('getSelected')){
							go.window.edit('修改数据字典类型','sys/common/data_type/edit.htm?id=' + $('#dg').datagrid('getSelected').id,600,400);
						}else{
							$.messager.alert('提示','请选择一项进行查看详情');
						}
					}
				},'-',{
					text:'删除',
					iconCls:'icon-no',
					handler:function(){
						if($('#dg').datagrid('getSelected')){
							$.messager.confirm('提示','确定要删除所选？',function(r){
								if(r){
									$.post('sys/common/data_type/delete.htm',{id:$('#dg').datagrid('getSelected').id},function(data){
										if(isNaN(data)){
											$.messager.show({
												title:'错误提示',
												msg:'<span style="color:red;">' + data + '<span>',
												showType:'show',
												icon:'info',
												style:{
													right:'',
													top:document.body.scrollTop+document.documentElement.scrollTop,
													bottom:''
												}
											});
										}else{
											//保存成功提示
								        	$.messager.alert('提示','删除成功！','info');
								        	$('#dg').datagrid('reload');
										}
									});
								}//end if(r)
							});
						}else{
							$.messager.alert('提示','请选择一项进行查看详情');
						}
					}
				},'-',{
					text:'详细',
					iconCls:'icon-tip',
					handler:function(){
						if($('#dg').datagrid('getSelected')){
							go.window.detail('数据字典类型详情','system/dict_type/detail.htm?id=' + $('#dg').datagrid('getSelected').id,600,400);
						}else{
							$.messager.alert('提示','请选择一项进行查看详情');
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
			        {field:'name',title:'数据字典类型名称',width:200},  
			        {field:'extension',title:'标识',width:200,align:'left'},
			        {field:'status',title:'状态',width:200,align:'center'},
			        {field:'description',title:'备注说明',width:200,align:'left'}
			    ]]  
			}); 
			
		});
		
		//搜索加载数据
		function search_data(){
			//设置分页时查询条件
			$('#dg').datagrid({
				queryParams: {
					name:$('#user_name').val()
				}
			});
			
			$('#dg').datagrid('load',{
				name:$('#user_name').val()
			});
		}
	</script>
  </head>
  
  <body>
  	<div id="cc" class="easyui-layout" style="width:100%;height:100%; padding: 0;margin: 0;">  
	  	 <div data-options="region:'north',title:'搜索',split:true,collapsible:false" style="height:80px;padding: 10px;">
	  	 	名字：<input type="text" value="" name="keyword" id="user_name" />
	  	 	<a id="btn" href="javascript:void(0);" onclick="search_data()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
	  	 </div>
	  	 <div data-options="region:'center'">
	  	 	<table id="dg"></table>
	  	 </div>
  	</div>
  </body>
</html>
