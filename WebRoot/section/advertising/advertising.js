var urls = "../advertising";
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

function showImg(url){
	var imgUrl = $('#imgUrl').val();
	if(imgUrl != null && imgUrl != ""){
		$("#show_img").html("<a href='"+url+imgUrl+"' target='_blank'><img src='"+url+imgUrl+"' style='width:50px;height:50px;'/></a>");
	} 
}

function hiddenImg(){
	$("#show_img",'#'+editFormID).html("");
	$('#imgUrl').val("");
}

