<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/include.inc.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
	table td{
		height: 25px;
	}
</style>
<div>
	<fieldset style="height:80%">
		<legend>详细信息</legend>
		<table border="0" width="100%">
			<tr>
				<td align="right" width="20%">名称：</td><td align="left" width="30%">${common_data.data_name }</td>
			</tr>
		<%-- 	<tr>
				<td align="right">创建用户：</td><td align="left">${tms_dict_Data.create_user_id }</td>
				<td align="right">创建时间：</td><td align="left">${tms_dict_Data.create_time }</td>
			</tr>
			<tr>
				<td align="right">修改用户：</td><td align="left">${tms_dict_Data.update_user_id }</td>
				<td align="right">修改时间：</td><td align="left">${tms_dict_Data.update_time }</td>
			</tr> --%>
			<tr>
				<td align="right">创建时间：</td><td align="left">${common_data.create_time }</td>
			</tr>
			<tr>
				<td align="right">描述：</td><td align="left" colspan="3">${common_data.remark }</td>
			</tr>
		</table>
	</fieldset>
	<div style="padding: 10px;text-align: center;">
    	<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="javascript:$('#hczd_tms_win_detail').window('close');">确定</a>
    </div>
</div>