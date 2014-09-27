<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<body>

<div id="toolbar">&nbsp;&nbsp; 
  <form id="qForm" method="post">
 &nbsp; &nbsp; &nbsp;  <span class="span">订购人:</span><input type="text" id="ordername"  name="ordername"  value="">
 &nbsp; &nbsp; &nbsp;  <span class="span">订购人电话:</span><input type="text" id="ordertelephone"  name="ordertelephone"  value="">
 <!-- <input type="hidden" id="serverTypeId"  name="serverTypeId"   value="" datatype="integer"> -->
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="query(gID,queryFormID)">查询</a>
    	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="resetForm(queryFormID)">重置</a>
 
<!--  <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addxx(editDialogID,editFormID)">新 增</a>
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deletexxAll();">删 除</a> -->
	</form>	
</div>
 <table id="grids" title="订购信息列表"  fit="true"
	 toolbar="#toolbar" pagination="true"      
     rownumbers="true" fitColumns="true" singleSelect="true">   
    <thead>          
       <tr>
          <th field="chk" width="20" align='center' checkbox='true' ></th>
          <th field="ordername" width="160" align='left'>订购人</th>
          <th field="ordertelephone" width="80"  align='left' >订购人电话</th>
          <th field="status" width="80"  align='left' >状态</th>
          <th field="totalprice" width="80"  align='left' >总价</th>
          <th field="createdate" width="80"  align='left' >创建时间</th>
          <th field="id" width="180"  align='center' formatter='getHandleStr'>操作</th>
         </tr>
     </thead>
</table>
</body>
</html>
