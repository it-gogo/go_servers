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
			     url:'carcomerica/app/save.htm',  
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
		        		$('#hczd_sys_win_edit').window('close');
				        $('#dg').datagrid('reload');
		        	});
		        }
		    }  
			});
			
			//选中客户情况
			$('#sel_customer').combobox({
				onSelect:function(){
					$.post('customer/customer/ajax_get.htm',{id:$('#sel_customer').combobox('getValue')},function(data){
						//设置申请客户
						$('input:[name="customer_id"]').val(data.id);
						$('input:[name="customer_name"]').val(data.name);
						$('input:[name="sales_man_name"]').val(data.sales_man_name);
					});
				}
			});
		});
		
	</script>
  	<center>
	    <fieldset style="width:600px;">
	    	<legend>用户信息</legend>
	    	<form action="" name="myform" id="app_Form3" method="post">
	    	<table border="0" width="100%" align="center" cellpadding="5px;" >
	    		<input type="hidden"   name="customer_id"/>
	    		<input type="hidden"   name="customer_name"/>
	    		<tr>
	    			<td align="right">客户名称<span class="remark" style="color:red;">&nbsp;*&nbsp;</span>：</td>
	    			<td >
	    				<select id="sel_customer" data-options="valueField:'id',mode:'remote',textField:'name',loader:myloader" class="easyui-combobox" name="sel_customer" style="width:200px;">
	    				</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right">持卡人<span class="remark" style="color:red;">&nbsp;*&nbsp;</span>：</td>
	    			<td ><input type="text" name="app_name" /></td>
	    		</tr>
	    		<tr>
	    			<td align="right">申请额度<span class="remark" style="color:red;">&nbsp;*&nbsp;</span>：</td>
	    			<td ><input type="text" name="position" value="300000"/></td>
	    		</tr>
	    		<tr>
			    	<span style="color:red;" align="right">注：只有营运车用户才能申请</span>
	    		</tr>
	    		<tr>
	    			<td align="right">业务代表<span class="remark" style="color:red;">&nbsp;*&nbsp;</span>：</td>
	    			<td align="left">
	    				<input type="text" value="" name="sales_man_name"/>
	    			</td>
	    		</tr>
	    	</table>
	    	</form>
	    </fieldset>
	    <br />
	    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="javascript:$('#app_Form3').submit();">提交办卡</a>&nbsp;&nbsp;&nbsp;
		<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="javascript:document.myform.reset();">重置信息</a>
    </center>
