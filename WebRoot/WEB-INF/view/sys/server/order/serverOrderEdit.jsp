<%@ page language="java" pageEncoding="UTF-8"%>
<style>
.file-box{ position:relative;width:340px} 
.txt{ height:22px; border:1px solid #cdcdcd; width:180px;} 
.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;} 
.file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px } 
</style>

<html>
  <body>
    <div id="eDialog" class="easyui-dialog" title="审核订购信息" 
          data-options="modal:true,closed:true"  toolbar="#editTool"
          style="width:610px;height:520px;padding:2px;">
          
	     <form id="eForm" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	        <input type="hidden" id="portal"  name="portal"   >
	    	<table width="96%" class="t2">
	    		<tr>
	    			<td align="right"  class="td_left">订单人:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="ordername" id="ordername" readonly="readonly" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">订单人电话:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="ordertelephone" id="ordertelephone"  readonly="readonly" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">支付方式:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="payment" id="payment"  readonly="readonly" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">状态:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="status" id="status"  readonly="readonly" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">创建时间:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="createdate" id="createdate"  readonly="readonly" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">总价:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="totalprice" id="totalprice"  readonly="readonly" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">注意事项:</td>
	    			<td><textarea name="notes" id="notes" style="width:410px;height:60px;"
	    			class="easyui-validatebox"  readonly="readonly" ></textarea></td>
	    		</tr>
		     </table>
		   </form>
		 <div id="editTool" >
	    	<!-- <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="submitForm(urls,editFormID)">保存</a> -->
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeForm(editDialogID,editFormID)">关闭</a>
	    </div>
	</div>
	
	
  </body>
</html>
