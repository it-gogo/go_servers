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
	        <input  type="text"  style="display:none;" name="ticketid" id="ticketid"></input>
	        <input  type="text"  style="display:none;" name="replyname" id="replyname"></input>
	        <input  type="text"  style="display:none;" name="replyemail" id="replyemail"></input>
	        <input  type="text"  style="display:none;" name="ip" id="ip"></input>
	    	<table width="96%" class="t2">
	    		<tr>
	    			<td align="right" class="td_left">内容:</td>
	    			<td>
	    			<textarea id="content"   name="content"  rows="100" style="height:200px;width:480px;" readonly="readonly">
					</textarea>
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
