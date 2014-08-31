<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="提交Ticket" name="name"/>
	 </jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
  <div id="content_left">
    <h1>提交Ticket</h1>
    <p class="breadcrumb"><a href="index.php">门户主页</a> > <a href="customerArea.htm">客户区</a> > <a href="supportticket.htm">服务Tickets</a> > <a href="submitticket.htm">提交Ticket</a></p><script language="JavaScript" type="text/javascript">

var currentcheckcontent,lastcheckcontent;
jQuery(document).ready(function(){
    jQuery("#addfileupload").click(function () {
        jQuery("#fileuploads").append("<input type=\"file\" name=\"attachments[]\" size=\"50\"><br />");
        return false;
    });
});


function getticketsuggestions() {
    currentcheckcontent = jQuery("#message").val();
    if (currentcheckcontent!=lastcheckcontent && currentcheckcontent!="") {
        $.post("submitticket.php", { action: "getkbarticles", text: currentcheckcontent },
        function(data){
            if (data) {
                jQuery("#searchresults").html(data);
                jQuery("#searchresults").slideDown();
            }
        });
        lastcheckcontent = currentcheckcontent;
    }
    setTimeout('getticketsuggestions();', 3000);
}
getticketsuggestions();

</script>
<form action="/whmcs/submitticket.php?step=3" method="post" enctype="multipart/form-data" name="submitticket" id="submitticket">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" />
  <input type="hidden" name="deptid" value="1" />
  <table width="100%" cellspacing="1" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="120" class="fieldarea">姓名</td>
            <td>              <input type="text" name="name" size="30" value="" />
              </td>
          </tr>
          <tr>
            <td class="fieldarea">邮箱</td>
            <td>              <input type="text" name="email" size="50" value="" />
              </td>
          </tr>
          <tr>
            <td class="fieldarea">部门</td>
            <td>销售部</td>
          </tr>
          <tr>
            <td class="fieldarea">主题</td>
            <td><input type="text" name="subject" size="60" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">紧急通知</td>
            <td><select name="urgency">
                <option value="High">高</option>
                <option value="Medium" selected="selected">中</option>
                <option value="Low">低</option>
              </select></td>
          </tr>
                    <tr>
            <td colspan="2" class="fieldarea"><textarea name="message" id="message" rows="12" cols="60" style="width:100%"></textarea></td>
          </tr>
                    <tr>
            <td class="fieldarea">附件</td>
            <td><input type="file" name="attachments[]" size="50" />
              <a href="#" id="addfileupload"><img src="images/add.gif" class="absmiddle" border="0" alt="" /> 添加更多</a><br />
              <div id="fileuploads"></div>
              (允许的文件扩展: .jpg, .gif, .jpeg, .png)</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <br />
  <div id="searchresults" class="contentbox" style="display:none;"></div>
    <h2>Spam Bot验证</h2>
  <p>请在文本框中输入下图字符，避免系统自动提交。</p>
    <p align="center"><img src="includes/verifyimage.php" align="middle" /> <input type="text" name="code" size="10" maxlength="5" /></p>
      <p align="center">
    <input type="submit" value="提交" />
  </p>
</form><br />

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
 <%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>