<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD  HTML   4.01  Transitional//EN">

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link type="text/css" href="<%=basePath%>/jquery-easyui/themes/default/easyui.css"  rel="stylesheet"/>
<link type="text/css" href="<%=basePath%>/jquery-easyui/themes/icon.css"  rel="stylesheet"/>
<link rel="stylesheet" href="<%=basePath%>/uploadify/uploadify.css" type="text/css"></link>

<link type="text/css" href="<%=basePath%>/section/css/mytablestyle.css"  rel="stylesheet"/>
<script language="javascript" src="<%=basePath%>/js/jquery-1.6.min.js"></script>
<script language="javascript" src="<%=basePath%>/jquery-easyui/js/jquery.easyui.min.js"></script>

<script language="javascript" src="<%=basePath%>/section/common/jquery.tabs.extend.js"></script>

<script language="javascript" src="<%=basePath%>/section/common/easyui-lang-zh_CN.js"></script>
<script language="javascript" src="<%=basePath%>/section/common/json.js"></script>
<script language="javascript" src="<%=basePath%>/section/common/easyui-extend1.0.js"></script>
<script language="javascript" src="<%=basePath%>/section/common/baseajax.js"></script>
<%-- <script language="javascript" src="<%=basePath%>/script/mycomp.js"></script> --%>
<script language="javascript" src="<%=basePath%>/section/common/mygrids.js"></script>
<script language="javascript" src="<%=basePath%>/section/common/myform.js"></script>
<script language="javascript" src="<%=basePath%>/section/common/mytree.js"></script>
<script language="javascript" src="<%=basePath%>/section/common/rowformat.js"></script>
<script language="javascript" src="<%=basePath%>/jquery-easyui/js/datagrid-detailview.js"></script>
<script type="text/javascript" src="<%=basePath%>/uploadify/jquery.uploadify.min.js"></script>

<script type="text/javascript">
  //表格ID
  var  gID = "grids"; 
  
  var  treeID = "tt";
  //多选
  var  issingleSelect = false;
  //树是否有多选框
  var  treecheckbox = false;
  //数据修改表单
  var  editFormID = "eForm";
  //数据修改窗口
  var  editDialogID = "eDialog";
  //查询窗口
  var  queryDialogID = "qDialog";
  //查询表单
  var  queryFormID = "qForm";
  
  //明细编辑对话框ID
  var  listeditDialogID = "listeDialog";
  
  //明细编辑表单ID
  var  listeditFormID = "listeForm";
  
  //明细编辑对话框ID1
  var  listeditDialogID1 = "listeDialog1";
  
  //明细编辑表单ID1
  var  listeditFormID1 = "listeForm1";
  
   //明细编辑对话框ID1
  var  listeditDialogID2 = "listeDialog2";
  
  //明细编辑表单ID1
  var  listeditFormID2 = "listeForm2";
  
  //子项编辑表单ID
  var  subeditDialogID = "subeditDialog";
  
  var  subIframeID = "subIframe";
  
  
  
  $(function(){
      $.ajaxSetup ({
         cache: false //关闭AJAX相应的缓存
      });
      
	<%--  $('#roomId_id').combobox({
	    url:'<%=basePath%>/sys/server/server_room/combox_ajax_list.htm',
	    valueField:'id',
	    textField:'name',
	    onSelect:function(data){
	    	$("#roomId_id_hidden").val($("#roomId_id").combobox('getValue'));
	    }
     });
	var imgUrl = $('#imgUrl').val();
	//alert("imgUrl:"+imgUrl);
	if(imgUrl != null || imgUrl != ""){
		$("#show_img").html("<a href='<%=basePath%>"+imgUrl+"' target='_blank'><img src='<%=basePath%>"+imgUrl+"' style='width:50px;height:50px;'/></a>");
	} --%>

    //文件上传
	$("#server_file_upload_img").uploadify({
		 'uploader'			:'<%=basePath%>common/upload/upload.htm',
		 'height'			:20,
		 'buttonText'		:'上传图片',
		 'fileSizeLimit'	:'512KB',
		 'swf'			    :'<%=basePath%>/uploadify/uploadify.swf',
		 'fileTypeExts'		:'*.gif;*.jpg;*.png',
		 'formData'			:{file_name:'server_img'},
		 'queueID'			:'some_file_queue', 
		 'requeueErrors'	:true,
		 'multi' : false ,
		 'onFallback':function(){
            $.messager.alert("提示","您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。","error",function(){
            });
         },
        
        //上传到服务器，服务器返回]]相应信息到data里
        'onUploadSuccess':function(file, data, response){
        	 $('#' + file.id).find('.data').html('上传完毕');
        	if(data.indexOf("200") == -1){
        		$.messager.alert("提示",data,"error");
        	}else{
        		data = data.substring(1,data.length-4);
        		$("#imgUrl").val(data);
        		$("#show_img").html("<a href='<%=basePath%>"+data+"' target='_blank'><img src='<%=basePath%>"+data+"' style='width:50px;height:50px;'/></a>");
        	}
        },
        'overrideEvents' : ['onDialogClose'],
        //返回一个错误，选择文件的时候触发
        'onSelectError':function(file, errorCode, errorMsg){
            switch(errorCode) {
            	case -100:
            		alert("只允许单张上传！");
                    break;
                case -110:
                    alert("文件 ["+file.name+"] 大小超出系统限制的512KB大小！");
                    break;
                case -120:
                    alert("文件 ["+file.name+"] 大小异常！");
                    break;
                case -130:
                    $.messager.alert("提示","文件 ["+file.name+"] 类型不正确！","error");
                    break;
            }
        }
       });
       
    }); 
</script>

