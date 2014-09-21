<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html>
  <head>
  </head>
  
  <body>
     <div id="bDialog" class="easyui-dialog" title="绑定配置项" 
          data-options="modal:true,closed:true"  toolbar="#bTool"
          style="width:330px;height:480px;padding:0px;">
         <div class="easyui-layout"  data-options="fit:true">
		<div data-options="region:'center'" >
       <table id="bgrids" title="配置项列表"  fit = true  pagination="true"  
           rownumbers="true" fitColumns="true" singleSelect="true">   
     <thead>          
       <tr>
            <th field="id" width="20" align='center' checkbox=true  ></th>
            <th field="name" width="40" align='center'>名称</th>
            <th field="typename" width="40" align='center'>类型名称</th>
         </tr>
     </thead>
     
</table>
</div>
</div>
          
     </div>
      <div id="bTool" >
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveConfiguration(saveConfigurationUrl,bgridID)">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeDialog('bDialog')">关闭</a>
	  </div>
  </body>
</html>

<script type="text/javascript">
 if ($.fn.pagination){
	$.fn.pagination.defaults.beforePageText = '第';
	$.fn.pagination.defaults.afterPageText = '共{pages}页';
	$.fn.pagination.defaults.displayMsg = '';
}
</script>
