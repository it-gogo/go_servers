<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<body>

<div id="toolbar">&nbsp;&nbsp; 
  <form id="qForm" method="post">
 &nbsp; &nbsp; &nbsp;  <span class="span">名称:</span><input type="text" id="name"  name="name"  value="">
 <input type="hidden" id="type"  name="type"   value="" datatype="integer">
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="query(gID,queryFormID)">查询</a>
    	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="resetForm(queryFormID)">重置</a>
 
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addxx(editDialogID,editFormID)">新 增</a>
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deletexxAll();">删 除</a>
	</form>	
</div>
 <table id="grids" title="数据字典列表"  fit="true"
	 toolbar="#toolbar" pagination="true"      
     rownumbers="true" fitColumns="true" singleSelect="true">   
    <thead>          
       <tr>
          <th field="chk" width="20" align='center' checkbox='true' ></th>
          <th field="name" width="160" align='left'>名称</th>
          <th field="typename" width="80"  align='center' >类型名称</th>
          <th field="price" width="160" align='left'>价格</th>
          <th field="id" width="180"  align='center' formatter='getHandleStr'>操作</th>
         </tr>
     </thead>
</table>
</body>
</html>
