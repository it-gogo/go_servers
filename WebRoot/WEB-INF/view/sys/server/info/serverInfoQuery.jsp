<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
    <title>查询窗口</title>
	
	
  </head>
  
  <body>
    <div id="qDialog" class="easyui-dialog" title="查询" 
          data-options="modal:true,closed:true"  toolbar="#qTool"
          style="width:350px;height:150px;padding:10px;">
       <form id="qForm" method="post">
          <table width="100%" class="t2">
            <tr>
              <td class="td_left">
                标题 
              </td>
              <td>
                 <input type="text" id="a.title"  name="title"  value="">
              </td>
            </tr>
          </table>
         
          
       </form>
    </div>
     <div id="qTool" >
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="query(queryDialogID,gID,queryFormID)">查询</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeForm(queryDialogID,queryFormID)">关闭</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="resetForm(queryFormID)">重置</a>
	 </div>
  </body>
</html>
