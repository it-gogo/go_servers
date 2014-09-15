var urls = "../server_price";
var listurl = urls+"/findlist.htm";

$(document).ready(function(){
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

function beforeaddxx(formID){
	var rowIndex = $("#rowIndex").val();
	var tabIndex = $("#tabIndex").val();
	var row = rows[rowIndex];
	parent.$("#serverId","#"+formID).val(row.id);
	return  true;
}

