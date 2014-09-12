<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>



  <div id="editTool">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="submitForm(urls,editFormID)">保存</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeForm(editDialogID,editFormID)">关闭</a>
 </div>
 <div id="eDialog" class="easyui-dialog" title="密码修改"
		data-options="modal:true,closed:true" toolbar="#editTool"
		style="width: 500px; height: 300px; padding: 2px;">
		
  </div>
 
