var urls = "../companyInfo";
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
	   if(formID=="eFormUE"){
		   closeDialog1("eDialogUE","eFormUE",true);
	   }else{
		   closeDialog1(editDialogID,editFormID,true);
	   }
   }
   reloadData(gID,queryFormID);
}
//加载信息
function  loadxxUE(urls,sn,type){
	var typename="";
	var contentstr="";
	if(type==1){//公司历史
		$("#name","#eFormUE").text("公司历史");
		$("#updateType","#eFormUE").val("history");
		typename="history";
	}else if(type==2){//核心竞争力
		$("#name","#eFormUE").text("核心竞争力");
		$("#updateType","#eFormUE").val("corecompetitiveness");
		typename="corecompetitiveness";
	}else if(type==3){//公司简介
		$("#name","#eFormUE").text("公司简介");
		$("#updateType","#eFormUE").val("briefintroduction");
		typename="briefintroduction";
	}
	//$("#eFormUE").form('load',urls+'/loadxx.htm?id='+sn);
	ajaxRequest(urls+'/loadxx.htm',{'id':sn},function(json){
		$("#eFormUE").setForm(json,"eFormUE");
		contentstr=json[typename];
	});
	$("#eDialogUE").dialog('open');
	submitMethod="updatexx";
	
	ue.focus();
	ue.execCommand('insertHtml', contentstr);//编辑器家在完成后，让编辑器拿到焦点
}
//操作信息
function  getHandleStr(value,row,index){
    var  handstr = "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='loadxx(urls,"+value+",editFormID);'>[修 改]</a> "+
                   "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='loadxxUE(urls,"+value+",1);'>[公司历史]</a> ";
    handstr += "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='loadxxUE(urls,"+value+",2);'>[核心竞争力]</a> ";
    handstr += "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='loadxxUE(urls,"+value+",3);'>[公司简介]</a>&nbsp;";
    return  handstr;
}


