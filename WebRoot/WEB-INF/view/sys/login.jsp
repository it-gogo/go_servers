<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>孝感市食品药品监督管理局-行政审后台管理系统</title>
<link href="<%=request.getContextPath() %>/client/css/login_bs.css" type="text/css" rel="stylesheet" />
<%@include file="/section/common/includefile.jsp"%>
<style type="text/css">
input.inputF{color:#555;}
</style>
</head>
<body class="login_body">
 
    <div class="login_main">
        <form id="loginform" name="loginform" method="post" action="login.htm">
    	<div class="login">
        	<p class="input_name">
                <label>用户名：</label>
                <input name="name" value="${user.name }" type="text" class="inputF" id="name" onkeydown="nexttab()"/>  
            </p>
            <p class="input_password">
                <label>登录密码：</label> 
                <input name="pass" value="${user.pass }" type="password" class="inputF" id="pass" onkeydown="nexttab()"/>  
            </p>
             <%-- <p>
                <label>&nbsp;</label>
                <c:if test="${rememberPass==1 }">
	                <label><input name="rememberPass" type="checkbox" checked="checked" value="1" class="checkbox" align="middle"/> 记住密码</label> 
                </c:if>
                <c:if test="${rememberPass!=1 }">
                	<label><input name="rememberPass" type="checkbox"  value="1" class="checkbox" align="middle"/> 记住密码</label>
                </c:if>
               <label style="color:red;width: 150px;">${msg }</label> 
            </p> --%>
             <p>
                <label>&nbsp;</label>
                
                <input name="" type="button" class="login_but" value="登 录" onclick="javascript:login();"/>
                
                <!-- <input name="" type="button" class="login_but" value="登陆" onclick="javascript:login1();"/> -->
            </p>
        </div>
       </form>
    </div>
    <div class="login_footer">版权所有(C)2013-2014 孝感市食品药品监督管理局</div>
</body>
</html>

<script  type="text/javascript">
  function nexttab()
  {
       if(event.keyCode==13)
       {
          login1();
       }
  }
  
  //模拟登陆
  function  login1(){
       /*
       ajaxRequest('loginAction.action',{'act':'login','vo.userid':'admin','vo'},function(data){
       
       
       });
       */
       var userid=$("#name").val();
       var pass=$("#pass").val();
       document.location.href="loginAction.action?act=loginSuccess&po.userid="+userid+"&po.password="+pass;
  
  }
  
   function  login(){
      $("#loginform").form("submit",{
        url:'login.htm',
        success:function(data){
        	if(data==1){
        		document.location.href="../index/main.htm";
        	}else if(data==2){
        		alert("用户名或密码错误");
        	}else if(data==3){
        		 alert("用户已经禁用");
        	}
          /*  switch(data){
             case '1':
               document.location.href="../index/main.htm";
             break;
             case '2':
             alert("用户名或密码错误");
             break;
             case '3':
             alert("用户已经禁用");
             break;
           } */
        }
      });
   }
</script>