<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
<!--
	//表单信息
				$('#dict_dataForm').form({  
				    url:'system/dict_data/save.htm',  
				    onSubmit: function(){  
				       
				    },  
				    success:function(data){  
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
				        	$.messager.alert('提示','保存成功！','info');
				        	$('#hczd_tms_win_edit').window('close');
				        	$('#dg_dict_data').datagrid('reload');
				        }
				    }  
				});
//-->
</script>
    	<div id="p_edit" style="padding:10px;"> 
    		<form name="myform" action="" id="dict_dataForm" method="post"> 
    			<input type="hidden" value="${tms_dict_data.id }" name="id" />
    			<input type="hidden" value="${tms_dict_data.hz_customer_id }" name="hz_customer_id" />
    			<input type="hidden" value="${tms_dict_data.dict_type_id }" name="dict_type_id" />
			    <fieldset>
			    	<legend>基本信息</legend>
			    	<table border="0" width="100%" cellpadding="3px">
			    		<tr>
			    			<td align="right">数据名称：</td><td align="left"><input type="text" name="name" value="${tms_dict_data.name }"></td>
			    			<td align="right">数据编号：</td><td align="left"><input type="text" name="data_id" value="${tms_dict_data.data_id }"></td>
			    		</tr>
			    		<tr>
			    			<td align="right">是否默认：</td>
			    			<td align="left" colspan="3">
			    				<input value="1" name="checked" type="radio" ${tms_dict_data.checked == 1 ? 'checked="checked"':"" } />默认&nbsp;&nbsp;
			    				<input value="0" name="checked" type="radio" ${tms_dict_data.checked == -1 ? 'checked="checked"':"" } />非默认
			    			</td>
			    		</tr>
			    		<tr>
			    			<td align="right">备注：</td>
			    			<td align="left" colspan="3">
			    				<textarea rows="5" cols="50" name="remark">${tms_dict_data.remark }</textarea>
			    			</td>
			    		</tr>
			    	</table>
			    </fieldset> 
			    <div style="padding: 10px;text-align: center;">
			    	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="javascript:$('#dict_dataForm').submit();">保存</a>
			    	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#hczd_tms_win_edit').window('close');">取消</a>
			    </div>
		    </form>
		</div>
