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
    
    <title>加油卡列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="image/vnd.microsoft.icon" rel="shortcut icon" href="images/favicon.ico">
	<script type="text/javascript" src="js/hczd-sys.js"></script>
			<link href="css/uploadify.css" type="text/css" rel="Stylesheet" rev="Stylesheet" />
	<script type="text/javascript" language="javascript" src="js/jquery.uploadify.min.js"></script>
	<script type="text/javascript">
		$(function(){
			/**
			*数据显示
			**/
			$('#dg').datagrid({  
			    url:'card/gas_card/ajax_list.htm', 
			    striped:true,
			    loadMsg:'亲，正在加载ing...',
			    idField:'id',
			    pagination:true,
			    singleSelect:false,
			    fitColumns:true,
			    rownumbers:true,
			    pageSize:15,
			    pageList:[10,15,20,25,30,50,100,150],
			    toolbar: [{
			    	text:'修改',
					iconCls: 'icon-edit',
					handler: function(){
						if($('#dg').datagrid('getSelected') && $('#dg').datagrid('getSelections').length<2){
							hczd_sys.window.edit('修改加油卡','card/gas_card/edit.htm?id=' + $('#dg').datagrid('getSelected').id,600,330);
						}else{
							$.messager.alert('提示','请选择一项进行修改');
						}
					}
				},'-',{
			    	text:'修改优惠区域',
					iconCls: 'icon-edit',
					handler: function(){
						if($('#dg').datagrid('getSelected') && $('#dg').datagrid('getSelections').length<2){
							hczd_sys.window.edit('修改优惠区域','card/gas_card/update_area.htm?id=' + $('#dg').datagrid('getSelected').id,600,250);
						}else{
							$.messager.alert('提示','请选择一项进行修改');
						}
					}
				},'-',{
			    	text:'修改车牌号',
					iconCls: 'icon-edit',
					handler: function(){
						if($('#dg').datagrid('getSelected') && $('#dg').datagrid('getSelections').length<2){
							hczd_sys.window.edit('修改车牌号','card/gas_card/update_vehicle_no.htm?id=' + $('#dg').datagrid('getSelected').id,600,200);
						}else{
							$.messager.alert('提示','请选择一项进行修改');
						}
					}
				},'-',{
			    	text:'油卡信息变更',
					iconCls: 'icon-edit',
					handler: function(){
						if($('#dg').datagrid('getSelected') && $('#dg').datagrid('getSelections').length<2){
							if($('#dg').datagrid('getSelected').status!=2){
								$.messager.alert('提示','该状态下不能修改油卡信息！');
								return false;
							}
							hczd_sys.window.edit('申请油卡信息变更','card/gas_card_change_app_record/update_change.htm?card_no=' + $('#dg').datagrid('getSelected').card_no,600,300);
						}else{
							$.messager.alert('提示','请选择一项进行修改');
						}
					}
				},'-',{
			    	text:'批量修改短信号码',
					iconCls: 'icon-edit',
					handler: function(){
						if($('#dg').datagrid('getSelections').length>0){
							$("#div_receive_tel").window("open");
						}else{
							$.messager.alert('提示','请选择需要修改短信号码的加油卡');
						}
					}
				},'-',{
			    	text:'修改消费短信号码',
					iconCls: 'icon-edit',
					handler: function(){
						if($('#dg').datagrid('getSelected') && $('#dg').datagrid('getSelections').length<2){
							if($('#dg').datagrid('getSelected').status!=2){
								$.messager.alert('提示','该状态下不能修改油卡信息！');
								return false;
							}
							hczd_sys.window.edit('修改消费短信号码','card/gas_card/update_consumption_receive_tel.htm?id=' + $('#dg').datagrid('getSelected').id,400,200);
						}else{
							$.messager.alert('提示','请选择一项进行修改');
						}
					}
				},'-',{
					text:'启用',
					iconCls:'icon-ok',
					handler:function(){
						if($('#dg').datagrid('getSelected') && $('#dg').datagrid('getSelections').length<2){
							if($('#dg').datagrid('getSelected').status=='2'){
								$.messager.alert("提示","该状态已经是正常状态","error");
								return false;
							}
							if($('#dg').datagrid('getSelected').status=='-2'){
								$.messager.alert("提示","启用失败，该卡已经挂失","error");
								return false;
							}
							if($('#dg').datagrid('getSelected').status=='-5'){
								$.messager.alert("提示","启用失败，该卡已经退卡","error");
								return false;
							}
							$.messager.confirm("提示","您确定要启用选择的加油卡吗？",function(b){
								if(b){
									$.post("card/gas_card/update_status.htm?status=2&id=" + $('#dg').datagrid('getSelected').id,"",function(data){
										if(isNaN(data)){
											$.messager.alert("提示",data,"error");
										}else{
											$.messager.alert("提示","操作成功","info");
											$('#dg').datagrid("load");
										}
									});
								}
							});
						}else{
							$.messager.alert('提示','请选择一项');
						}
					}
				},'-',{
					text:'禁用',
					iconCls:'icon-no',
					handler:function(){
						if($('#dg').datagrid('getSelected') && $('#dg').datagrid('getSelections').length<2){
							if($('#dg').datagrid('getSelected').status=='0'){
								$.messager.alert("提示","该状态已经是禁用状态","error");
								return false;
							}
							
							$.messager.confirm("提示","您确定要禁用选择的加油卡吗？",function(b){
								if(b){
									$.post("card/gas_card/update_status.htm?status=0&id=" + $('#dg').datagrid('getSelected').id,"",function(data){
										if(isNaN(data)){
											$.messager.alert("提示",data,"error");
										}else{
											$.messager.alert("提示","操作成功","info");
											$('#dg').datagrid("load");
										}
									});
								}
							});
						}else{
							$.messager.alert('提示','请选择一项');
						}
					}
				},'-',{
					text:'详细',
					iconCls:'icon-tip',
					handler:function(){
						if($('#dg').datagrid('getSelected') && $('#dg').datagrid('getSelections').length<2){
							hczd_sys.window.detail('加油卡详情','card/gas_card/detail.htm?id=' + $('#dg').datagrid('getSelected').id,600,420);
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
			        {field:'status',title:'状态',width:50,formatter:function(value,rowindex,rowdata){
			        	return cardStatus(value);
			        }},
			        {field:'card_no',title:'卡号',width:200,formatter:function(val,rowData,index){
			        	return '<a href="card/gas_card/detail_query.htm?card_no='+rowData.card_no+'">'+rowData.card_no+'</a>';
			        }},
			        {field:'vehicle_no',title:'车牌号',width:80},
			        {field:'area',title:'优惠区域',width:80,align:'center'},
			        {field:'password',title:'油卡密码',width:80,align:'center'},
			        {field:'receive_tel',title:'短信号码',width:120,align:'center'},
			        {field:'main_card_no',title:'主卡',width:160},
			        {field:'balance',title:'余额',width:80},
			        {field:'consump_count',title:'消费总额',width:80},
			        {field:'customer_name',title:'客户',width:80},
			        {field:'registerdate',title:'开卡日期',width:130},
			        {field:'deadline',title:'有效期',width:130},
			        {field:'remark',title:'备注',width:130}
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
		
		// 短信号码修改
		function f_receive_tel(){
			var datas = $('#dg').datagrid('getSelections');
			var ids = "";
			for(var i = 0;i < datas.length;i++){
				if(ids == ""){
					ids += datas[i].id;
				}else{
					ids += ","+datas[i].id;
				}
			}
			var receive_tel = $("#receive_tel").val();
			// 提交
			$.post("card/gas_card/update_receive_tel.htm?receive_tel="+receive_tel+"&ids="+ids,"",function(data){
				if(isNaN(data)){
					$.messager.alert("提示",data,"error");
				}else{
					$.messager.alert("提示","操作成功","info");
					$("#div_receive_tel").window("close");
					$('#dg').datagrid("load");
				}
			});
			
		}
		
		//搜索加载数据
		function search_data(){
			var cb = $("input[name=cb_balance]:checked").val();
			var cb_val="";
			if(cb=='是'){
				cb_val = cb;
			}
			//设置分页时查询条件
			$('#dg').datagrid({
				queryParams: {
					name:$('#customer_name').val(),
					card_no:$("#card_no").val(),
					vehicle_no:$("#vehicle_no").val(),
					status:$("#status").combobox("getValue"),
					start_time:$("#start_date").datetimebox('getValue'),
					end_time:$("#end_date").datetimebox('getValue'),
					cb:cb_val
				}
			});
		}
		
		//导出excel
		function exportExcel(){
			var cb = $("input[name=cb_balance]:checked").val();
			var cb_val="";
			if(cb=='是'){
				cb_val = cb;
			}
			var name = $('#customer_name').val();
			var card_no = $("#card_no").val();
			var vehicle_no = $("#vehicle_no").val();
			var status = $("#status").combobox("getValue");
			window.location.href = '<%=basePath %>/card/gas_card/excel_gas_card_list.htm?name=' + name + '&card_no=' + card_no + '&vehicle_no=' + vehicle_no + '&status=' + status + '&cb=' + cb_val;
			
		}
		
		//判断车辆状态
		function cardStatus(status){
			if(status == "-2"){
				return "<span style='color:blue;'>挂失</span>";
			}else if(status == "-1"){
				return "<span style='color:blue;'>申请解挂失</span>";
			}else if(status == "-3"){
				return "<span style='color:blue;'>申请换卡</span>";
			}else if(status == "-4"){
				return "<span style='color:blue;'>申请退卡</span>";
			}else if(status == "2"){
				return "<span style='color:green;'>正常</span>";
			}else if(status == "0"){
				return "<span style='color:red;'>禁用</span>";
			}else if(status == "-5"){
				return "<span style='color:blue;'>退卡</span>";
			}else{
				return "<span style='color:gray;'>未知</span>";
			}
		}
	</script>
  </head>
  
  <body>
  	<div id="cc" class="easyui-layout" style="width:100%;height:100%; padding: 0;margin: 0;" fit="true">  
	  	 <div data-options="region:'north',title:'搜索',split:true,collapsible:false" style="height:110px;padding: 10px;">
	  	 	加油卡号：<input type="text" value="" id="card_no" />
	  	 	客户名称：<input type="text" value="" id="customer_name" />
	  	 	消费数据统计开始时间：<input name="start_time" class="easyui-datetimebox"  style="width:150px" type="text" value="" id="start_date" />
	  	 	结束时间：<input name="end_time" type="text" class="easyui-datetimebox" value="" style="width:150px" id="end_date" />
	  	 	<br />
	  	 	车&nbsp;&nbsp;牌&nbsp;号：<input type="text" value="" id="vehicle_no" />
	  	 	油卡状态：
	  	 	<select id="status" class="easyui-combobox" data-options="editable:false" style="width:130px;" >
	  	 		<option value="">--请选择--</option>
	  	 		<option value="-2">挂失</option>
	  	 		<option value="-1">申请解挂失</option>
	  	 		<option value="-3">申请换卡</option>
	  	 		<option value="-4">申请退卡</option>
	  	 		<option value="2">正常</option>
	  	 		<option value="0">禁用</option>
	  	 		<option value="-5">退卡</option>
	  	 	</select>
	  	 	<a id="btn" href="javascript:void(0);" onclick="search_data()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
	  	 	<a id="btn" href="javascript:void(0);" onclick="exportExcel()" class="easyui-linkbutton" data-options="iconCls:'icon-excel'">导出Excel</a>
	  	 	<input type="checkbox" id="cb_balance" name="cb_balance" value="是" onclick="search_data();"  />只显示余额为负数的加油卡
	  	 </div>
	  	 <div data-options="region:'center'">
	  	 	<table id="dg" fit="true"></table>
	  	 </div>
	  	 <div id="div_receive_tel" title="短信号码修改">
	  	 	<table align="center">
	  	 		<tr>
	  	 			<td align="center">新号码：<input type="text" id="receive_tel" value="" /></td>
	  	 		</tr>
	  	 		<tr>
	  	 			<td align="center"><a href="javascript:void(0);" id="bu_receive_tel" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="f_receive_tel();">修改</a></td>
	  	 		</tr>
	  	 	</table>
	  	 </div>
  	</div>
  </body>
</html>