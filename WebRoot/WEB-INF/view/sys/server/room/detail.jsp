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
			     url:'sys/server/server_room/save.htm',  
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
	    		<input type="hidden" name="id" value="${go_server_room.id}"/>
	    		<tr>
	    			<td align="right">机房名<span class="remark" style="color:red;">&nbsp;*&nbsp;</span>：</td>
	    			<td >${go_server_room.name}</td>
	    			<td align="right">机房描述<span class="remark" style="color:red;">&nbsp;*&nbsp;</span>：</td>
	    			<td >${go_server_room.descript}</td>
	    		</tr>
	    		<tr>
	    			<td align="right">机房地址<span class="remark" style="color:red;">&nbsp;*&nbsp;</span>：</td>
	    			<td >${go_server_room.address}</td>
	    		</tr>
	    	</table>
	    	</form>
	    </fieldset>
	    <br />
    </center>
