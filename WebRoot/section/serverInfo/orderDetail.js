var urls = "../server_detail";
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
	parent.$("#rowIndex","#"+formID).val(rowIndex);
	parent.$("#tabIndex","#"+formID).val(tabIndex);
	
	var rows = parent.$("#"+gID).datagrid("getRows");
	var row = rows[rowIndex];
	parent.$("#serverId","#"+formID).val(row.id);
	return  true;
}
function  displayIsfinish(val,row,index){
	if(val==1){
		return "已审核";
	}else{
		return "未审核";
	}
}
//单据明细节操作信息
function  getParentHandleStr(value,row,index){
	var  tabIndex = $("#tabIndex").val();
	//alert(tabIndex);
	var  rowIndex = $("#rowIndex").val();
    var  handstr = "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='parentloadxx(urls,"+value+",listeditFormID,"+rowIndex+","+tabIndex+");'>[查 看]</a> ";
    if(row.seq==2){//支付成功
    	var s="eeForm";
    	handstr+="<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='parentloadxx1(urls,"+value+",\""+s+"\","+rowIndex+","+tabIndex+");'>[审 核]</a> ";
    }
    return  handstr;
}

//加载信息
function  parentloadxx1(urls,sn,formID,rowIndex,tabIndex){
	//parent.loadxx(urls,sn,formID);
	parent.$("#eeDialog").dialog('open');
	ajaxRequest(urls+'/loadxx.htm',{'id':sn,'ajaxFlag':'XMLHttpRequest'},function(json){
		parent.$('#eeForm').setForm(json,'eeForm');
	});
	parent.submitMethod = "checkxx";
	parent.$("#rowIndex","#"+formID).val(rowIndex);
	parent.$("#tabIndex","#"+formID).val(tabIndex);
}
