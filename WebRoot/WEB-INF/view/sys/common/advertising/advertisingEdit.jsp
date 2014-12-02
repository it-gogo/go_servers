<%@ page language="java" pageEncoding="UTF-8"%>
  
<html>
  <body>
    <div id="eDialog" class="easyui-dialog" title="广告编辑" 
          data-options="modal:true,closed:true,onClose:function(){hiddenImg();},onOpen:function(){showImg('<%=basePath%>');}"  toolbar="#editTool"
          style="width:610px;height:520px;padding:2px;">
	     <form id="eForm" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	         <input  type="text"  style="display:none;" name="isactives" id="isactives" ></input>
	    	<table width="96%" class="t2">
	    	  
	    		<tr>
	    			<td align="right"  class="td_left">广告名称:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="name" id="name"   
	    			data-options="required:true,validType:'maxLength[50]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">连接地址:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="url" id="url" 
	    			data-options="required:true,validType:'maxLength[200]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">上传:</td>
	    			<td>
	    				<input type="text" id="server_file_upload_img"  alt="服务器图片"  /> 
	    			</td>
	    		</tr>
	    		<tr>	
	    			<input type="hidden" id="imgUrl" name="imgUrl"/>
    				<td align="right" class="td_left">图片:</td>
    				<td id="show_img"><br><br></td>
    				
	    		</tr>
	    		<tr>
						<td align="right" class="td_left">描述:</td>
						<td><textarea name="description" id="description" style="height:60px;width: 410px;"
						class="easyui-validatebox" data-options="validType:'maxLength[200]'" ></textarea></td>
					</tr>
	    		<!-- <tr>
	    			<td align="right" class="td_left">是否启用:</td>
	    			<td>
	    			  <input type="checkbox" name="isactives" id="isactives" checked="checked" value="1" />
	    			</td>
	    		</tr> -->
	    		
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
