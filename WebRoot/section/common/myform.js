
var  submitMethod;

var  curDialogID;
/**
 * 该类脚本功能:
 * 实现表单的基本功能
 */

//初始化表单
function  initForm(dialogId,formId){
	$('#'+formId).form({
		
        onLoadSuccess:function(data){
        	if(data.message!='undefined'&&data.message!=null){
        		if(data.status=="unvalid"){
					location.href="../errors/sessionError.jsp"
	            }else{
	            	parent.alertInfo(data.message);
	            }
        		return false;
        	}
           submitMethod = "updatexx";
           //打开表单
           $("#"+dialogId).dialog('open');
           //设置表单数据
           $('#'+formId).setForm(data,formId);
           if(typeof(afterLoad)=='function'){
        	   afterLoad(formId,data);
           }
        },
        onLoadError:function(){
        	location.href="../../authority/user/sessionError.htm";
        },
        onBeforeClose:function(){
        	if(typeof(beforeCloseForm)=='function'){
        		beforeCloseForm(formId);
        	}
        },
        onSubmit:function(){
        	if(typeof(beforeSubmit)=='function'){
        		beforeSubmit(formId);
        	}
        }
    });
}




//加载信息
function  loadxx(urls,sn,formID){
	if(typeof(formID)!='undefined'&&formID!=null){
		$("#"+formID).form('load',urls+'/loadxx.htm?id='+sn+'&ajaxFlag=XMLHttpRequest');
	}else{
        $("#"+editFormID).form('load',urls+'/loadxx.htm?id='+sn+'&ajaxFlag=XMLHttpRequest');
	}
}

//加载信息
function  parentloadxx(urls,sn,formID,rowIndex,tabIndex){
	parent.loadxx(urls,sn,formID);
	parent.$("#rowIndex","#"+formID).val(rowIndex);
	parent.$("#tabIndex","#"+formID).val(tabIndex);
}



//子项打开信息
function  subaddxx(dialogID,formID,r,index){
	var id = r.id;
	var indexArr = index.split("_");
	var tabIndex = indexArr[0];
	var rowIndex = indexArr[1];
	$("#tabIndex",$("#"+formID)).val(tabIndex);
	$("#rowIndex",$("#"+formID)).val(rowIndex);
	addxx(dialogID,formID,id,r);
}

//子项加载信息
function  subloadxx(urls,formID,r,index){
	//alert(obj);
	var id = r.id;
	var indexArr = index.split("_");
	var tabIndex = indexArr[0];
	var rowIndex = indexArr[1];
	$("#tabIndex",$("#"+formID)).val(tabIndex);
	$("#rowIndex",$("#"+formID)).val(rowIndex);
	$("#"+formID).form('load',urls+'?act=loadxx&ajaxFlag=XMLHttpRequest&vo.id='+id);
}

function  subdeletexx(urls,formID,r,index){
	var id = r.id;
	var indexArr = index.split("_");
	var tabIndex = indexArr[0];
	var rowIndex = indexArr[1];
	$("#tabIndex",$("#"+formID)).val(tabIndex);
	$("#rowIndex",$("#"+formID)).val(rowIndex);
	deletexx(urls,id,formID);
}



/**
 * 提交信息
 */
function submitForm(action,formID){
	//alert(action+"/"+submitMethod+".htm");
	if(!$("#"+formID).form('validate')){
		return false;
	}
	//alert(formID)
    $("#"+formID).form('submit',{
        url:action+"/"+submitMethod+".htm" ,
        onSubmit:function(param){
        	//var json = eval("("+param+")");
        	//alert(json)
        	//判断是否是AJAX提交的标志
        	if(typeof(beforeSubmit)=="function"){
        		return beforeSubmit(formID);
        	}
        },
        success:function(data){
        	try{ 
        		var json = eval('('+data+')');
        	}catch(e){   
        		$.messager.alert("信息","操作有误！","info");
        	} 
            //提交后的动作
            if(typeof(afterSubmitForm)=='function'){
               afterSubmitForm(formID);
            }
            if(json.objInfo!=null&&typeof(json.objInfo)!='undefined'){
            	$('#'+formID).setForm(json.objInfo,formID);
            }
            closeDialog(curDialogID);
            $.messager.alert("信息",json.message,"info");
        }, 
        error:function(){
        	location.href="../../authority/user/sessionError.htm";
        }
    });
 }

