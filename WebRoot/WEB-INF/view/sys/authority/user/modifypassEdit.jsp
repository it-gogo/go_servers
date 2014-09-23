<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title></title>
	

  </head>
  
  <body >
    <form id="eForm" method="post" >
    
    <table width="100%" class="t2">
	    	     <tr>
	    			<td align="right" class="td_left">旧密码:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="password" name="oldpass" id="oldpass" data-options="required:true" style="width: 180px;" />
	    			 <span id="otip"></span>
	    			</td>
	    		</tr>
	    	    <tr>
	    			<td align="right" class="td_left">新密码:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="password" name="vo.pass" id="pass" data-options="required:true" style="width: 180px;"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td align="right" class="td_left" >确认密码:</td>
	    			<td>
	    			<input class="easyui-validatebox" type="password" name="pass1" id="pass1" data-options="required:true" style="width: 180px;" onblur="checkpass();"/>
	    			<span id="tip"></span>
	    			</td>
	    		</tr>
	    		</table>
	    		</form>
  </body>
  
</html>


