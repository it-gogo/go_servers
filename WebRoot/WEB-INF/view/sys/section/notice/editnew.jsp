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
				    url:'sys/common/dict_data/save.htm',  
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
				        	$('#go_win_edit').window('close');
				        	$('#dg_dict_data').datagrid('reload');
				        }
				    }  
				});
//-->
</script>
    	<div id="p_edit" style="padding:10px;"> 
    		<form name="myform" action="" id="dict_dataForm" method="post"> 
    			<input type="hidden" value="${common_data.id }" name="id" />
    			<input type="hidden" value="${common_data.type_id }" name="type_id" />
			    <fieldset>
			    	<legend>基本信息</legend>
			    	<table border="0" width="100%" cellpadding="3px">
			    		<tr>
			    			<td align="right">数据名称：</td><td align="left"><input type="text" name="data_name" value="${common_data.data_name }"></td>
			    			<td align="right">数据编号：</td><td align="left"><input type="text" name="order" value="${common_data.order }"></td>
			    		</tr>
			    		<!-- <tr>
			    			<td align="right">是否默认：</td>
			    			<td align="left" colspan="3">
			    				<input value="1" name="checked" type="radio" ${tms_dict_data.checked == 1 ? 'checked="checked"':"" } />默认&nbsp;&nbsp;
			    				<input value="0" name="checked" type="radio" ${tms_dict_data.checked == -1 ? 'checked="checked"':"" } />非默认
			    			</td>
			    		</tr> -->
			    		<tr>
			    			<td align="right">备注：</td>
			    			<td align="left" colspan="3">
			    				<textarea rows="5" cols="50" name="remark">${common_data.remark }</textarea>
			    			</td>
			    		</tr>
			    	</table>
			    </fieldset> 
			    <div style="padding: 10px;text-align: center;">
			    	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="javascript:$('#dict_dataForm').submit();">保存</a>
			    	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#go_win_edit').window('close');">取消</a>
			    </div>
		    </form>
		</div>
