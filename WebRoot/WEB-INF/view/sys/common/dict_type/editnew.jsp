<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
<!--
	//表单信息
				$('#dict_typeForm').form({  
				    url:'sys/common/data_type/save.htm',  
				    onSubmit: function(){  
				       
				    },  
				    success:function(data){
				    	alert(data);  
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
				        	//$('#dg_dict_type').datagrid('reload');
				        	$('#dg').datagrid('reload');
				        }
				    }  
				});
//-->
</script>
    	<div id="p_edit" style="padding:10px;"> 
    		<form name="myform" action="" id="dict_typeForm" method="post"> 
    			<input type="hidden" value="${common_type.id }" name="id" />
    			<input type="hidden" value="${common_type.status }" name="status" />
			    <fieldset>
			    	<legend>基本信息</legend>
			    	<table border="0" width="100%" cellpadding="3px">
			    		<tr>
			    			<td align="right">字典类型名称：</td><td align="left"><input type="text" name="name" value="${common_type.name }"></td>
			    			<td align="right">标识：</td><td align="left"><input type="text" name="extension" value="${common_type.extension }"></td>
			    		</tr>
			    		<tr>
			    			<td align="right">备注：</td>
			    			<td align="left" colspan="3">
			    				<textarea rows="5" cols="50" name="description">${common_type.description }</textarea>
			    			</td>
			    		</tr>
			    	</table>
			    </fieldset> 
			    <div style="padding: 10px;text-align: center;">
			    	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="javascript:$('#dict_typeForm').submit();">保存</a>
			    	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#go_win_edit').window('close');">取消</a>
			    </div>
		    </form>
		</div>
