<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<jsp:include page="/WEB-INF/view/client/login/common/head.jsp" >
    	<jsp:param value="注册" name="name"/>
	 </jsp:include>
	 <script type="text/javascript">
	 function save(){
	 	var $obj=$(".requires");//必填项
		for(var i=0;i<$obj.size();i++){
			if($obj.eq(i).val()==""){
				$obj.eq(i).focus();
				return false;
			}
		}
		if($(".check").size()!=0){
			return false;
		}
		return true;
	 }
	 </script>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp" %>
<div id="content_container">
<c:if test="${loginInfo!=null }">
<%@include file="/WEB-INF/view/client/login/common/topMenu.jsp" %>
</c:if>
  <div id="content_left">
    <h1>注册</h1>
    <p class="breadcrumb"><a href="../index/index.htm">门户主页</a> > <a href="../portal/registration.htm">注册</a></p>
<p>请在下方填写新账户注册信息。</p>
<form method="post" action="save.htm" >
  <table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="150" class="fieldarea">名</td>
            <td><input type="text" name="name" size="30" value="" maxlength="5" class="requires"   /></td>
          </tr>
          <tr>
            <td class="fieldarea">姓</td>
            <td><input type="text" name="surnamee" size="30" value=""  class="requires"  /></td>
          </tr>
          <tr>
            <td class="fieldarea">公司名称</td>
            <td><input type="text" name="companyname" size="30" value="" class="requires"  /></td>
          </tr>
          <tr>
            <td class="fieldarea">邮件地址</td>
            <td><input type="text" name="email" size="50" value="" class="requires"  /></td>
          </tr>
          <tr>
            <td class="fieldarea">地址1</td>
            <td><input type="text" name="addressone" size="40" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">地址2</td>
            <td><input type="text" name="addresstwo" size="30" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">城市</td>
            <td><input type="text" name="city" size="30" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">州/区</td>
            <td><input type="text" name="downtown" size="25" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">邮编</td>
            <td><input type="text" name="zip" size="10" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">电话号码</td>
            <td><input type="text" name="telephone" size="20" value="" class="requires"  /></td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <h2>登录信息</h2>
  <p>请输入登录密码 RakSmart 客户区信息区别于网站控制面板用户名&amp;密码。</p>
  <table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="150" class="fieldarea">密码</td>
            <td width="175"><input type="password" name="password" id="password" onblur="checkPassword()" size="25" class="requires"  /></td>
          </tr>
          <tr>
            <td class="fieldarea">确认密码</td>
            <td colspan="2"><input type="password" name="password2" id="password2" onblur="confirmPassword()"  size="25"  class="requires"  /></td>
          </tr>
      </table></td>
    </tr>
  </table>

    <%@include file="/WEB-INF/view/client/login/common/validateCode.jsp" %>
    <p align="center">
    <input type="submit" value="点击继续>>" onclick="return save();" />
  </p>
</form>
<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>

<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
<div class="clear"></div>
</div>

</body>
</html>