//删除单条信息
function  deletexx(urls,sns,formID){
    //getCheckeds();
	$.messager.confirm("询问","是否删除",function(r){
		if(r){
			ajaxRequest(urls+"/deletexx.htm",{'sns':sns},function(data){
		         //afterSubmitForm(formID);
				 if(typeof(afterSubmitForm)=='function'){
		               afterSubmitForm(formID);
		            }
		         $.messager.alert("信息",data.message,"info");
		    });
		}
	});
   
}

function  listaddxx(dialogID,editFormID){
	//var iframes = $(window.frames["s"].document);
	var iframes = $("#s",parent.document);
	//alert(iframes);
	$("#"+dialogID,$(iframes)).dialog('open');
}

/**
 * 子项添加，新的函数
 */
function subAddxx(dialogID,iframeID,tindex,rindex,row){
	var  u = getSubUrl(row,tindex,rindex);
	//alert(u);
	//alert(parame);
	var  iframeObj = parent.$("#"+iframeID);

		 iframeObj.attr("src",u);
		 parent.openDialog(dialogID);
}

/**
 * 子项加载
 * @param urls
 * @param formID
 * @param r
 */
function  subLoadxx(urls,formID,r){
	
}




//删除信息
function  deletexxAll(gridID,formID){
	var  gid;
	//alert(gridID);
	if(gridID!=null&&typeof(gridID)!='undefined'){
		gid = gridID;
	}else{
		gid = gID;
	}
    var sns =  getCheckeds(gid);
    //alert(sns);
    if(sns==""){
    	//alert("请选择记录");
    	$.messager.alert("警告","请选择记录",'warning');
    	return;
    }else{
    	$.messager.confirm('询问', '是否删除?', function(r){
           if(r){
        	  // alert(urls+"/deletexx.htm")
	         ajaxRequest(urls+"/deletexx.htm",{'sns':sns},function(data){
	        	 //alert(gid);
	             afterSubmitForm(formID);
	             //alert(data.message);
	             $.messager.alert("信息",data.message,'info');
	         });
           }
    	});
    }
   
}


//删除信息
function  otherHandlerAll(urls,method,message,formID,gridID){
	var  gid;
	//alert($("#codeSaleGroupId").val());
	if(gridID!=null&&typeof(gridID)!='undefined'){
		gid = gridID;
	}else{
		gid = gID;
	}
    var sns =  getCheckeds(gid);
    //alert(urls);
    if(sns==""){
    	//alert("请选择记录");
    	$.messager.alert("警告","请选择记录",'warning');
    	return;
    }else{
    	$.messager.confirm('询问', message+'?', function(r){
           if(r){
	         ajaxRequest(urls,{'act':method,'ajaxFlag':'XMLHttpRequest','sns':sns},function(data){
	             afterSubmitForm(formID);
	             $.messager.alert("信息",data.message,'info');
	         });
           }
    	});
    }
   
}




/**
 * 打开要选择的信息,按表格形式
 * @param sDialogID
 * @param formID
 * @param qFormID
 * @param urls
 */
function  openSelTableDialog(sDialogID,qFormID,gridID,urls){
	openDialog(sDialogID);
	initGrids(gridID,urls,qFormID);
}



//关闭WINDOW
function  closeDialog(dialogID){
    $("#"+dialogID).dialog('close');
    if(typeof(beforeClose)=='function'){
    	beforeClose(dialogID);
    }
}


