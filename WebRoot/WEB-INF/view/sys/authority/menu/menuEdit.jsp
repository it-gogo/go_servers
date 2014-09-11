<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>菜单添加修改页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  <body>
     <div id="eDialog" class="easyui-dialog" title="菜单编辑" 
          data-options="modal:true,closed:true"  toolbar="#editTool"
          style="width:500px;height:400px;padding:5px;">
		<!-- <div style="padding:5px 3px 10px 10px"> -->
	     <form id="eForm" method="post"  >
	        <input type="hidden" name="number" id="number"  value=""></input>
	        <input class="easyui-validatebox" type="hidden" name="parentnumber" id="parentnumber" value=""></input>
	        <input class="easyui-validatebox" type="text" style="display:none;" name="id" id="id"></input>
	        <input class="easyui-validatebox" type="hidden" name="vo.parentid" id="parentid"></input>
	        <input class="easyui-validatebox" type="hidden" name="seq" id="seq"></input>
	        <!-- <input class="easyui-validatebox" type="hidden" name="isactives" id="isactives" ></input> -->
	    	<table width="90%" class="t2">
	    		<tr>
	    			<td align="right" class="td_left">父菜单:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="pname" id="pname" style="width:250px;" data-options="required:true" readonly="readonly">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">菜单名称:</td>
	    			<td><input class="easyui-validatebox" type="text" name="name" id="name" style="width:250px;" data-options="required:true,validType:'maxLength[50]'"></input></td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">url:</td>
	    			<td><input class="easyui-validatebox" type="text" name="urls" id="urls" style="width:250px;" data-options="required:true,validType:'maxLength[250]'"></input></td>
	    		</tr>
	    		<!-- <tr>
	    			<td align="right" class="td_left">脚本事件名:</td>
	    			<td>
                      <input class="easyui-validatebox" type="text" name="vo.scriptevent" id="scriptevent" style="width:250px;" data-options="required:true,validType:'maxLength[50]'" value="addPanel"></input>
                    </td>
	    		</tr> -->
	    		<tr>
	    			<td align="right" class="td_left">菜单图标:</td>
	    			<td>
                      <input class="easyui-validatebox" type="text" name="imgurl" id="imgurl" style="width:120px;" data-options="validType:'maxLength[250]'"  />
                      <input type="file" name="img" onchange="changeurl(this);" style="width:70px;" />
                      <input type="button" value="上传" onclick="loadImg(this);" />
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
		<!-- </div> -->
		 <div id="editTool" >
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="submitForm(urls,editFormID)">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeForm(editDialogID,editFormID)">关闭</a>
	    </div>
	</div>
  </body>
</html>
