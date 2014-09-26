<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>


<div class="price">￥${server.pricename }/月</div>
<a href="../cart/order/order.htm?id=${server.id}">
	<input name="" type="button" value="订购" class="orangeBtn" onClick="window.location.href('../cart/order/order.htm?id=${server.id}')"/>
</a>