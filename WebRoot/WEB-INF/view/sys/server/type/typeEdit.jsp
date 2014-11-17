<%@ page language="java" pageEncoding="UTF-8"%>
  
<html>
  <body>
    <div id="eDialog" class="easyui-dialog" title="服务器类型编辑" 
          data-options="modal:true,closed:true"  toolbar="#editTool"
          style="width:610px;height:520px;padding:2px;">
	     <form id="eForm" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	        <input  type="text"  style="display:none;" name="pid" id="pid"></input>
	    	<table width="96%" class="t2">
	    	  
	    		<tr>
	    			<td align="right"  class="td_left">类型名称:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="name" id="name"  
	    			data-options="required:true,validType:'maxLength[50]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">编码:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="code" id="code" 
	    			data-options="required:true,validType:'maxLength[50]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">是否启用:</td>
	    			<td>
	    			  <input type="checkbox" name="isactives" id="isactives" checked="checked" value="1" />
	    			</td>
	    		</tr>
		     </table>
		   </form>
		<!-- </div> -->
		 <div id="editTool" >
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="submitForm(urls,editFormID)">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeForm(editDialogID,editFormID)">关闭</a>
	    </div>
	</div>
	
	
  </body>
</html>
