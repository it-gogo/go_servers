<%@ page language="java" pageEncoding="UTF-8"%>
<style>
.file-box{ position:relative;width:340px} 
.txt{ height:22px; border:1px solid #cdcdcd; width:180px;} 
.btn{ background-color:#FFF; border:1px solid #CDCDCD;height:24px; width:70px;} 
.file{ position:absolute; top:0; right:80px; height:24px; filter:alpha(opacity:0);opacity: 0;width:260px } 
</style>

  <script>
window.UEDITOR_HOME_URL = "/go_servers/ueditor/";
</script>
<script language="javascript" src="<%=basePath%>/ueditor/ueditor.config.js" ></script>
<script language="javascript" src="<%=basePath%>/ueditor/ueditor.all.min.js" ></script>
  <script language="javascript" src="<%=basePath%>/ueditor/template/template.js" ></script>
  
<html>
  <body>
    <div id="eDialog" class="easyui-dialog" title="通知公告编辑" 
          data-options="modal:true,closed:true,onClose:function(){ue.setContent('');}"  toolbar="#editTool"
          style="width:610px;height:520px;padding:2px;">
		<!-- <div style="padding:5px 3px 10px 10px"> -->
	     <form id="eForm" method="post" >
	        <input  type="text"  style="display:none;" name="id" id="id"></input>
	        <input  type="text"  style="display:none;" name="createdate" id="created"></input>
	        <input  type="text"  style="display:none;" name="creator" id="creator"></input>
	        <input  type="text"  style="display:none;" name="type" id="type"></input>
	    	<table width="96%" class="t2">
	    	  
	    		<tr>
	    			<td align="right"  class="td_left">标题:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="text" name="title" id="title" 
	    			data-options="required:true,validType:'maxLength[50]'" style="width:410px;">
	    			</input>
	    			</td>
	    		</tr>
	    		
	    		
	    		<tr>
	    			<td align="right" class="td_left">内容:</td>
	    			<td>
	    			<input type="hidden" name="content" id="content"  />
	    			<textarea id="editor"   name="editor"  rows="100" style="height:260px;width:480px;">
					</textarea>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left">是否启用:</td>
	    			<td>
	    			  <input type="checkbox" name="isactives" id="isactives" checked="checked" value="1" />
	    			</td>
	    		</tr>
		     </table>
		   </form>
		<!-- </div> -->
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
