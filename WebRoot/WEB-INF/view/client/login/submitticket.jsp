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
    <p class="breadcrumb"><a href="../index/index.htm">门户主页</a> > <a href="../index/customerArea.htm">客户区</a> > <a href="../ticket/support.htm">服务Tickets</a> > <a href="../ticket/toAdd.htm">提交Ticket</a></p><script language="JavaScript" type="text/javascript">

var currentcheckcontent,lastcheckcontent;
jQuery(document).ready(function(){
    jQuery("#addfileupload").click(function () {
        jQuery("#fileuploads").append("<input type=\"file\" name=\"attachaddress\" size=\"50\"><br />");
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
<form action="../ticket/save.htm" method="post"   >
<input type="hidden" name="creator" value="${loginInfo.id }" />
  <table width="100%" cellspacing="1" cellpadding="0" class="frame">
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="10" cellspacing="0">
          <c:if test="${loginInfo==null}">
	          <tr>
	            <td width="120" class="fieldarea">姓名</td>
	            <td>              
	            	<input type="text" name="name" size="30" value="" />
	              </td>
	          </tr>
	          <tr>
	            <td class="fieldarea">邮箱</td>
	            <td>              <input type="text" name="email" size="50" value="" />
	              </td>
	          </tr>
          </c:if>
          <c:if test="${loginInfo!=null}">
	          <tr>
	            <td width="120" class="fieldarea">姓名</td>
	            <td>              
	            	${loginInfo.name }
	            	<input type="hidden" name="name" size="30" value="${loginInfo.name }" />
	              </td>
	          </tr>
	          <tr>
	            <td class="fieldarea">邮箱</td>
	            <td>            
	            	${loginInfo.email }
	            	 <input type="hidden" name="email" size="50" value="${loginInfo.email }" />
	              </td>
	          </tr>
          </c:if>
         <!--  <tr>
            <td class="fieldarea">部门</td>
            <td>销售部</td>
          </tr> -->
          <tr>
            <td class="fieldarea">主题</td>
            <td><input type="text" name="title" size="60" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">紧急通知</td>
            <td>
            	<select name="urgenttype">
	                <option value="高">高</option>
	                <option value="中" selected="selected">中</option>
	                <option value="低">低</option>
              	</select>
              </td>
          </tr>
                    <tr>
            <td colspan="2" class="fieldarea"><textarea name="content"  rows="12" cols="60" style="width:100%"></textarea></td>
          </tr>
                    <tr>
            <td class="fieldarea">附件</td>
            <td>
            	<input type="file" name="attachaddress" size="50" />
              <a href="#" id="addfileupload">
              <img src="<%=request.getContextPath() %>/client/loginCss/images/add.gif" class="absmiddle" border="0" alt="" /> 添加更多
              </a>
              <br />
              <div id="fileuploads"></div>
              (允许的文件扩展: .jpg, .gif, .jpeg, .png)
             <!-- <div class="clear" >
           		<div class="web_annex">
               <a href="">附件名称-6543213</a>
               <a href=""  class="but_close"></a>
          	 </div>
         	</div> -->
          	</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <br />
  <div id="searchresults" class="contentbox" style="display:none;"></div>
    <%@include file="/WEB-INF/view/client/login/common/validateCode.jsp" %>

<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
 <%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>