//重新设置FORM
function  resetForm(formID){
   $("#"+formID).form('reset');
}



/**
 * 关闭对话框
 * @param dialogID
 * @param formID
 * @param flag
 */
function  closeDialog1(dialogID,formID,flag){
    $("#"+dialogID).dialog('close');
    if(flag){
    	$("#"+formID).form('reset');
    }
}



//关闭窗口,重新设置窗口
function  closeForm(dialogID,formID){
	closeDialog(dialogID);
	 if(typeof(beforeClose)=='function'){
		 beforeClose(formID);
      }
	//resetForm(formID);
}

//关闭窗口,重新设置窗口
function  closeForm1(dialogID,formID){
	//closeDialog(dialogID);
	//resetForm(formID);
	//var  iframes=$(window.frames["iframe_0_0"].document);
	// alert(iframes.$("#"+gID).datagrid);
	//var  iframes = $(window.frames["iframe_0_0"].document);
	//alert(iframes);
	//($(iframes).$("#"+gID)).datagrid('load');
	//window.frames["iframe_0_0"].document.$("#"+gID).datagrid('load');
	//var  urls = $("#iframe_0_0").attr("src");
	//alert(urls);
	//$("#iframe_0_0").attr("src",urls);
	closeDialog(dialogID);
	//var s = $('#iframe_0_0').find("#"+gID);
	//alert($(window.frames["iframe_0_0"].document).find("#"+gID));
	//$(window.frames["iframe_0_0"].document).test();
	
	$("#iframe_0_0")[0].contentWindow.loadData(gID,queryFormID);
	//alert($(window.frames["iframe_0_0"]).find("#"+gID));
	//$("#iframe_0_0").$("#"+gID).datagrid('load');
	
	
}


//查询按钮
function  openQueryDialog(queryDialogID){
	openDialog(queryDialogID);
}
//查询
function  query(gridID,queryFormID){
	loadData(gridID,queryFormID);
	//closeDialog(queryDialogID);
	//resetForm(queryFormID)
}

//查询
function  requery(gridID,queryFormID){
	loadData(gridID,queryFormID);
	//closeDialog(queryDialogID);
	//resetForm(queryFormID)
}

//取得查询的参数
function  getQueryParame1(formId){
   var cFormID;
   if(typeof(formId)=='undefined'){
	   cFormID = queryFormID;
   }else{
	   cFormID = formId;
   }
   var  queStr = new Object();
   var  res = new Object();
   var curObj = $("#"+cFormID);
   $('input:text,input:hidden,select',$("#"+cFormID)).each(function(){
 	 var  ids =  this.id;
 	 var t = this.type;
 	 var tag = this.tagName.toLowerCase();
 	 var title = this.que;
 	 
 	if(t == 'text' || t == 'hidden'|| t == 'password'||t =='textarea' || tag=='textarea'){
 	 if(ids!=""&&ids!=null)
 	 
 	    queStr[ids] = this.value;

 	}else if(t == 'select-one'){
 		 
 		 if(ids!=""&&ids!=null){
 		    queStr[ids] = $("#"+ids,curObj).combobox("getValue");
 		 }
 	}
   });	
   //queStr["ajaxFlag"] = "XMLHttpRequest";//设置AJAX请求参数
   res["gt_json"] = $.toJSON(queStr);
   return  eval("("+$.toJSON(res)+")")
}

