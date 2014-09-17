<%@ page language="java" pageEncoding="UTF-8"%>
<html>
  <body>
    <div id="eDialog" class="easyui-dialog" title="公司基本信息编辑" 
          data-options="modal:true,closed:true"  toolbar="#editTool"
          style="width:610px;height:520px;padding:2px;">
	     <form id="eForm" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	        <input  type="text"  style="display:none;" name="history" id="history"></input>
	        <input  type="text"  style="display:none;" name="corecompetitiveness" id="corecompetitiveness"></input>
	        <input  type="text"  style="display:none;" name="briefintroduction" id="briefintroduction"></input>
	    	<table width="96%" class="t2">
	    	  
	    		<tr>
	    			<td align="right"  class="td_left">电话:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="telephone" id="telephone" 
	    			data-options="required:true,validType:'mobile'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">QQ:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="qq" id="qq" 
	    			data-options="required:true,validType:'maxLength[15]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		
		     </table>
		   </form>
		 <div id="editTool" >
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="submitForm(urls,editFormID)">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeForm(editDialogID,editFormID)">关闭</a>
	    </div>
	</div>
	
	
  </body>
</html>
