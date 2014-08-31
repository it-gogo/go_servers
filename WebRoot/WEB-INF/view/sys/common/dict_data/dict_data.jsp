<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>数据字典管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="image/vnd.microsoft.icon" rel="shortcut icon" href="images/favicon.ico">
	<script type="text/javascript" src="js/go.js"></script>
	<script type="text/javascript">
		//缓存当前管理的数据字典类型
		var type_id = "";
		$(function(){
			/**
			*数据字典类型显示
			**/
			$('#dg_dict_type').datagrid({  
			    url:'sys/common/data_type/all_ajax_list.htm', 
			    striped:true,
			    loadMsg:'亲，正在加载ing...',
			    idField:'id',
			    singleSelect:true,
			    fitColumns:true,
			    rownumbers:true,
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
						if($('#dg_dict_type').datagrid('getSelected')){
							go.window.edit('修改数据字典类型','sys/common/data_type/edit.htm?id=' + $('#dg_dict_type').datagrid('getSelected').id,600,400);
						}else{
							$.messager.alert('提示','请选择一项进行查看详情');
						}
					}
				},'-',{
					text:'删除',
					iconCls:'icon-no',
					handler:function(){
						if($('#dg_dict_type').datagrid('getSelected')){
							$.messager.confirm('提示','确定要删除所选？',function(r){
								if(r){
									$.post('sys/common/data_type/delete.htm',{id:$('#dg_dict_type').datagrid('getSelected').id},function(data){
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
								        	$('#dg_dict_type').datagrid('reload');
								        	$('#dg_dict_data').datagrid('reload');
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
						if($('#dg_dict_type').datagrid('getSelected')){
							go.window.detail('数据字典类型详情','sys/common/data_type/detail.htm?id=' + $('#dg_dict_type').datagrid('getSelected').id,600,400);
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
			        {field:'name',title:'数据字典类型名称',width:200}
			    ]],
			    onSelect:function(rowindex,rowdata){
			    	//设置当前选中的类型id
			    	type_id = rowdata.id;
			    	$('#dg_dict_data').datagrid('load',{'type_id':rowdata.id});
			    } 
			}); 
			
			/**数据字典数据**/
			$('#dg_dict_data').datagrid({  
			    url:'sys/common/dict_data/type_ajax_list.htm', 
			    striped:true,
			    loadMsg:'亲，正在加载ing...',
			    idField:'id',
			    singleSelect:true,
			    rownumbers:true,
			    fitColumns:true,
			    toolbar: [{
			    	text:'新增',
					iconCls: 'icon-add',
					handler: function(){
						//多种编辑框
						go.window.edit('添加数据字典数据','sys/common/dict_data/add.htm?type_id='+ type_id,600,400);
					}
				},'-',{
			    	text:'修改',
					iconCls: 'icon-edit',
					handler: function(){
						if($('#dg_dict_data').datagrid('getSelected')){
							go.window.edit('修改数据字典数据','sys/common/dict_data/edit.htm?id=' + $('#dg_dict_data').datagrid('getSelected').id,600,400);
						}else{
							$.messager.alert('提示','请选择一项进行查看详情');
						}
					}
				},'-',{
					text:'删除',
					iconCls:'icon-no',
					handler:function(){
						if($('#dg_dict_data').datagrid('getSelected')){
							$.messager.confirm('提示','确定要删除所选？',function(r){
								if(r){
									$.post('sys/common/dict_data/delete.htm',{id:$('#dg_dict_data').datagrid('getSelected').id},function(data){
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
								        	$('#dg_dict_data').datagrid('reload');
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
						if($('#dg_dict_data').datagrid('getSelected')){
							go.window.detail('数据字典数据详情','sys/common/dict_data/detail.htm?id=' + $('#dg_dict_data').datagrid('getSelected').id,600,400);
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
			        {field:'data_name',title:'数据字典数据名称',width:150},  
			        {field:'create_time',title:'创建时间',width:150,align:'left'},
			        {field:'update_time',title:'修改时间',width:150,align:'left'},
			        {field:'remark',title:'备注说明',width:150,align:'left'}
			    ]]  
			}); 
			
		});
	</script>
  </head>
  
  <body class="easyui-layout">
    <div data-options="region:'west',title:'数据字典类型'" style="width:310px;">
    	<table id="dg_dict_type"></table>
    </div>
    <div data-options="region:'center',title:'数据字典数据'">
    	<table id="dg_dict_data"></table>
    </div>
  </body>
</html>
