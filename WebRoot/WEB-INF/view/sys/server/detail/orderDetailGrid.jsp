<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<body>

<div id="toolbar">&nbsp;&nbsp; 
  <form id="qForm" method="post">
 <input type="hidden" id="orderid"  name="orderid"  value="${orderid}">
 <!--   &nbsp; &nbsp; &nbsp;  
<span class="span">服务器名称:</span><input type="text" id="servername"  name="servername"  value="">
<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="query(gID,queryFormID)">查询</a>
    	 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="resetForm(queryFormID)">重置</a> -->
 
<!--  <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="parentAddxx(listeditDialogID,listeditFormID)">新 增</a>
 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deletexxAll();">删 除</a> -->
	</form>	
</div>
 <table id="grids" title="订购详细列表"  fit="true"
	 toolbar="#toolbar" pagination="true"      
     rownumbers="true" fitColumns="true" singleSelect="true">   
    <thead>          
       <tr>
          <th field="servername" width="160" align='left'>服务器名称</th>
          <th field="servertype" width="80"  align='left' >服务器类型</th>
          <th field="hostname" width="80"  align='left' >主机名</th>
           <th field="ns1prefix" width="80"  align='left' >NS1 前缀</th>
            <th field="ns2prefix" width="80"  align='left' >NS2 前缀</th>
             <th field="rootpw" width="80"  align='left' >root密码</th>
             <th field="price" width="80"  align='left' >价格</th>
             <th field="isfinish" width="180"  align='center' formatter='displayIsfinish'>操作</th>
          <th field="id" width="180"  align='center' formatter='getParentHandleStr'>操作</th>
         </tr>
     </thead>
</table>
</body>
</html>
