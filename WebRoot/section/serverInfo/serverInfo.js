var urls = "../server_info";
var listurl = urls+"/findlist.htm";
var listediturl = "../server_price";
//var  bgridID = "bgrids";
//可配置项树的URL
var  treeurl = urls+"/findConfigurationTree.htm";
//取得已经绑定的配置项的URL
var  fcurl =urls+"/findConfiguration.htm";
//保存
var  saveConfigurationUrl = urls+"/saveConfigurationType.htm";
//var  binguserlisturl = urls+"/findAllConfigurationType.htm";

$(document).ready(function(){
	   listGrid.initGrids(gID,listurl,listGridInfo);
	   initForm(editDialogID,editFormID);
	   initForm(listeditDialogID,listeditFormID);
	   initTree(treeID,treeurl);
	   //initGrids(bgridID,binguserlisturl);
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

//绑定配置项
function  openConfiguration(ids,gridID){
	
	var snumber = $("#snumber").val();
	openDialog("aDialog");
	if(ids!=snumber){
		$("#snumber").val(ids);
		clearRowChecked(gridID);
		ajaxRequest(buserurl,{"id":ids},function(data){
			setRowsChecked(gridID,data,"id");
		});
	}
}

//保存绑定配置项
function  saveConfiguration(url,gridID){
	var snumber = $("#snumber").val();
	var  bgids = getCheckeds(gridID);
	ajaxRequest(url,{'id':snumber,'configurationType':bgids},function(data){
		if(data.status=="unvalid"){
        	location.href="../errors/sessionError.jsp"
            }else{
            	$.messager.alert("信息",data.message,"info");
           }
		   //alertInfo(data.message);
	});
}

//操作信息
function  getHandleStr(value,row,index){
    var  handstr = "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='openConfiguration("+value+",treeID);'>[绑定配置项]</a>&nbsp;"+
    				"<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='loadxx(urls,"+value+",editFormID);'>[修 改]</a> "+
                   "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='deletexx(urls,"+value+",editFormID);'>[删 除]</a>";
    if(row.isactives==1){
 	     handstr += "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='changestat(urls,"+value+",0,\"是否禁用\",editFormID);'>[禁 用]</a>&nbsp;&nbsp;";
    }else{
 	     handstr += "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='changestat(urls,"+value+",1,\"是否启用\",editFormID);'>[启 用]</a>&nbsp;&nbsp;";
    }
    return  handstr;
}
