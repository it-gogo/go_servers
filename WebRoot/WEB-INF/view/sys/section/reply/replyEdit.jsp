<%@ page language="java" pageEncoding="UTF-8"%>

<html>
  <body>
    <div id="listeDialog" class="easyui-dialog" title="Ticket查看" 
          data-options="modal:true,closed:true"  toolbar="#editTool"
          style="width:610px;height:520px;padding:2px;">
	     <form id="listeForm" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	        <input  type="text"  style="display:none;" name="createdate" id="created"></input>
	        <input  type="text"  style="display:none;" name="creator" id="creator"></input>
	        <input  type="text"  style="display:none;" name="ticketid" id="ticketid"></input>
	        <input  type="text"  style="display:none;" name="replyname" id="replyname"></input>
	        <input  type="text"  style="display:none;" name="replyemail" id="replyemail"></input>
	        <input  type="text"  style="display:none;" name="ip" id="ip"></input>
	        <input type="hidden" id="rowIndex"  name="rowIndex" >
			<input type="hidden" id="tabIndex"  name="tabIndex" >
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
		 <div id="editTool" >
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="submitForm(listediturl,listeditFormID)">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeForm(listeditDialogID,listeditFormID)">关闭</a>
	    </div>
	</div>
	
	
  </body>
</html>
