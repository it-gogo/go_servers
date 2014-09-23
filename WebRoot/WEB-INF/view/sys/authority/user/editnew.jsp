<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<script type="text/javascript">
		$(function(){
			
			//表单信息
			$('#app_Form3').form({  
			     url:'sys/authority/user/save.htm',  
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
		        	$.messager.alert('提示','保存成功！','info',function(){
		        		$('#go_win_edit').window('close');
				        $('#dg').datagrid('reload');
		        	});
		        }
		    }  
			});
			
		});
		
	</script>
  	<center>
	    <fieldset style="width:500px;">
	    	<legend>用户信息</legend>
	    	<form action="" name="myform" id="app_Form3" method="post">
	    	<table border="0" width="100%" align="center" cellpadding="5px;" >
	    		<input type="hidden"   name="customer_id"/>
	    		<input type="hidden"   name="customer_name"/>
	    		<tr>
	    			<td align="right">用户名<span class="remark" style="color:red;">&nbsp;*&nbsp;</span>：</td>
	    			<td ><input type="text" name="username" /></td>
	    			<td align="right">密码<span class="remark" style="color:red;">&nbsp;*&nbsp;</span>：</td>
	    			<td ><input type="password" name="password" /></td>
	    		</tr>
	    		<tr>
	    			<td align="right">名字<span class="remark" style="color:red;">&nbsp;*&nbsp;</span>：</td>
	    			<td ><input type="text" name="position" value=""/></td>
	    			<td align="right">电话<span class="remark" style="color:red;">&nbsp;*&nbsp;</span>：</td>
	    			<td ><input type="text" name="position" value=""/></td>
	    		</tr>
	    	</table>
	    	</form>
	    </fieldset>
	    <br />
	    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="javascript:$('#app_Form3').submit();">提交</a>&nbsp;&nbsp;&nbsp;
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:$('#go_win_edit').window('close');">取消</a>
    </center>