//取得查询的参数
function  getQueryParame(formId){
   var cFormID;
   if(typeof(formId)=='undefined'){
	   cFormID = queryFormID;
   }else{
	   cFormID = formId;
   }
   
   var  res = new Object();
   var curObj = $("#"+cFormID);
   var array = new Array();
   $('input:text,input:hidden,select',$("#"+cFormID)).each(function(){
 	 var  ids =  this.id;
 	 var t = this.type;
 	 var tag = this.tagName.toLowerCase();
 	 var title = this.que;
 	//数据类型，如果没有设置，为字符型
// 	 var datatype = $(this).attr("datatype");
 	 var datatype = $(this).attr('datatype');
 	 //查询符号，如：like,>,<,=,>=,<=
 	 var quechar = this.quechar;
 	 var  queStr = new Object();
 	if(t == 'text' || t == 'hidden'|| t == 'password'||t =='textarea' || tag=='textarea'){
 	 if(ids!=""&&ids!=null){
 	     //queStr[ids] = this.value;
// 		 alert(datatype);
 		 queStr["id"] = ids;
 	     queStr["vals"] = this.value;
 	     if(typeof(datatype)=='undefined'){
 	    	 datatype="String";
 	     }
 	    if(typeof(quechar)=='undefined'){
	    	 quechar="like";
	     }
 	     queStr["datatype"] = datatype;
 	     queStr["quechar"] = quechar;
 	     array[array.length] = queStr;
 	 }

 	}else if(t == 'select-one'){
 		 
 		 if(ids!=""&&ids!=null){
// 		    queStr[ids] = $("#"+ids,curObj).combobox("getValue");
 			 var sval = $("#"+ids,curObj).combobox("getValue");
 			 queStr["id"] = ids;
 			 queStr["vals"] = sval;
 	 	     if(typeof(datatype)=='undefined'){
 	 	    	 datatype="String";
 	 	     }
 	 	    if(typeof(quechar)=='undefined'){
 		    	 quechar="like";
 		     }
 	 	     queStr["datatype"] = datatype;
 	 	     queStr["quechar"] = quechar;
 	 	   array[array.length] = queStr;
 		 }
 	}
 	
   });	
   //queStr["ajaxFlag"] = "XMLHttpRequest";//设置AJAX请求参数
   res["gt_json"] = $.toJSON(array);
   //alert($.toJSON(res));
   return  eval("("+$.toJSON(res)+")")
}

function  openDialog(dialogID){
	   $("#"+dialogID).dialog('open');
}

function  addxx(dialogID,formID,sns,otherParame){
	//alert(dialogID);
	var flag = true;
	curDialogID = dialogID;
	resetForm(formID);
	if(typeof(beforeaddxx)=='function'){
		if(typeof(otherParame)!='undefined'){
			flag = beforeaddxx(formID,sns,otherParame);
		}else{
		   flag = beforeaddxx(formID,sns);
		}
	}
	if(flag){
	  submitMethod = "addxx";
	  
	  openDialog(dialogID);
	}
}

function  previous(dialogID,formID,sns,otherParame){
	//alert(dialogID);
	var flag = true;
	if(typeof(beforeaddxx)=='function'){
		if(typeof(otherParame)!='undefined'){
			flag = beforeaddxx(formID,sns,otherParame);
		}else{
		   flag = beforeaddxx(formID,sns);
		}
	}
	if(flag){
	  //alert(1);
	  submitMethod = "next";
	  openDialog(dialogID);
	}
}

function  djsh(dialogID,formID,sns,otherParame){
	//alert(dialogID);
	var flag = true;
	if(typeof(beforeaddxx)=='function'){
		if(typeof(otherParame)!='undefined'){
			flag = beforeaddxx(formID,sns,otherParame);
		}else{
		   flag = beforeaddxx(formID,sns);
		}
	}
	if(flag){
	  //alert(1);
	  submitMethod = "next";
	  openDialog(dialogID);
	}
}





//明细节弹出窗口
function  parentAddxx(dialogID,formID,sns){
	var flag = true;
	parent.resetForm(formID);
	//alert();
	if(typeof(beforeaddxx)=='function'){
		//alert();
		flag = beforeaddxx(formID);
		//alert(flag);
	}
	if(flag){
	  parent.curDialogID = dialogID;
	  parent.submitMethod = "addxx";
	  parent.openDialog(dialogID);
	}
}

