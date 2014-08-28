<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>

<div id="side_menu">
    <p class="header">快速浏览</p>
    <ul>
      <li><a href="index.htm"><img src="templates/portal/images/icons/support.gif" alt="门户主页" width="16" height="16" border="0" class="absmiddle" /></a> <a href="index.htm" title="门户主页">门户主页</a></li>
      <li><a href="cusomerArea.htm"><img src="templates/portal/images/icons/clientarea.gif" alt="客户区" width="16" height="16" border="0" class="absmiddle" /></a> <a href="cusomerArea.htm" title="客户区">客户区</a></li>
      <li><a href="notice.htm" title="公告"><img src="templates/portal/images/icons/announcement.gif" alt="公告" width="16" height="16" border="0" class="absmiddle" /></a> <a href="notice.htm" title="公告">公告</a></li>
      <li><a href="knowledgebase.php" title="知识库"><img src="templates/portal/images/icons/knowledgebase.gif" alt="知识库" width="16" height="16" border="0" class="absmiddle" /></a> <a href="knowledgebase.php" title="知识库">知识库</a></li>
      <li><a href="submitticket.php" title="提交Ticket"><img src="templates/portal/images/icons/submit-ticket.gif" alt="提交Ticket" width="16" height="16" border="0" class="absmiddle" /></a> <a href="submitticket.php" title="服务Tickets">提交Ticket</a></li>
      <li><a href="downloads.php" title="下载"><img src="templates/portal/images/icons/downloads.gif" alt="下载" width="16" height="16" border="0" class="absmiddle" /></a> <a href="downloads.php" title="下载">下载</a></li>
      <li><a href="cart.php" title="订单"><img src="templates/portal/images/icons/order.gif" alt="订单" width="16" height="16" border="0" class="absmiddle" /></a> <a href="cart.php" title="订单">订单</a></li>
    </ul>
<form method="post" action="dologin.php">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" />
  <p class="header">客户登录</p>
  <p><strong>邮件</strong><br />
    <input name="username" type="text" size="25" />
  </p>
  <p><strong>密码</strong><br />
    <input name="password" type="password" size="25" />
  </p>
  <p>
    <input type="checkbox" name="rememberme" />
    记住我</p>
  <p>
    <input type="submit" class="submitbutton" value="登录" />
  </p>
</form>
  <p class="header">搜索</p>
<form method="post" action="knowledgebase.php?action=search">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" />
  <p>
    <input name="search" type="text" size="25" /><br />
    <select name="searchin">
      <option value="Knowledgebase">知识库</option>
      <option value="Downloads">下载</option>
    </select>
    <input type="submit" value="Go" />
  </p>
</form>
  </div>