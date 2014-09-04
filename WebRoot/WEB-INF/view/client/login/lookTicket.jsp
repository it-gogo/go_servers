<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="查看ticket" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
<c:if test="${loginInfo!=null }">
<%@include file="/WEB-INF/view/client/login/common/topMenu.jsp" %>
</c:if>
  <div id="content_left">
    <h1>查看Ticket</h1>
    <p class="breadcrumb"><a href="index.php">门户主页</a> > <a href="clientarea.php">客户区</a> > <a href="supporttickets.php">服务Tickets</a> > <a href="viewticket.php?tid=692117&amp;c=XVw9S4jG">查看Ticket</a></p>

<script language="javascript">
jQuery(document).ready(function(){
    jQuery("#addfileupload").click(function () {
        jQuery("#fileuploads").append("<input type=\"file\" name=\"attachments[]\" size=\"50\"><br />");
        return false;
    });
});
function rating_hover(id) {
  var selrating=id.split('_');
  for(var i=1; i<=5; i++){
    if(i<=selrating[1]) document.getElementById(selrating[0]+'_'+i).style.background="url(images/rating_pos.png)";
    if(i>selrating[1]) document.getElementById(selrating[0]+'_'+i).style.background="url(images/rating_neg.png)";
  }
}
function rating_leave(id){
  for(var i=1; i<=5; i++){
    document.getElementById(id+'_'+i).style.background="url(images/rating_neg.png)";
  }
}
function rating_select(id){
  window.location='viewticket.php?tid=692117&c=XVw9S4jG&rating='+id;
}
</script>


<h2>查看Ticket #692117</h2>


<table width="100%" border="0" cellpadding="10" cellspacing="0" class="data">
        <tr>
          <th>部门</th>
          <th>日期</th>
          <th>主题</th>
          <th>状态</th>
          <th>紧急通知</th>
        </tr>
        <tr>
          <td>销售部</td>
          <td>2014/09/04 01:08</td>
          <td>123</td>
          <td><span style="color:#779500">打开</span></td>
          <td>中</td>
        </tr>
</table>
<br />


<div class="clientticketreplyheader">
  <table width="100%" border="0" cellpadding="10" cellspacing="0">
    <tr>
      <td><strong>123</strong><br />1@2.com</td>
      <td align="right">2014/09/04 01:08</td>
    </tr>
  </table>
</div>
<div class="clientticketreply">123<br />
<br />
----------------------------<br />
IP Address: 121.207.143.177</div>

<p align="center">
  <input type="button" value="得到问题答复之后，请点击此次关闭ticket" onclick="window.location='/whmcs/viewticket.php?tid=692117&amp;c=XVw9S4jG&amp;closeticket=true'" />
</p>
<h3>回复</h3>
<form method="post" action="/whmcs/viewticket.php?tid=692117&amp;c=XVw9S4jG&amp;postreply=true" enctype="multipart/form-data">
<input type="hidden" name="token" value="667a1c55cfa0812a5053d3057f7e7ca835dc5af3" />
  <table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="120" class="fieldarea">姓名</td>
            <td>              <input type="text" name="replyname" size=30 value="123" />
              </td>
          </tr>
          <tr>
            <td class="fieldarea">邮箱</td>
            <td>              <input type="text" name="replyemail" size=50 value="1@2.com" />
              </td>
          </tr>
          <tr>
            <td colspan="2" class="fieldarea"><textarea name="replymessage" rows="12" cols="60" style="width:100%"></textarea></td>
          </tr>
          <tr>
            <td class="fieldarea">附件</td>
            <td><input type="file" name="attachments[]" size="50" />
              <a href="#" id="addfileupload"><img src="images/add.gif" class="absmiddle" alt="" border="0" /> 添加更多</a><br />
              <div id="fileuploads"></div>
              (允许的文件扩展: .jpg, .gif, .jpeg, .png)</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <p align="center">
    <input type="submit" value="提交" class="button" />
  </p>
</form>
<br />

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>