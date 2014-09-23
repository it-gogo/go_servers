var urls = "../server_configuration";
var listurl = urls+"/findlist.htm";
var treeurl = "../server_configuration/getServerTree.htm";

$(document).ready(function(){
	 initTree(treeID,treeurl);
	   initGrids(gID,listurl);
	   initForm(editDialogID,editFormID);
});

/**
 * 提交后执行的动作
 * @param formID
 */
function  afterSubmitForm(formID){
   if(submitMethod=="addxx"){
	   resetForm(formID);
   }else if(submitMethod=="updatexx"){
	   closeDialog1(editDialogID,editFormID,true);
   }
   reloadData(gID,queryFormID);
}

function treeclick(node){
	if(node.id!=0){
       $("#type","#"+queryFormID).val(node.id);
	}else{
		$("#type","#"+queryFormID).val("");
	}
    $("#typename","#"+editFormID).val(node.text);
    $("#type","#"+editFormID).val(node.id);
    loadData(gID,queryFormID);
}

function beforeaddxx(){
	var node = getSelectTreeNode(treeID);
	if(node==null||node.id==0){
		alertWarn("请选择一个字典类型");
		return false;
	}else{
	    $("#typename","#"+editFormID).val(node.text);
	    $("#type","#"+editFormID).val(node.id);
	}
	
	return true;
	
}
