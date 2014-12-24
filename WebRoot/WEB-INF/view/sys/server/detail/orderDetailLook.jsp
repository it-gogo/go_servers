<%@ page language="java" pageEncoding="UTF-8"%>
<html>
  <body>
    <div id="listeDialog" class="easyui-dialog" title="查看订购详细" 
          data-options="modal:true,closed:true"  toolbar="#editTool"
          style="width:750px;height:550px;padding:2px;">
	     <form id="listeForm" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	        <input  type="text"  style="display:none;" name="orderid" id="orderid" ></input>
	        <input type="hidden" id="rowIndex"  name="rowIndex" >
			<input type="hidden" id="tabIndex"  name="tabIndex" >
	    	<table width="96%" class="t2">
	    		<tr>
	    			<td align="right"  class="td_left">服务器名称:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="servername" id="servername" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    			<td align="right"  class="td_left">服务器类型:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="servertype" id="servertype" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">CPU:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="cpu" id="cpu" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    			<td align="right"  class="td_left">内存:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="memory" id="memory" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">硬盘:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="disk" id="disk" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    			<td align="right"  class="td_left">流量:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="flow" id="flow" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">IP数量:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="ipNum" id="ipNum" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    			<td align="right"  class="td_left">主机名:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="hostname" id="hostname" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">NS1 前缀:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="ns1prefix" id="ns1prefix" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    			<td align="right"  class="td_left">NS2 前缀:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="ns2prefix" id="ns2prefix" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">root密码:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="rootpw" id="rootpw" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    			<td align="right"  class="td_left">价格:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="price" id="price" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">季度:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="quarter" id="quarter" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    			<td align="right"  class="td_left">到期时间:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="maturity" id="maturity" readonly="readonly" style="width:250px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">可配置项:</td>
	    			<td colspan="3"><textarea name="configuration" id="configuration" style="width:620px;height:100px;" readonly="readonly" ></textarea></td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">审核结果:</td>
	    			<td colspan="3"><textarea name="result" id="result" style="width:620px;height:100px;"  readonly="readonly"   ></textarea></td>
	    		</tr>
		     </table>
		   </form>
		 <div id="editTool" >
	    	<!-- <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="submitForm(listediturl,listeditFormID)">保存</a> -->
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeForm(listeditDialogID,listeditFormID)">关闭</a>
	    </div>
	</div>
	
	
  </body>
</html>
