<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<%@include file="/section/common/includefile.jsp"%>
<meta http-equiv="cache-control" content="no-cache">

<body>

<div class="easyui-layout"  data-options="fit:'true'">
		<div data-options="region:'west',split:true,title:'菜单树',collapsible:true" 
		  style="width:200px;">
		  <%@include file="/section/common/tree.jsp" %>  
		</div>
		<div data-options="region:'center'">
		 <%@include file="menugrid.jsp" %>  
		</div>
	</div>
<!-- 数据编辑层 -->
<%-- <%@include file="queryDialog.jsp" %> --%>
<%@include file="menuEdit.jsp" %>

</body>
</html>
<script type="text/javascript">
var  treeUrls = "../menu/findMenuTree.htm";
var  urls = "../menu";
var listurl = urls+"/findlist.htm";

$(document).ready(function(){
   initTree(treeID,treeUrls);
   initGrids(gID,listurl);
   initForm(editDialogID,editFormID);
});


 function treeclick(node){
     if(node.id==0){
          $("#number","#"+queryFormID).val("");
     }else{
         $("#number","#"+queryFormID).val(node.id);
     }
     loadData(gID,queryFormID);
 }
   
 function  afterSubmitForm(){
    reloadData(gID,queryFormID);
    loadTreeData(treeID);
 }
 
 function  newMenu(dialogID){
      var  treeNode = $("#tt").tree('getSelected');
      if(treeNode==null){
         alertWarn("请选择一个节点");
      }else{
         submitMethod = "addxx";
         $("#"+dialogID).dialog('open');
         $('#parentnumber').val(treeNode.id);
         $('#pname').val(treeNode.text);
     }
 }
 
 //上移下移
 function  saveSeq(flag){
     var  treeNode = $("#tt").tree('getSelected');
     if(treeNode==null){
        alertWarn("请选择一个节点");
     }else{
         var  number = treeNode.id;
         if(number==0){
         	alertWarn("请选择一子个节点");
         	return ;
         }
	      ajaxRequest('menuAction.action',{'act':'saveSeq','vo.parentnumber':flag,'vo.mnumber':number},function(data){
          	  if(data.status=="unvalid"){
   		  		location.href="../errors/sessionError.jsp"
	    	  }else{
	    	  	$.messager.alert("信息",data.message,"info");
	    	  }
	           loadTreeData(treeID);
	           
	      });
     }
  }
  
  function changeurl(obj){
  	var url1=obj.value;
  	url1=url1.substr(url1.lastIndexOf("\\") + 1);
  	$("#imgurl").val(url1);
  	$("#eForm").unbind("submit");
  }
  
  
  function loadImg(obj){
  	$("#eForm").submit(function() {
    	var inp=$(obj).prev();
    	var str=$(obj).prev().val();
    	var end=str.substr(str.lastIndexOf("\.") + 1);
    	$(obj).after("<input type='hidden' id='actid' name='act' value='loadImg'/>")
    	if(end=="jpg" || end=="png"  || end=="gif"){
	        $("#eForm").ajaxSubmit({
	        	clearForm: false,
	        	url:"personnelManage.action",
	        	data:"act=loadImg",
	        	success:function(responseText){
	        		responseText=responseText.replace(/(^\s*)|(\s*$)/g, "");
	        		if(responseText=="unpass"){
	        			return;
	        		}
	        		$("#eForm").unbind("submit");
	        		inp.val("");
	        		$("#actid").remove();
	        		$.messager.alert("信息","上传成功","info");
	          	}
	        }); 
	        return false;
    	}else{
    		alert("请上传图片格式文件！");
    		$("#eForm").unbind("submit");
    		return false;
    	}
    }); 
    $("#eForm").submit();
  }
  

</script>