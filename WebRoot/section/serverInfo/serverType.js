var urls = "../server_type";
var listurl = urls+"/findlist.htm";
//可配置项树的URL
var  treeurl = urls+"/getTypeTree.htm";

$(document).ready(function(){
	   initGrids(gID,listurl);
	   initForm(editDialogID,editFormID);
	   initTree(treeID,treeurl);
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

function beforeaddxx(formID){
	var node = getSelectTreeNode("tt");
	if(node==null){
		alertWarn("请选择一个服务器类型");
		return false;
	}else{
		$("#pid","#"+editFormID).val(node.id);
		/*$("#serverTypeId","#"+editFormID).val('select', node.id);*/
	}
	return true;
}

