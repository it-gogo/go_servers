<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审批系统</title>
<link href="<%=request.getContextPath() %>/css/main/style1.css" type="text/css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/css/main/style.css" rel="stylesheet" />
<%@include file="/section/common/includefile.jsp"%>
</head>
<body  onload="load()" >
<div class="header">
	<h2 class="logo"><a href="#"></a></h2>
    <div class="header_r">
    	<div class="admin_ico"><img src="<%=request.getContextPath() %>/css/main/images/person.png" /></div>
    	<a href="#">[帐号:${Tuser.userid}&nbsp;&nbsp;姓名:${Tuser.staffname}]</a>
        <a class="edit" href="javascript:modifypass()">修改密码</a>
        <a class="logout" href="javascript:loginOut()">注销</a>
    </div>
</div>
 <!--左侧开始-->
<div id="content" >
   <div id="lcontent" class="left">
     ${menuStr}
   </div>
	

<!--右侧开始-->
<div id="rcontent"  class = 'right'>
   <div id="mainPanel" class="easyui-tabs"    >
	 
   </div>
</div>

 <%-- <%@include  file="sysmanager/tuser/modifypass.jsp" %> --%>

<!--右侧结束-->
</body>
</html>
<script type="text/javascript">
var  index = 0;
var urls = "sysmanager/tuserAction.action";
function addPanel(cdbh,titles,action){
      index++;
     // var tab = $('#tt').tabs(titles);
     var actions = action+"?cdbh="+cdbh;
     if(action.indexOf("?")>-1){
       actions = action;
     }
      if($("#mainPanel").tabs('exists',titles)){
    	  $("#mainPanel").tabs('select',titles);
    	   var currTab = $('#mainPanel').tabs('getTab', titles),  
             iframe = $(currTab.panel('options').content),  
            content = '<iframe scrolling="auto" frameborder="0"  src="' + iframe.attr('src') + '" style="width:100%;height:100%;"></iframe>';  
          /* $('#mainPanel').tabs('update', {tab: currTab, options: {content: content, closable: true}});  */
          $('#mainPanel').tabs('updateIframeTab', {tab: currTab, options: {content: content, closable: true},which:titles}); 
       }else{
       var count = 0;
       		$("#mainPanel").tabs('addIframeTab',{
				tab:{
                     id:cdbh,
					title: titles,
					content:'<iframe id="t"  scrolling="yes" frameborder="0"  src="'+actions+'" width="100%" height="'+ifheight+'"></iframe>',
					closable: true,
					border:false,
					fit:true
                },
				iframe:{src:actions}
			});
		      /* $("#mainPanel").tabs('add',{
		            id:cdbh,
					title: titles,
					content:'<iframe id="t"  scrolling="yes" frameborder="0"  src="'+actions+'" width="100%" height="'+ifheight+'"></iframe>',
					closable: true,
					border:false,
					fit:true
			  });*/
       }
}

function changeCss(obj){
	$("li").removeClass("on");
	obj.className="on";
}

function removePanel(){
	var tab = $('#mainPanel').tabs('getSelected');
	if (tab){
		var index = $('#mainPanel').tabs('getTabIndex', tab);
		$('#mainPanel').tabs('close', index);
	}
}

var h =  $(window).height();	
var  theight ;//头部高度
var cheight ;//页面高度
var ifheight;
//调整页面高度,进入页面时候加载
function  load(){
     theight = 75;
     cheight =  h-62;//定义层的高度
     ifheight = h-90;//定义IFrame的高度
     $("#content").height(cheight);
     $("#rcontent").height(cheight);
     //$("#lcontent").innerHTML();
    $('#a').accordion({
      //height:cheight,
      animate:false,
      border:false
    });
    
     $("#mainPanel").tabs('add',{
		            id:0,
		            fit:true,
					title: '主 页',
					content:'<iframe id="t" scrolling="yes" frameborder="0"  src="homepage.jsp" width="100%" height="'+ifheight+'"></iframe>',
					border:false
		});
  
     
}

//注销
		function loginOut()
		{
			if(!confirm("是否确认退出系统"))
			  return ;
			$.post('loginAction.action',{'act':'loginOut'},function(data){
			   if(data==1)
			   {
			     location.href ="loginAction.action?act=toLongin";
			   }
			});
			
		}
		
		function modifypass(){
		    openDialog(editDialogID);
		    submitMethod = "updatePass";
		    $(".window-mask").css({height:$(window)._outerHeight()})
		    $('#'+editDialogID).dialog('refresh','sysmanager/tuserAction.action?act=modifypass');
		}
		
		
		function  afterSubmitForm(formID){
		    //closeDialog1(editDialogID,formID,true);
		    $("#oldpass").val('');
		     $("#pass").val('');
	         $("#pass1").val('');
	          $("#tip").html("");
		}
		
		
		function  beforeSubmit(formID){
		    if($("#pass").val()==''){
		       alertInfo("请输入密码");
		       return false;
		    }else if($("#pass").val()!=$("#pass1").val()){
		       alertInfo("两次密码输入不一致");
		       $("#pass").val('');
	           $("#pass1").val('');  
		       return false;
		    }
		    return true;
		}
		
		
   function checkpass(){
      var pass = $("#pass").val();
	  var pass1 = $("#pass1").val();
	  if(pass!=pass1){
        $("#tip").html("两次密码输入不一致");
      }else{
        $("#tip").html("正确");
      }
   }
   
  
</script>

