function  ajaxRequest(action,parame,handler){
	$.ajax({
		type:"post",
		data:parame,
		url:action,
		dataType:"json",
		async: false,//同步方法
		success:function(data){
			if(typeof(handler)!='undefined'&&
			   typeof(handler)=='function'){
	    	    handler(data);
			}
	    }
	});
}

function  ajaxRequest1(action,parame,handler){
	$.ajax({
		type:"post",
		data:parame,
		url:action,
		dataType:"json",
		async: true,//同步方法
		success:function(data){
			if(typeof(handler)!='undefined'&&
			   typeof(handler)=='function'){
	    	    handler(data);
			}
	    }
	});
}

function  alertInfo(message){
	$.messager.alert("信息",message,"info");
}

function  alertWarn(message){
	$.messager.alert("信息",message,"warning");
}

function  alertError(message){
	$.messager.alert("错误",message,"error");
}