//其他操作
function  otherHandle(urls,sns,method,message,formID){
    //getCheckeds();
	$.messager.confirm("询问",message,function(r){
		if(r){
		  ajaxRequest(urls,{"act":method,'ajaxFlag':'XMLHttpRequest',"sns":sns},function(data){
	         alertInfo(data.message);
	         if(typeof(afterSubmitForm)=='function'){
	            afterSubmitForm(formID);
	         }
	      });
		}
	});
}

//启用禁用操作
function  changestat(urls,sns,stat,message,formID){
    //getCheckeds();
	$.messager.confirm("询问",message,function(r){
		if(r){
		  ajaxRequest(urls+"/changestat.htm",{"sns":sns,'isactives':stat},function(data){
	         alertInfo(data.message);
	         if(typeof(afterSubmitForm)=='function'){
	            afterSubmitForm(formID);
	         }
	      });
		}
	});
}

//启用禁用操作
function  flowhandle(urls,method,row,message,formID){
    //getCheckeds();
	//alert(row.formtypeid);
	$.messager.confirm("询问",message,function(rs){
		if(rs){
		  ajaxRequest(urls,{"act":method,'vo.id':row.id,'vo.afterstate':row.afterstate,'vo.formtypeid':row.formtypeid},function(data){
			  //alert(data.message);
			  alertInfo(data.message);
	         if(typeof(afterSubmitForm)=='function'){
	            afterSubmitForm(formID);
	         }
	      });
		}
	});
}


//启用禁用操作
function  changelock(urls,sns,stat,message,formID){
    //getCheckeds();
	$.messager.confirm("询问",message,function(r){
		if(r){
		  ajaxRequest(urls,{"act":'locked',"vo.id":sns,'vo.islocked':stat},function(data){
	         alertInfo(data.message);
	         if(typeof(afterSubmitForm)=='function'){
	            afterSubmitForm(formID);
	         }
	      });
		}
	});
}



//设置表单数据
$.fn.setForm = function(json,formID){
	var  curObj;
	if(formID!=null&&typeof(formID)!='undefined'){
		curObj = $("#"+formID);
	}else{
		curObj = this;
	}
    return jQuery('input,select,textarea', curObj).each(function() {
    	var t = this.type, tag = this.tagName.toLowerCase(), id = this.id,title = this.title,classNames = this.className;
    	if( id != "" )
		{
    		if(id=="configuration"){
    			var j = eval("("+json[id]+")");
    			var html="";
    			for(var i=0;i<j.length;i++){
    				var o=j[i];
    				html+=o.name+":"+o.value+"\r\n";
    			}
    			this.value =html;
    		}else{
				if ( t == 'text' || t == 'hidden' || t == 'password'||t =='textarea' || tag=='textarea' )
				{
					if( json[id] != null )
					{
						if(classNames.indexOf('easyui-numberbox')>-1){
		                	$("#"+id,curObj).numberbox('setValue',json[id]);
		                }else if(classNames.indexOf('easyui-datebox')>-1){
		                	$("#"+id,curObj).datebox('setValue',json[id]);
		                }else if(classNames.indexOf('easyui-datetimebox')>-1){
		                	$("#"+id,curObj).datetimebox('setValue',json[id]);
		                }else {
						   this.value = json[id];
		                }
					}else if(json[title]!=null){
						if(classNames.indexOf('easyui-numberbox')>-1){
							$("#"+id,curObj).numberbox('setValue',json[title]);
						}else if(classNames.indexOf('easyui-datebox')>-1){
		                	$("#"+id,curObj).datebox('setValue',json[title]);
		                }else if(classNames.indexOf('easyui-datetimebox')>-1){
		                	$("#"+id,curObj).datetimebox('setValue',json[title]);
		                }else{
						  this.value = json[title];
						}
					}
				}
				else if( t == 'select-one' )
				{
					if( json[id] != null )
					{
						if(classNames.indexOf("easyui-combobox")>-1){
						  $("#"+id,curObj).combobox("setValue",json[id]);
						}else{
							this.value = json[id];
						}
					}else if(json[title]!=null){
						if(classNames.indexOf("easyui-combobox")>-1){
							  $("#"+id,curObj).combobox("setValue",json[title]);
							}else{
								this.value = json[title];
							}
					}
				}
				else if(t == "checkbox" || t=="radio"){
					/*
					if( json[id] != null ){
						if( json[id] == this.value )
							
							this.checked = true;
						else{
							this.checked = false;
						}
					}else if( json[title] != null ){
	                        if( json[title] == this.value )
							   this.checked = true;
							else{
								this.checked = false;
							}
					}*/
					if( json[id] != null ){
						if(this.value==json[id]){
		 	 				this.checked=true;
		 	 			}
					}else if( json[title] != null ){
	                    if( json[title] == 1)
						   this.checked = true;
						else{
							this.checked = false;
						}
					}else {
						if(typeof(json[id])!='undefined')
						this.checked = false;
					}
					//this.value = json[id];
				}
    		}
		}
    });
};


