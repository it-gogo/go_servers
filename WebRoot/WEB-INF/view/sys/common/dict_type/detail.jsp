<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
	table td{
		height:25px;
	}
</style>
<div>
	<fieldset style="height:80%">
		<legend>详细信息</legend>
		<table border="0" width="100%">
			<tr>
				<td align="right" width="20%;">类型名称：</td><td align="left" width="30%;">${tms_dict_Type.name }</td>
				<td align="right" width="20%;">标识：</td><td align="left" width="30%;">${tms_dict_Type.extension }</td>
			</tr>
			<tr>
				<td align="right">状态：</td><td align="left" colspan="3">${tms_dict_Type.status==1?"有效":"禁用"}</td>
			</tr>
			<tr>
				<td align="right">描述：</td><td align="left" colspan="3">${tms_dict_Type.remark }</td>
			</tr>
		</table>
	</fieldset>
	<div style="padding: 10px;text-align: center;">
    	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="javascript:$('#hczd_tms_win_detail').window('close');">确定</a>
    </div>
</div>