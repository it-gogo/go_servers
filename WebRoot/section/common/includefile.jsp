<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD  HTML   4.01  Transitional//EN">

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link type="text/css" href="<%=basePath%>/jquery-easyui/themes/default/easyui.css"  rel="stylesheet"/>
<link type="text/css" href="<%=basePath%>/jquery-easyui/themes/icon.css"  rel="stylesheet"/>

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
  
  
  
  $(document).ready(function(){
      $.ajaxSetup ({
         cache: false //关闭AJAX相应的缓存
      });
  });
  
   
</script>

