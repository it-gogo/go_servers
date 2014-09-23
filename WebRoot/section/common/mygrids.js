/**
 * 该脚本功能:
 * 表格的基本
 */

function  initGrids(gId,listurl,qformID){
	//alert($.toJSON(getQueryParame(qformID)));
	var  nurl=listurl;
	/*if(listurl.indexOf("?")){
		nurl = listurl+"&ajaxFlag=XMLHttpRequest";
	}else{
		nurl = listurl+"?ajaxFlag=XMLHttpRequest";
	}*/
	$("#"+gId).datagrid({
		queryParams:getQueryParame(qformID),
        url:nurl,
        //onClickCell:clickCell,
        //onAfterEdit:afterEdit,
        checkOnSelect:false,
        selectOnCheck:false,
        pageSize:20,
        pageList:[20,40,60,80,100],
        loadMsg:'',
        onBeforeLoad : function(param) {
        	//alert($.toJSON(param));
			parent.$.messager.progress({
				text : '数据加载中....'
			});
		},
		
		onLoadSuccess : function(data) {
			parent.$.messager.progress('close');
			if(data.message!='undefined'&&data.message!=null){
				if(data.status=="unvalid"){
					location.href="../errors/sessionError.jsp"
	            }else{
	            	parent.alertInfo(data.message);
	            }
			}
			
			if(typeof(gridafterload)=='function'){
				gridafterload(data,qformID);
			}
		},
		onLoadError:function(){
			//alert(data);
			parent.$.messager.progress('close');
			alertInfo("数据加载错误");
			
		}
   });
}


 
//显示自定义值
function  dispalyFormat(value,row,index){
   if(value==1){
	   return  "<input type='checkbox' checked='true' disabled='true'>";
   }else{
       return  "<input type='checkbox' disabled='false'>";
   }
}

/**
 * 
 * @param rowIndex
 * @param rowData
 * @param changes
 */
function  afterEdit(rowIndex,rowData,changes){
	
}



function  clickCell(index,field,value){
	//alert(endEditing())
  if (endEditing()){
	  editField = field;
      $(this).datagrid('selectRow', index)
              .datagrid('editCell', {index:index,field:field});
      editIndex = index;
  }
	 
}

//显示状态
function  dispalyStatFormat(value,row,index){
       if(value==1){
    	   return  "<input type='checkbox' checked='true' disabled='true'>";
       }else{
    	   return  "<input type='checkbox' disabled='true'>";
       }
}


//重新加载数据,从第一页开始
function  loadData(gridId,queryFormID){
	//alert(getQueryParame(queryFormID));
   $('#'+gridId).datagrid('load',getQueryParame(queryFormID));
}

//重新刷新数据,当前是第几页就是第几页
function  reloadData(gridId,queryFormID){
   $('#'+gridId).datagrid('reload',getQueryParame(queryFormID));
}



//操作信息
function  getHandleStr(value,row,index){
    var  handstr = "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='loadxx(urls,"+value+",editFormID);'>[修 改]</a> "+
                   "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='deletexx(urls,"+value+",editFormID);'>[删 除]</a>";
    if(row.isactives==1){
 	     handstr += "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='changestat(urls,"+value+",0,\"是否禁用\",editFormID);'>[禁 用]</a>&nbsp;&nbsp;";
    }else{
 	     handstr += "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='changestat(urls,"+value+",1,\"是否启用\",editFormID);'>[启 用]</a>&nbsp;&nbsp;";
    }
    return  handstr;
}



//单据操作信息
function  getflowNextHandleStr(value,row,index){
    var  handstr =  // "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='otherHandle(urls,"+value+",\"next\",\"是否提交\",editFormID);'>[提 交]</a> "+
    	            "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='loadxx(urls,"+value+",editFormID);'>[修 改]</a> ";
                   // "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='deletexx(urls,"+value+",editFormID);'>[删 除]</a>";
     return  handstr;
}

//单据审核操作信息
function  getflowPreviousHandleStr(value,row,index){
    var  handstr =  // "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='otherHandle(urls,"+value+",\"next\",\"是否提交\",editFormID);'>[提 交]</a> "+
                    // "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='otherHandle(urls,"+value+",\"previous\",\"是否退回\",editFormID);'>[退 回]</a> "+
                     "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='loadxx(urls,"+value+",editFormID);'>[详 细]</a> ";
                     
     return  handstr;
}

//单据审核操作子表操作信息
function  getlistflowPreviousHandleStr(value,row,index){
	var  tabIndex = $("#tabIndex").val();
	//alert(index);
	var  rowIndex = $("#rowIndex").val();
    var  handstr = "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='parentloadxx(urls,"+value+",listeditFormID,"+rowIndex+","+tabIndex+");'>[详 细]</a> ";
    return  handstr;
}

