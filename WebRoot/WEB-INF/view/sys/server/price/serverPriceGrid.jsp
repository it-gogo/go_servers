<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<body>

<div id="toolbar">&nbsp;&nbsp; 
  <form id="qForm" method="post">
 <input type="hidden" id="serverId"  name="serverId"  value="${serverId}">
  <!--  &nbsp; &nbsp; &nbsp;  
<span class="span">名称:</span><input type="text" id="name"  name="name"  value="">
<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="query(gID,queryFormID)">查询</a>
    	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="resetForm(queryFormID)">重置</a> -->
 
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="parentAddxx(listeditDialogID,listeditFormID)">新 增</a>
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deletexxAll(urls,gID,editFormID);">删 除</a>
	</form>	
</div>
 <table id="grids" title="价格信息列表"  fit="true"
	 toolbar="#toolbar" pagination="true"      
     rownumbers="true" fitColumns="true" singleSelect="true">   
    <thead>          
       <tr>
          <th field="chk" width="20" align='center' checkbox='true' ></th>
          <th field="name" width="160" align='left'>名称</th>
          <th field="monthlyPrice" width="80"  align='left' >每月价格</th>
          <th field="numMonth" width="80"  align='left' >总共几个月</th>
          <th field="id" width="180"  align='center' formatter='getParentHandleStr'>操作</th>
         </tr>
     </thead>
</table>
</body>
</html>
