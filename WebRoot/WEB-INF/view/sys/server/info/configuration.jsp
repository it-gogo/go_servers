<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <body>
     <div id="aDialog" class="easyui-dialog" title="权限设置" 
          data-options="modal:true,closed:true"  toolbar="#aTool"
          style="width:300px;height:500px;padding:10px;">
         
		  <%@include file="/section/common/tree.jsp" %>  
		
	 </div>
	  <div id="aTool" >
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveAuth(authurl)">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeDialog('aDialog')">关闭</a>
	  </div>
  </body>
</html>
