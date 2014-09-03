<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>

<h2>Spam Bot验证</h2>
  <p>请在文本框中输入下图字符，避免系统自动提交。</p>
    <p align="center"><img src="../imageProcessing/showCode.htm" align="middle" onclick="javascript:this.src='../imageProcessing/showCode.htm?id='+Math.random();"/> <input type="text" name="code" size="10" maxlength="5" onblur="checkCode(this);" /></p>
    <p> </p>
  <p align="center">
    <input type="submit" value="点击继续>>" />
  </p>
</form>
<br />