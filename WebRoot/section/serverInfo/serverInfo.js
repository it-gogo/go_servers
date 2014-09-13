var urls = "../server_info";
var listurl = urls+"/findlist.htm";
var listediturl = "../server_price";
$(document).ready(function(){
//	   initGrids(gID,listurl);
	   listGrid.initGrids(gID,listurl,listGridInfo);
	   initForm(editDialogID,editFormID);
	   initForm(listeditDialogID,listeditFormID);
});
//产生子表格信息
var listGridInfo = {
		//TAB的标题
		listTabTitle:["价格"],
		listFrameUrls:["../server_price/redirect.htm"]
};
//初始化明细的页面
function  initListPage(rowIndex,tabIndex,id,furls,otherParame){
	$("#rowIndex").val(rowIndex);
	$("#tabIndex").val(tabIndex);
	$("#iframe_"+rowIndex+"_"+tabIndex).attr("src",furls[tabIndex]+"?rowIndex="+rowIndex+"&tabIndex="+tabIndex+"&serverId="+id);
}
/**
 * 提交后执行的动作
 * @param formID
 */
function  afterSubmitForm(formID){
	 if(formID==editFormID){
		   reloadData(gID,queryFormID);
	   }else if(formID==listeditFormID){
		   var rowIndex = $("#rowIndex",$("#"+formID)).val();
		   var tabIndex = $("#tabIndex",$("#"+formID)).val();
		   $("#iframe_"+rowIndex+"_"+tabIndex)[0].contentWindow.loadData(gID,queryFormID);
	   }
}
/**
 * 保存前
 * @param formID
 * @returns {Boolean}
 */
function  beforeSubmit(formID){
	if(formID==listeditFormID){
		var serverId=parent.$("#serverId",$("#"+queryFormID)).val();
		alert(serverId)
		$("#serverId",$("#"+formID)).val(serverId);
	}
	return true;
}

