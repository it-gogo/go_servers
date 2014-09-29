var urls = "../ticket";
var listurl = urls+"/findlist.htm";
var listediturl = "../reply";

$(document).ready(function(){
	 	listGrid.initGrids(gID,listurl,listGridInfo);
	   //initGrids(gID,listurl);
	   initForm(editDialogID,editFormID);
});

//产生子表格信息
var listGridInfo = {
		//TAB的标题
		listTabTitle:["回复"],
		listFrameUrls:["../reply/redirect.htm"]
};

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



