//显示组件类型名称
function displayCompType(val,row,index){
	for(var i=0;i<compType.length;i++){
		//alert(category1[i].id);
		if(compType[i].id==val){
			return compType[i].name;
		}
	}
	return "";
}


//显示表单类型
function displayFormType(val,row,index){
	return  row.formType.name;
}

//显示表单类型
function displayFormName(val,row,index){
	return  row.formzb.name;
}

function  displayBoolean(val,row,index){
	if(val==1){
		return "是";
	}else{
		return "否";
	}
}

function  displayShjg(val,row,index){
	if(val==1){
		return "同意";
	}else{
		return "不同意";
	}
}

function  displayFinish(val,row,index){
	if(val==1){
		return "完成";
	}else{
		return "审批中";
	}
}

function  displayUrl(val,row,index){
	return "<a href='"+val+"' target='_ablank'>"+val+"</a>";
}

//表单填写类型能够
function  displayIsfill(val,row,index){
	var res = "";
	for(var i=0;i<isfill.length;i++){
		if(val==isfill[i].id){
			res = isfill[i].name;
			return res;
		}
	}
	return res;
}

function displayShtype(val,row,index){
	var res = "";
	switch(val){
	case '1':
		res = "按人员";
		break;
	case '2':
		res = "按角色";
		break;
	}
	return res;
}

function displaySex(val,row,index){
	var res = "";
	switch(val){
	case 1:
		res = "男";
		break;
	case 0:
		res = "女";
		break;
		default:
			break;
	}
	return res;
}

/**
 * 列表显示邮件类型
 * @param val
 * @param row
 * @param index
 */
function  displayEMtype(val,row,index){
	var res = "";
	switch(val){
	case '1':
		res = "注册激活邮件";
		break;
	case '2':
		res = "忘记密码邮件";
		break;
	case '3':
		res = "忘记用户邮件";
		break;
	}
	return res;
}

/**
 * 显示固定表单
 * @param value
 * @param row
 * @param index
 */
function displayFixform(value,row,index){
	var res = "";
	switch(value){
	case 1:
		res = "企业信息";
		break;
	case  2:
		res = "企业人员信息";
		break;
		default:
			break;
	}
	return res;
}


function displayFormzbHandle(value,row,index){
	var  handstr = 
	               "<a href='formzbAction.action?act=preview&vo.id="+row.id+"' class='easyui-linkbutton' iconCls='icon-edit' plain='true' target='_blank'>[预 览]</a> "+
	               "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='loadxx(urls,"+value+",editFormID);'>[修 改]</a> "+
                   "<a href='javascript:void(0)' class='easyui-linkbutton' iconCls='icon-edit' plain='true' onclick='deletexx(urls,"+value+",editFormID);'>[删 除]</a>";
    return  handstr;
}

/**
 * 显示待领取状态
 * @param value
 * @param row
 * @param index
 */
function  displayFormatLqzt(value,row,index){
	if(value==null||value==0){
		return  "待领取业务";
	}
}

function displayFormmxbHandle(val,row,index){
	
}