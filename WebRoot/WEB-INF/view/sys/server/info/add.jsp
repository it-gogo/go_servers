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
    
    <title>添加套餐</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="image/vnd.microsoft.icon" rel="shortcut icon" href="images/favicon.ico">
	<script type="text/javascript" src="js/go.js"></script>
	<style>
		.remark{color: red;}
		
		.td1{text-align: right;}
		
		.dis{background-color: #FFFFDD;}
	</style>
	<script type="text/javascript">
		$(function(){
			//获取CPU配置信息列表
			$('#sel_cpu_info').combobox({
				url:'sys/common/dict_data/ajax_combo_list.htm?extension=CPU',
				valueField:'id',    
   				textField:'data_name',
   				onSelect:function(params){
   					$('#cpu').val($('#sel_cpu_info').combobox("getText"));
   				}	
			});
			
			//获取内存配置信息列表
			$('#sel_memory_info').combobox({
				url:'sys/common/dict_data/ajax_combo_list.htm?extension=MEMORY',
				valueField:'id',    
   				textField:'data_name',
   				onSelect:function(params){
   					$('#memory').val($('#sel_memory_info').combobox("getText"));
   				}	
			});
			
			//获取硬盘配置信息
			$('#sel_disk_info').combobox({
				url:'sys/common/dict_data/ajax_combo_list.htm?extension=DISK',
				valueField:'id',    
   				textField:'data_name',
   				onSelect:function(params){
   					$('#disk').val($('#sel_disk_info').combobox("getText"));
   				}	
			});
		});
	</script>
  </head>
  
  <body>
  		<center>
  		<span style="font-size: 20px;font-weight: bold;">添 加 套 餐</span>
  		<div id="tt" class="easyui-tabs" style="align:center;width: 800px;">  
		    <div title="套餐信息" style="padding:20px;">  
		    	<form action="" method="post" id="server_infoForm" name="server_infoForm" >
		        	<center>
				         <fieldset style="width:600px;" >
				    		<legend>基本信息</legend>
				    		<table border="0" width="100%" align="center" cellpadding="3px;">
				    			<tr>
				    				<td class="td1">套餐名称<span class="remark">&nbsp;*&nbsp;</span>：</td>
				    				<td colspan="3"><input type="text" name="name" size="70" /></td>
				    			</tr>
				    			<tr>
				    				<td class="td1">配置CPU<span class="remark">&nbsp;*&nbsp;</span>：</td>
				    				<td>
				    				<input id="sel_cpu_info" name="cpu">
					    				<input type="hidden" name="cpu" id="cpu" />
				    				</td>
				    				<td class="td1">配置内存<span class="remark">&nbsp;&nbsp;*&nbsp;</span>：</td>
				    				<td>
				    					<input id="sel_memory_info" name="memory">
					    				<input type="hidden" name="memory" id="memory" />
				    				</td>
				    			</tr>
				    			<tr>
				    				<td class="td1">配置硬盘<span class="remark">&nbsp;*&nbsp;</span>：</td>
				    				<td>
				    					<input id="sel_disk_info" name="disk">
					    				<input type="hidden" name="disk" id="disk" />
				    				</td>
				    				<td class="td1">优 惠 方 式<span class="remark">&nbsp;*&nbsp;</span>：</td>
				    				<td>
				    					<input type="radio" value="1" name="discount_type" checked="checked" onclick="monthDiscountType(1);" />特惠积分
				    					<input type="radio" value="0" name="discount_type" onclick="monthDiscountType(1);" />月结积分
				    				</td>
				    			</tr>
				    			<tr><td colspan="4" align="right" id="monthDiscountType_1"></td></tr>
				    			<tr>
				    				<td class="td1">身份证号码<span class="remark">&nbsp;*&nbsp;</span>：</td>
				    				<td colspan="3">
				    					<input type="text" name="identity_no" value="" size="70" />
				    				</td>
				    			</tr>
				    			<tr>
				    				<td class="td1">接收短信<span class="remark">&nbsp;&nbsp;&nbsp;</span>：</td>
				    				<td>
				    					<select id="isgetphone" name="issend_sms" style="width:150px;" class="easyui-combobox"
				    					 data-options="editable:false,onSelect:function(){if($(this).combobox('getValue')=='0'){$('#span_issend_sms').html('&nbsp;*&nbsp;');}else{$('#span_issend_sms').html('&nbsp;&nbsp;&nbsp;');} }" >
				    						<option value="0">需要</option>
				    						<option value="1">不需要</option>
				    					</select>
				    				</td>
				    				<td class="td1">接收号码<span id="span_issend_sms" class="remark">&nbsp;*&nbsp;</span>：</td>
				    				<td><input type="text" value="" name="mobile" style="width:130px;" onkeypress="return event.keyCode>=48&&event.keyCode<=57"  
												onpaste="return !clipboardData.getData('text').match(/\D/)"  
												ondragenter="return false"  
												style="ime-mode:Disabled" /></td>
				    			</tr>
				    			<tr>
				    				<td class="td1">电子邮件<span class="remark">&nbsp;&nbsp;&nbsp;</span>：</td>
				    				<td><input type="text" value="" name="email" style="width:150px;" /></td>
				    				<td class="td1">客户来源<span class="remark">&nbsp;*&nbsp;</span>：</td>
				    				<td>
				    					<select id="mysource" name="source" style="width:130px;" class="easyui-combobox" data-options="editable:false">
				    						<c:forEach items="${listDict_Data }" var="itm">
				    							<option value="${itm.id }">${itm.name }</option>
				    						</c:forEach>
				    					</select>
				    				</td>
				    			</tr>
				    			<tr>
				    				<td class="td1">联系人<span class="remark">&nbsp;*&nbsp;</span>：</td>
				    				<td>
				    					<input type="text" name="listLinkman[0].name" value="" style="width:150px;" />
				    					<input type="hidden" name="listLinkman[0].postion" value="联系人" />
				    				</td>
				    				<td class="td1">联系电话<span class="remark">&nbsp;*&nbsp;</span>：</td>
				    				<td><input type="text" name="listLinkman[0].tel" value="" style="width:130px;" /></td>
				    			</tr>
				    			<tr>
				    				<td class="td1">联系地址<span class="remark">&nbsp;*&nbsp;</span>：</td>
				    				<td colspan="3">
				    					&nbsp;<input type="hidden" name="listLinkman[0].addr" id="sel_link" value="" />
				    				</td>
				    			</tr>
				    			<tr>
				    				<td class="td1">备注<span class="remark">&nbsp;&nbsp;&nbsp;</span>：</td>
				    				<td colspan="3">
				    					<textarea name="remarks" rows="3" cols="58"></textarea>
				    				</td>
				    			</tr>
				    			<tr>
				    				<td class="td1"></td>
				    				<td colspan="3">
				    					<span class="remark_msg"></span>
				    				</td>
				    			</tr>
				    		</table>
				    	</fieldset>
				    	<br />
				    	<a id="btnSave" href="javascript:void(0);" onclick="$('#server_infoForm').submit();" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a>&nbsp;&nbsp;&nbsp;
				    	<a id="btnCancel" href="javascript:void(0);" onclick="myreset('server_infoForm')" class="easyui-linkbutton" data-options="iconCls:'icon-reload'">重置</a>
		    		</center>
		    	</form>
		    </div>
		    <!-- end 个人客户 -->
		</div> 
    	</center>
  </body>
</html>
