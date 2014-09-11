<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<body>

<div id="toolbar">&nbsp;&nbsp; 
<form id="qForm" method="post">
 &nbsp; &nbsp; &nbsp;  <span class="span">菜单名称:</span><input type="text" id="name"  name="name"  value="">
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="query(gID,queryFormID)">查询</a>
    	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="resetForm(queryFormID)">重置</a>
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newMenu(editDialogID)">新 增</a>
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deletexxAll();">删 除</a>
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-up" plain="true" onclick="saveSeq(0);">上 移</a>
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-down" plain="true" onclick="saveSeq(1);">下 移</a>
 <input type="hidden" id="number"  name="number"  value="" datatype="string">
	</form>	
</div>
 <table id="grids" title="菜单列表"  fit="true"
	 toolbar="#toolbar" pagination="true"      
    rownumbers="true" fitColumns="false" singleSelect="true">   
     <thead>          
       <tr>
          <th field="chk" width="20" align='center' checkbox=true  ></th>
          <th field="mnumber" width="60" align='center'>菜单编号</th>
          <th field="name" width="80" align='center'>菜单名称</th>
          <th field="urls" width="180" align='center'>链接地址</th>
          <th field="description" width="70"  align='center'>备注</th>
          <th field="id" width="150"  align='center' formatter='getHandleStr'>操作</th>
         </tr>
     </thead>
</table>

</body>
</html>