//设置表单数据
$.fn.setFormLabel = function(json,formID){
	var  curObj;
	if(formID!=null&&typeof(formID)!='undefined'){
		curObj = $("#"+formID);
	}else{
		curObj = this;
	}
	//alert(json)
    return jQuery('label,img', curObj).each(function() {
    	var t = this.type, tag = this.tagName.toLowerCase(), id = this.id,title = this.title;
    	//alert(id);
    	if( id != "" ){
    		//alert(json)
    		//alert(json[id]);
    		if(tag=='label'){
	    		if(json[id]!=null){
	    		  $("#"+id,curObj).html(json[id]);
	    		}
    		}else if(tag=='img'){
    			
    			//alert(id);
				if(json[id]!=null){
		          //$("#"+id).val(json[id]);
		          $("#"+id).attr('src',"approvalmxbAction.action?act=getImgss&imgurl="+json[id]);
		       }
    		}
		}
    });
};

$.fn.resetForms = function() {
	return this.each(function() {
		// guard against an input with the name of 'reset'
		// note that IE reports the reset function as an 'object'
		if (typeof this.reset == 'function' || (typeof this.reset == 'object' && !this.reset.nodeType))
			this.reset();
	});
};


//输入文字个数校验
$.extend($.fn.validatebox.defaults.rules, {
	maxLength: { validator: function(value, param){
		return strlen(value) <= param[0];
	},
	message: '最多只能输入 {0} 个字符数.'
	},
	isNumber: { validator: function(value, param){
		var str=/^[\d]{0,8}$/;
		return str.test(value) && strlen(value) <= param[0];
	},
	message: '只能输入数字最多{0} 位数.'
	},
	mobile: { validator: function(value, param){
		var str=/^[\d]{11}$/;
		return str.test(value);
	},
	message: '请输入正确的手机格式，例如：16565856565'
	},
	email: { validator: function(value, param){
		var str=/^[\w]+@[\w]+(.com|.COM)$/;
		return str.test(value);
	},
	message: '请输入正确的email，例如：yourname@domain.com'
	},
	idcard: { validator: function(value, param){
		var str=/(^\d{15}$)|(^\d{17}([0-9]|X)$)/;
		return str.test(value);
	},
	message: '请输入正确的身份证号码，例如：350625199912255632'
	}
});
//计算文字个字符数
function strlen(str) 
{
 var strlength = 0;
 for (var i=0; i < str.length; ++i)
 {
  if (isChinese(str.charAt(i)) == true)
   strlength = strlength + 2;//中文计算为二个字符
  else
   strlength = strlength + 1;
 }
 return strlength;
}
function isChinese(str)
{
   var lst = /[u00-uFF]/;
   return !lst.test(str);      
}