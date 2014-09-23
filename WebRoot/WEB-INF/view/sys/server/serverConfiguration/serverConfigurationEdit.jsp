<%@ page language="java" pageEncoding="UTF-8"%>
  
<html>
  <body>
    <div id="eDialog" class="easyui-dialog" title="数据字典编辑" 
          data-options="modal:true,closed:true"  toolbar="#editTool"
          style="width:610px;height:520px;padding:2px;">
	     <form id="eForm" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	        <input  type="text"  style="display:none;" name="type" id="type"></input>
	    	<table width="96%" class="t2">
	    	  
	    		<tr>
	    			<td align="right"  class="td_left">类型名称:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="typename" id="typename"  readonly
	    			data-options="required:true,validType:'maxLength[50]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">名称:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="name" id="name" 
	    			data-options="required:true,validType:'maxLength[50]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">价格:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="price" id="price" 
	    			data-options="required:true,validType:'maxLength[50]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
						<td align="right" class="td_left">描述:</td>
						<td><textarea name="description" id="description" style="height:60px;width: 410px;"
						class="easyui-validatebox" data-options="validType:'maxLength[200]'" ></textarea></td>
					</tr>
					<tr>
						<td align="right" class="td_left">优先级:</td>
						<td><input class="easyui-validatebox" type="text" name="seq" id="seq" style="width:410px;" class="easyui-validatebox" data-options="validType:'isNumber[8]'" /></td>
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
