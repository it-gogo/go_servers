<%@ page language="java" pageEncoding="UTF-8"%>
<html>
  <body>
    <div id="eDialog" class="easyui-dialog" title="公司基本信息编辑" 
          data-options="modal:true,closed:true"  toolbar="#editTool"
          style="width:610px;height:520px;padding:2px;">
	     <form id="eForm" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	        <input  type="text"  style="display:none;" name="history" id="history"></input>
	        <input  type="text"  style="display:none;" name="corecompetitiveness" id="corecompetitiveness"></input>
	        <input  type="text"  style="display:none;" name="briefintroduction" id="briefintroduction"></input>
	    	<table width="96%" class="t2">
	    	  
	    		<tr>
	    			<td align="right"  class="td_left">电话:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="telephone" id="telephone" 
	    			data-options="required:true,validType:'mobile'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right"  class="td_left">QQ:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="qq" id="qq" 
	    			data-options="required:true,validType:'maxLength[15]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		
		     </table>
		   </form>
		 <div id="editTool" >
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="submitForm(urls,editFormID)">保存</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="closeForm(editDialogID,editFormID)">关闭</a>
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
      	 $("#content").val(ue.getContent());
      }
      
      
      function  beforeClose(formID){
      	//ue.ready(function() {
      		ue.setContent('');
         // });
      }
      
      function afterLoad(formId,data){
	     var  contentstr = "";
          ue.focus();
           contentstr = $("#content").val();
           ue.execCommand('insertHtml', contentstr);//编辑器家在完成后，让编辑器拿到焦点
	}
     
     function  formsubmits(){
          //ue.sync("listeForm");       //同步内容 
         // alert(ue.getContent());
       if($("#id").val()!=null&&$("#id").val()!=''){
            $("#act").val("updatexx");
        }else{
            $("#act").val("addxx");
        }
         $("#content").val(ue.getContent());
        // $("#content").val(ue.getSource());
         
         //$("#listeForm").submit();   //提交Form 
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
      
     }
</script>
