var urls = "../server_order";
var listurl = urls+"/findlist.htm";
var listediturl = "../server_detail";

$(document).ready(function(){
	   listGrid.initGrids(gID,listurl,listGridInfo);
	   initForm(editDialogID,editFormID);
	   initForm(listeditDialogID,listeditFormID);
});
//产生子表格信息
var listGridInfo = {
		//TAB的标题
		listTabTitle:["详细"],
		listFrameUrls:["../server_detail/redirect.htm"]
};
//初始化明细的页面
function  initListPage(rowIndex,tabIndex,id,furls,otherParame){
	$("#rowIndex").val(rowIndex);
	$("#tabIndex").val(tabIndex);
	$("#iframe_"+rowIndex+"_"+tabIndex).attr("src",furls[tabIndex]+"?rowIndex="+rowIndex+"&tabIndex="+tabIndex+"&orderid="+id);
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



//操作信息
function  getHandleStr(value,row,index){
    var  handstr ="<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='loadxx(urls,"+value+",editFormID);'>[查 看]</a> ";
    return  handstr;
}

function treeclick(node){
}
function tttclick(node){
	if(node.id!=0){
	       $("#serverTypeId","#"+queryFormID).val(node.id);
		}else{
			$("#serverTypeId","#"+queryFormID).val("");
		}
	    /*$("#typename","#"+editFormID).val(node.text);*/
//	    $("#serverTypeId","#"+editFormID).val(node.id);
	$("#serverTypeId","#"+editFormID).val('select', node.id);
	    loadData(gID,queryFormID);
}

function beforeaddxx(){
	var node = getSelectTreeNode("ttt");
	if(node==null||node.id==0){
		alertWarn("请选择一个服务器类型");
		return false;
	}else{
		$("#serverTypeId","#"+editFormID).val(node.id);
		/*$("#serverTypeId","#"+editFormID).val('select', node.id);*/
	}
	return true;
}


