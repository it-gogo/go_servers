var urls = "../server_info";
var listurl = urls+"/findlist.htm";
var listediturl = "../server_price";
//var  bgridID = "bgrids";
//可配置项树的URL
var  treeurl = urls+"/findConfigurationTree.htm";
//取得已经绑定的配置项的URL
var  fcurl =urls+"/findConfiguration.htm";
//保存
var  saveConfigurationUrl = urls+"/saveConfiguration.htm";
//树是否有复选框
treecheckbox = true;
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
		//clearRowChecked(gridID);
		var nodes = $('#tt').tree('getChecked');
		for(var i=0;i<nodes.length;i++){
			var node=nodes[i];
			$("#" + treeID).tree('uncheck', node.target);
		}
		ajaxRequest(fcurl,{"id":ids},function(data){
			for(var i=0;i<data.length;i++){
				var id=data[i].configuration;
				var node = $('#tt').tree('find', id);
				var isleaf = $("#" + treeID).tree('isLeaf', node.target);//判断是否最后节点
				if(!isleaf){
					var nodes = $("#" + treeID).tree('getChildren', node.target);//判断是否最后节点
					for(var j=0;j<nodes.length;j++){
						var n=nodes[j];
						if(n.id==id){
							 $("#"+treeID).tree("check",n.target);
							 break;
						}
					}
				}else{
					 $("#"+treeID).tree("check",node.target);
				}
				//alert(node.text)
			}
			//setRowsChecked(gridID,data,"id");
		});
	}
}

//保存绑定配置项
function  saveConfiguration(url){
	var snumber = $("#snumber").val();
//	var mnumber = getCheckedNodesOfID(treeID,true);
	var tnumber="";//类型id字符串
	var cnumber="";//内容id字符串
	var nodes = $('#tt').tree('getChecked');
	for(var i=0;i<nodes.length;i++){
		var node=nodes[i];
		var isleaf = $("#" + treeID).tree('isLeaf', node.target);//判断是否最后节点
		if(isleaf){
			cnumber+=node.id+",";
		}
	}
//	var  bgids = getCheckeds(gridID);
	ajaxRequest(url,{'id':snumber,'configuration':cnumber},function(data){
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

function treeclick(node){
}