//单据明细节操作信息
function  getParentHandleStr(value,row,index){
	var  tabIndex = $("#tabIndex").val();
	//alert(tabIndex);
	var  rowIndex = $("#rowIndex").val();
    var  handstr = "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='parentloadxx(urls,"+value+",listeditFormID,"+rowIndex+","+tabIndex+");'>[修 改]</a> "+
                    "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='deletexx(urls,"+value+",editFormID);'>[删 除]</a>";
    return  handstr;
}





//获得表格前多选框信息
function  getCheckeds(gridID){
    var  r = $("#"+gridID).datagrid('getChecked');
    var  sns = "";
    for(var i=0;i<r.length;i++){
       sns += r[i].id+",";
    }
    if(sns.length!=0){
       sns = sns.substring(0,sns.length-1);
    }
    return sns;
}

//获得表格前多选框信息
function  getCheckeds1(gridID,colval){
    var  r = $("#"+gridID).datagrid('getChecked');
    var  sns = "";
    for(var i=0;i<r.length;i++){
       sns += r[i][colval]+",";
    }
    if(sns.length!=0){
       sns = sns.substring(0,sns.length-1);
    }
    return sns;
}

//取得选择的ID
function  getSelectedRow(gridID){
	var  row = $("#"+gridID).datagrid("getSelected");
	return row;
}

function  getColumnVal(gridID,colKey){
	var rowData = getSelectedRow(gridID);
	var colVal = rowData[colKey];
	return colVal;
}

/**
 * 设置行前复选框处于选择状态
 * @param json
 * @param gridID
 */
function  setRowsChecked(gridID,json,colName){
	var rows = getRows(gridID);
	for(var i=0;i<rows.length;i++){
		
		var row = rows[i];
		var id = row[colName];
		
		if(json[id]==id){
			//alert(id);
			setRowChecked(gridID,i);
		}
	}
}

/**
 * 取得当前页所有的行数
 * @param gridID
 * @returns
 */
function  getRows(gridID){
	var rows = $("#"+gridID).datagrid("getRows");
	return rows;
}

/**
 * 清除选择的行
 * @param gridID
 */
function  clearRowChecked(gridID){
	$("#"+gridID).datagrid("clearChecked");
}

function  setRowChecked(gridID,index){
	$("#"+gridID).datagrid("checkRow",index);
}



//每条记录字表的信息
function subGridDetail(index,row,gridID,subGridInfo){
	var w = ($("#"+gridID).width())+"px;";
	var titles = subGridInfo.subTabTitle;
	var  res =  "<div>" +
			      "<div id=\"subTabs_"+index+"\" style=\"padding:1px;width:"+w+"px;height:300px;\">";
			       for(var i=0;i<titles.length;i++){
	                res += "<div title=\""+titles[i]+"\" style=\"padding:1px;\">"+
	                          "<table id='subGrid_"+i+"_"+index+"' ></table>"+
	                       "</div>";
	               
			       }
	     res+=  "</div></div>";
	     //var toolbars = "";
	     var  toolbarArray = subGridInfo.toolBar;
	     for(var i=0;i<titles.length;i++){
	    	 var toolbars =  "<div id=\"toolbar"+i+"_"+index+"\">";
	    	                 for(var j=0;j<toolbarArray.length;j++){
	    	                	var t = toolbarArray[j]["title"];
	    	                	var ids = toolbarArray[j]["id"];
	    	                	var methods = toolbarArray[j]["method"];
				                toolbars += "<a href=\"javascript:void(0)\" id=\""+ids+i+"_"+index+"\"  name=\""+ids+i+"_"+index+"\" iconCls=\"icon-add\"  onclick=\""+methods+"("+i+","+index+");\" >"+t+"</a>";
	    	                 }
				            toolbars += "</div>";
             res +=toolbars;
	     }
	
	return  res;
}

//创建子表格
function  createSubGrid(pgridId,surls,row,index,subGridColArray,subGridIndex){
	$("#subGrid_"+subGridIndex+"_"+index).datagrid({
		url:surls,
		fit:true,
		fitColumns:true,
		checkOnSelect:false,
	    selectOnCheck:false,
	    singleSelect:true,
	    queryParams:getQueryParame(sqForm),
		columns:subGridColArray,
		toolbar:"#toolbar"+subGridIndex+"_"+index,
		onResize:function(){
             $('#'+pgridId).datagrid('fixDetailRowHeight',index);
        }, 
        onLoadSuccess:function(){
            setTimeout(function(){
                $('#'+pgridId).datagrid('fixDetailRowHeight',index);
            },0);
        }
	});
}

/**
 * 创建子表工具栏
 */
function  createSubGridToolBar(index,row,tabIndex,toolBarInfo){
	//alert(toolBarInfo);
	var id = toolBarInfo["id"];
	//alert(id);
	$("#"+id+tabIndex+"_"+index).linkbutton({
	    iconCls: 'icon-search',
		plain:true
	});
}


