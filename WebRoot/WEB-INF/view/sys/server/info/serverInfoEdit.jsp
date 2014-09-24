<%@ page language="java" pageEncoding="UTF-8"%>
<style>
.file-box{ position:relative;width:340px} 
.txt{ height:22px; border:1px solid #cdcdcd; width:180px;} 
.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;} 
.file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px } 
</style>

<html>
  <body>
    <div id="eDialog" class="easyui-dialog" title="服务器信息编辑" 
          data-options="modal:true,closed:true"  toolbar="#editTool"
          style="width:610px;height:520px;padding:2px;">
          
	     <form id="eForm" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	        <!--  <input type="hidden" id="serverTypeId"  name="serverTypeId"   > -->
	    	<table width="96%" class="t2">
	    		<tr>
	    			<td align="right" class="td_left">服务器类型:</td>
	    			<td>
	    			    <select  name="serverTypeId" id="serverTypeId" style="width:410px;">
	    		           <option value="1">公有云服务器 </option>
	    			       <option value="2">私有云服务器</option>
	    			       <option value="3">独立服务器</option>
	    			       <option value="4">站群服务器</option>
	    			       <option value="5">Windows VPS</option>
	    			       <option value="6">Linux VPS</option>
	    			       <option value="7">HK VPS</option>
	    			    </select>
	    			   <!--  <input class="easyui-validatebox" type="text"  id="name"  style="width:410px;"> -->
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">套餐名称:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="name" id="name" 
	    			data-options="validType:'maxLength[40]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">配置CPU:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="cpu" id="cpu" 
	    			data-options="required:true,validType:'maxLength[40]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">配置内存:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="memory" id="memory" 
	    			data-options="required:true,validType:'maxLength[20]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">配置硬盘:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="disk" id="disk" 
	    			data-options="required:true,validType:'maxLength[20]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">流量:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="flow" id="flow" 
	    			data-options="required:true,validType:'maxLength[20]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">IP地址数:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="ipNum" id="ipNum" 
	    			data-options="required:true,validType:'maxLength[20]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">是否使用:</td>
	    			<td>
	    			    <select class="easyui-combobox" name="isactives" id="isactives" style="width:410px;">
	    		           <option value="1">是 </option>
	    			       <option value="0"> 否 </option>
	    			    </select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">描述:</td>
	    			<td><textarea name="description" id="description" style="width:410px;height:60px;"
	    			class="easyui-validatebox" data-options="validType:'maxLength[200]'" ></textarea></td>
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
