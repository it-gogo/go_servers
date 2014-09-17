<%@ page language="java" pageEncoding="UTF-8"%>

  <script>
window.UEDITOR_HOME_URL = "/go_servers/ueditor/";
</script>
<script language="javascript" src="<%=basePath%>/ueditor/ueditor.config.js" ></script>
<script language="javascript" src="<%=basePath%>/ueditor/ueditor.all.min.js" ></script>
  <script language="javascript" src="<%=basePath%>/ueditor/template/template.js" ></script>
  
<html>
  <body>
    <div id="eDialogUE" class="easyui-dialog" title="公司信息编辑" 
          data-options="modal:true,closed:true,onClose:function(){ue.setContent('');}"  toolbar="#editTool"
          style="width:610px;height:520px;padding:2px;">
	     <form id="eFormUE" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	        <input  type="text"  style="display:none;" name="telephone" id="telephone"></input>
	        <input  type="text"  style="display:none;" name="qq" id="qq"></input>
	        <input  type="text"  style="display:none;" name="history" id="history"></input>
	        <input  type="text"  style="display:none;" name="corecompetitiveness" id="corecompetitiveness"></input>
	        <input  type="text"  style="display:none;" name="briefintroduction" id="briefintroduction"></input>
	        <input  type="text"  style="display:none;"  id="updateType"></input>
	    	<table width="96%" class="t2">
	    		<tr>
	    			<td align="right" class="td_left"><span id="name" ></span>:</td>
	    			<td>
	    			<textarea id="editor"   name="editor"  rows="100" style="height:260px;width:480px;">
					</textarea>
	    			</td>
	    		</tr>
		     </table>
		   </form>
		 <div id="editTool" >
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="submitForm(urls,'eFormUE')">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeForm('eDialogUE','eFormUE')">关闭</a>
	    </div>
	</div>
	
	
  </body>
</html>
<script type="text/javascript">
 
   
     var ue;
     $(function(){
	      ue  = UE.getEditor('editor');
          ue.addListener('ready', function( editor ) {
           	
          });
     }); 
   
      function beforeSubmit(formID){
      	var type=$("#updateType").val();
      	 $("#"+type).val(ue.getContent());
      }
      
      
      function  beforeClose(formID){
      		ue.setContent('');
      }
      
      function afterLoad(formId,data){
	     var  contentstr = "";
          ue.focus();
          var type=$("#updateType").val();
           contentstr = $("#"+type).val();
           alert(contentstr)
           ue.execCommand('insertHtml', contentstr);//编辑器家在完成后，让编辑器拿到焦点
	}
     
/*      function  formsubmits(){
       if($("#id").val()!=null&&$("#id").val()!=''){
            $("#act").val("updatexx");
        }else{
            $("#act").val("addxx");
        }
         $("#content").val(ue.getContent());
    if(!$("#listeForm").form('validate')){
		return false;
	}
    $("#listeForm").form('submit',{
        url:'formmxbAction.action',
        
          onSubmit:function(param){
        	//判断是否是AJAX提交的标志
        	param.ajaxFlag = "XMLHttpRequest";
        },
        success:function(data){
            var json = eval('('+data+')');
         $.messager.confirm("询问",json.message,function(r){
                if(r){
             
                document.location.href = 'formzbAction.action';
              }
           
          });
        	
        }
    });
      
     } */
</script>