var  subGrid = {
	initSubGrid:function(gId,listurl,subGridInfo){
		//alert(subGridInfo);
		$("#"+gId).datagrid({
	        url:listurl,
	        checkOnSelect:false,
	        selectOnCheck:false,
//	        queryParams:alert($.toJSON(getQueryParame(sqForm))),
	        queryParams:getQueryParame(queryFormID),
	        view:detailview,
	        detailFormatter:function(index,row){
                return subGridDetail(index,row,gId,subGridInfo);
            },
            onExpandRow:function(index,row){
            	$("#subTabs_"+index).tabs({
            		fit:true
            	});
            	if(typeof(subGridInfo.beforeExtend)!="undefined"&&
            			typeof(subGridInfo.beforeExtend)=='function'){
            		subGridInfo.beforeExtend(index,row,1);
            	}
            	//子表的活页夹标题
            	var  subTabTitle = subGridInfo.subTabTitle;
            	//子表每个页面的列表
            	var  subGridColArray = subGridInfo.subGridCol;
            	
            	var  surls = subGridInfo.getSubUrls(index,row);
            	//工具栏
            	var toolBar = subGridInfo.toolBar;
            	var count = 0;
                for(var i=0;i<subTabTitle.length;i++){
                   var surl = surls[i];
                   var  tabIndex = i+1;
                   for(var j=0;j<toolBar.length;j++){
                	   var  toolBarInfo = toolBar[j];
                	   //创建字表工具栏
                      	createSubGridToolBar(index,row,i,toolBarInfo);
                   }
                   //创建表格
            	   createSubGrid(gId,surl,row,index,subGridColArray[i],i);
                }
            	$('#'+gId).datagrid('fixDetailRowHeight',index);
            }
	   });
	}
};





//子表信息
var listGrid = {
	/**
	 * 
	 * @param gId  表格ID
	 * @param gridUrls 列表的URL
	 * @param listGridInfo 生成二级表格信息
	 */
	initGrids:function(gId,gridUrls,listGridInfo){
		var  nurl=listurl;
		$("#"+gId).datagrid({
			fit:true,
	        url:nurl,
	        checkOnSelect:false,
	        selectOnCheck:false,
	        queryParams:getQueryParame(queryFormID),
	        view:detailview,
	        pageSize:20,
	        pageList:[20,40,60,80,100],
	        loadMsg:'',
	        onBeforeLoad : function(param) {
				parent.$.messager.progress({
					text : '数据加载中....'
				});
			},
			onLoadSuccess : function(data) {
				parent.$.messager.progress('close');
				if(data.message!='undefined'&&data.message!=null){
					//parent.alertInfo(data.message);
					if(data.status=="unvalid"){
						//parent.alertInfo(data.message);
						location.href="../errors/sessionError.jsp"
		            }else{
		            	parent.alertInfo(data.message);
		            }
				}
				
			},
			
			onLoadError:function(){
				parent.$.messager.progress('close');
				alertInfo("数据加载错误");
			},
			
	        detailFormatter:function(index,row){
                return listGrid.listGridDetail(index,row,listGridInfo);
            },
            
            onExpandRow:function(index,row){
            	//子表中列表的URL
            	var furls = listGridInfo.listFrameUrls;
            	var id = row.id;
            	//alert($("#subTabs_"+index).options);
            	//var subTabs = $(this).datagrid('getRowDetail',index).find("div#cc_"+index);
//            	$('#cc_'+index).panel({
//            		height:400,
//            		fit:true
//            	});
//              var subTabs = $(this).datagrid('getRowDetail',index).find("div#subTabs_"+index);
            	$("#subTabs_"+index).tabs({
            		fit:true,
            		id:"s_"+index,
            		onSelect:function(title,tindex){
            			if(typeof(initListPage)=='function'){
            				initListPage(index,tindex,id,furls,row);
            			}
            			setTimeout(function(){
            				 $('#'+gId).datagrid('fixDetailRowHeight',index);
                        },0);
            		}
            	});
            	$('#'+gId).datagrid('fixDetailRowHeight',index);
            },
            onCollapseRow:function(index,row){
            	//$("#iframe_"+index).tabs('destroy');
            }
	   });
	},
	
	/**
	 * 生成二级Tab信息
	 * @param index
	 * @param row
	 * @param listGridInfo
	 */
	listGridDetail:function(index,row,listGridInfo){
		var titles = listGridInfo.listTabTitle;
		//Iframe的URL
		var purls = listGridInfo.listFrameUrls;
		var res =  
			       " <div id=\"cc_"+index+"  style=\"padding:1px;\">"+
//		           " <div data-options=\"region:center\">"+
		           " <div id=\"subTabs_"+index+"\"" +
	               " style=\"width:10px;height:400px;padding:1px;\" >";
	       for(var i=0;i<titles.length;i++){
              res += "<div title=\""+titles[i]+"\"  style=\"padding:1px;\">"+
                        "<iframe id=\"iframe_"+index+"_"+i+"\" scrollng=\"yes\" frameborder=\"0\"  src=\"\"  style=\"width:100%;height:100%;\"></iframe>"+
                     "</div>";
	       }
          res+=  "</div>" +
//                 "</div>" +
          		 "</div>";
          return  res;
	}
	
		
};





