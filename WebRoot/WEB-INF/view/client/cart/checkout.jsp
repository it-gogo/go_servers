<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp">
	<jsp:param value="结账" name="name" />
</jsp:include>
</head>
<body>

<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp"%>
<div id="content_container">
  	<c:if test="${loginInfo!=null }">
		<%@include file="/WEB-INF/view/client/login/common/topMenu.jsp" %>
	</c:if>
  <div id="content_left">
    <h1>购物车</h1>
    <!-- <p class="breadcrumb"><a href="cart.php">购物车</a></p><br /><br /> -->
<p align="center">请等待页面跳转到付款网关……</p>
<p align="center"><img src="images/loading.gif" alt="Loading" border="0" /></p>
<div align="center" id="submitfrm"><a href='https://mapi.alipay.com/gateway.do?_input_charset=utf-8&body=RakSmart+-+Invoice+%E5%8F%91%E7%A5%A8%232802&notify_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_callback.php&out_trade_no=2802&partner=2088012653400252&payment_type=1&return_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_return.htm&seller_email=raksmartchina%40gmail.com&service=create_direct_pay_by_user&show_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs&subject=RakSmart+%E8%AE%A2%E5%8D%95&total_fee=448.62&sign=8a24db66675609e1f9b9bd6ec3a0adf9&sign_type=MD5' target=_blank ><img src='http://cn.raksmart.com/whmcs/modules/gateways/callback/alipay.gif' alt='点击使用支付宝支付'></a></div>
<form method="post" action="viewinvoice.php?id=2802"></form>
<br /><br /><br />

<script language="javascript">
setTimeout ( "autoForward()" , 5000 );
function autoForward() {
    var submitForm = $("#submitfrm").find("form");
    submitForm.submit();
}
</script>


<%@include file="/WEB-INF/view/client/login/common/foot.jsp" %>
<%@include file="/WEB-INF/view/client/login/common/quickView.jsp" %>
  <div class="clear"></div>
</div>

</body>
</html>