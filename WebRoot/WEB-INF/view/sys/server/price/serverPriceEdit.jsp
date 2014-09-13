<%@ page language="java" pageEncoding="UTF-8"%>
<html>
  <body>
    <div id="listeDialog" class="easyui-dialog" title="服务器信息编辑" 
          data-options="modal:true,closed:true"  toolbar="#editTool"
          style="width:610px;height:520px;padding:2px;">
	     <form id="listeForm" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	        <input  type="text"  style="display:none;" name="serverId" id="serverId" value="${serverId }"></input>
	    	<table width="96%" class="t2">
	    		<tr>
	    			<td align="right"  class="td_left">名称:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="name" id="name" 
	    			data-options="required:true,validType:'maxLength[30]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">每月价格:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="monthlyPrice" id="monthlyPrice" 
	    			data-options="required:true,validType:'maxLength[20]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">总共几个月:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="numMonth" id="numMonth" 
	    			data-options="required:true,validType:'maxLength[10]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">是否使用:</td>
	    			<td>
	    			    <select class="easyui-combobox" name="isactives" id="isactives" style="width:250px;">
	    		           <option value="1">是 </option>
	    			       <option value="0"> 否 </option>
	    			    </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">描述:</td>
	    			<td><textarea name="description" id="description" style="width:250px;height:60px;"
	    			class="easyui-validatebox" data-options="validType:'maxLength[200]'" ></textarea></td>
	    		</tr>
		     </table>
		   </form>
		 <div id="editTool" >
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="submitForm(listediturl,listeditFormID)">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeForm(listeditDialogID,listeditFormID)">关闭</a>
	    </div>
	</div>
	
	
  </body>
</html>
