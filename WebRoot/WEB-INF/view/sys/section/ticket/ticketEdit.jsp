<%@ page language="java" pageEncoding="UTF-8"%>
<style>
.file-box{ position:relative;width:340px} 
.txt{ height:22px; border:1px solid #cdcdcd; width:180px;} 
.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;} 
.file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px } 
</style>

<html>
  <body>
    <div id="eDialog" class="easyui-dialog" title="Ticket查看" 
          data-options="modal:true,closed:true"  toolbar="#editTool"
          style="width:610px;height:520px;padding:2px;">
	     <form id="eForm" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	        <input  type="text"  style="display:none;" name="createdate" id="created"></input>
	        <input  type="text"  style="display:none;" name="creator" id="creator"></input>
	    	<table width="96%" class="t2">
	    	  
	    		<tr>
	    			<td align="right"  class="td_left">标题:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="title" id="title" 
	    			  readonly="readonly" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">姓名:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="name" id="name"  readonly="readonly"
	    			 style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">邮件地址:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="email" id="email" 
	    			readonly="readonly" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">紧急类型:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="urgenttype" id="urgenttype" 
	    			readonly="readonly" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">处理:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="isdispose" id="isdispose" 
	    			data-options="required:true,validType:'maxLength[50]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">ip地址:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="ip" id="ip" 
	    			readonly="readonly" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">内容:</td>
	    			<td>
	    			<textarea id="content"   name="content"  rows="100" style="height:200px;width:480px;" readonly="readonly">
					</textarea>
	    			</td>
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
