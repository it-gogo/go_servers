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
			<%@include file="/WEB-INF/view/client/login/common/topMenu.jsp"%>
		</c:if>
		<div id="content_left">
			<h1>购物车</h1>
			<!-- <p class="breadcrumb"><a href="cart.php">购物车</a></p><br /><br /> -->
			<p align="center">
				请等待页面跳转到付款网关……
			</p>
			<!-- <p align="center"><img src="images/loading.gif" alt="Loading" border="0" /></p> -->
			<!-- <div align="center" id="submitfrm"><a href='https://mapi.alipay.com/gateway.do?_input_charset=utf-8&body=RakSmart+-+Invoice+%E5%8F%91%E7%A5%A8%232802&notify_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_callback.php&out_trade_no=2802&partner=2088012653400252&payment_type=1&return_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_return.htm&seller_email=raksmartchina%40gmail.com&service=create_direct_pay_by_user&show_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs&subject=RakSmart+%E8%AE%A2%E5%8D%95&total_fee=448.62&sign=8a24db66675609e1f9b9bd6ec3a0adf9&sign_type=MD5' target=_blank ><img src='http://cn.raksmart.com/whmcs/modules/gateways/callback/alipay.gif' alt='点击使用支付宝支付'></a></div> -->
			<%-- <form method="GET" id="alipay"
				action="https://mapi.alipay.com/gateway.do" accept-charset="UTF-8">
				<input type='hidden' name='service'   value="${alipay.service }">
	<input type='hidden' name='partner' value="${alipay.partner}">
	<input type='hidden' name='_input_charset' value="${alipay._input_charset }">
	<input type='hidden' name='payment_type'   value="${alipay.payment_type}">
	<input type='hidden' name='notify_url'   value="${alipay.notify_url }">
	<input type='hidden' name='return_url'   value="${alipay.return_url }">
	<input type='hidden' name='seller_email'  value="${alipay.seller_email }">
	<input type='hidden' name='out_trade_no' value="${alipay.out_trade_no }">
	<input type='hidden' name='subject'   value="${alipay.subject }">
	<input type='hidden' name='total_fee'   value="${alipay.total_fee }">
	<input type='hidden' name='body'    value="${alipay.body }">
	<input type='hidden' name='paymethod' value="${alipay.paymethod }">
	<input type="hidden" name="defaultbank"  value="${alipay.defaultbank}">
	<input type='hidden' name='show_url'  style="width:300px;"   value="${alipay.show_url}">
	<input type="hidden" name="anti_phishing_key"  value="${alipay.anti_phishing_key}">
	<input type="hidden" name="exter_invoke_ip"  value="${alipay.exter_invoke_ip}">
	<input type="hidden" name="_input_charset"  value="utf-8">
	<input type="hidden" name="body"  value="RakSmart - Invoice 发票#3308">
	<input type="hidden" name="notify_url"  value="http://cn.raksmart.com/whmcs/modules/gateways/callback/alipay_callback.php">
	<input type="hidden" name="out_trade_no"  value="3308">
	<input type="hidden" name="partner"  value="2088012653400252">
	<input type="hidden" name="payment_type"  value="1">
	<input type="hidden" name="return_url"  value="http://cn.raksmart.com/whmcs/modules/gateways/callback/alipay_return.htm">
	<input type="hidden" name="seller_email"  value="raksmartchina@gmail.com">
	<input type="hidden" name="service"  value="create_direct_pay_by_user">
	<input type="hidden" name="show_url"  value="http://cn.raksmart.com/whmcs">
	<input type="hidden" name="subject"  value="RakSmart 订单">
	<input type="hidden" name="total_fee"  value="112.16">
	<input type="hidden" name="sign"  value="5f8a1964aa29618a4f2e2ed71db07853">
	<input type="hidden" name="sign_type"  value="MD5">
				
			</form> --%>
			${form }
			<br />
			<br />
			<br />

			<!-- <script language="javascript">
				var send = 3;
				var interval;
				$(function() {
					interval = window.setInterval(caltime, 1000);
					//setTimeout(toPay,5000);

				});

				//跳转到支付平台
				function toPay() {
					$("#alipay").submit();
				}

				//计算倒计时时间
				function caltime() {
					if (send == 0) {
						window.clearInterval(interval);
						toPay();
					} else {
						$("#t").html(send);
						send--;
					}
				}
			</script> -->


			<%@include file="/WEB-INF/view/client/login/common/foot.jsp"%>
			<%@include file="/WEB-INF/view/client/login/common/quickView.jsp"%>
			<div class="clear"></div>
		</div>
</body>
</html>