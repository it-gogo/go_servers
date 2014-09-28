<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>智易推 - Invoice 发票#2798</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/client/css/invoicestyle.css">
</head>
<body bgcolor="#efefef">
	<table id="wrapper" cellspacing="1" cellpadding="10" bgcolor="#cccccc"
		align="center">
		<tr>
			<td bgcolor="#ffffff">
				<table width="100%">
					<tr>
						<td width="50%">
							<h1>智易推</h1></td>
						<td width="50%" align="center"><font class="unpaid">未付款</font><br />
							<!-- <form method="post" action="/whmcs/viewinvoice.php?id=2798">
								<input type="hidden" name="token" value="94654432631de90dbd2efb31ef495b031752c28a" />
								<select name="gateway" size="1" onchange="submit()">
									<option value="alipay" selected="selected">支付宝</option>
									<option value="paypal">PayPal</option>
								</select>
							</form>  -->
							<a href='https://mapi.alipay.com/gateway.do?_input_charset=utf-8&body=RakSmart+-+Invoice+%E5%8F%91%E7%A5%A8%232798&notify_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_callback.php&out_trade_no=2798&partner=2088012653400252&payment_type=1&return_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs%2Fmodules%2Fgateways%2Fcallback%2Falipay_return.htm&seller_email=raksmartchina%40gmail.com&service=create_direct_pay_by_user&show_url=http%3A%2F%2Fcn.raksmart.com%2Fwhmcs&subject=RakSmart+%E8%AE%A2%E5%8D%95&total_fee=312.23&sign=e7957b606f19b9698b37a5787fc43246&sign_type=MD5' target=_blank>
								<img src='http://cn.raksmart.com/whmcs/modules/gateways/callback/alipay.gif' alt='点击使用支付宝支付'>
							</a>
						</td>
					</tr>
				</table> <br />
				<table width="100%" id="invoicetoptables" cellspacing="0">
					<tr>
						<td width="50%" id="invoicecontent"
							style="border:1px solid #cccccc">
							<table width="100%" height="120" cellspacing="0" cellpadding="10"
								id="invoicetoptables">
								<tr>
									<td id="invoicecontent" valign="top"
										style="border:1px solid #cccccc"><strong>发票至</strong><br />
										1 1<br /> 1, <br /> 1, 1, 1<br /> China</td>
								</tr>
							</table></td>
						<td width="50%" id="invoicecontent"
							style="border:1px solid #cccccc;border-left:0px;">

							<table width="100%" height="120" cellspacing="0" cellpadding="10"
								id="invoicetoptables">
								<tr>
									<td id="invoicecontent" valign="top"
										style="border:1px solid #cccccc"><strong>付款至</strong><br />
										RAKsmart</td>
								</tr>
							</table></td>
					</tr>
				</table>
				<p>
					<strong>Invoice 发票#2798</strong><br /> 发票日期: 2014/09/25<br />
					到期日: 2014/09/25
				</p>
				<table cellspacing="0" id="invoiceitemstable" align="center">
					<tr>
						<td id="invoiceitemsheading" align="center" width="70%"
							style="border:1px solid #cccccc;border-bottom:0px;"><strong>描述</strong>
						</td>
						<td id="invoiceitemsheading" align="center" width="30%"
							style="border:1px solid #cccccc;border-left:0px;border-bottom:0px;"><strong>金额</strong>
						</td>
					</tr>
					<tr bgcolor=#ffffff>
						<td id="invoiceitemsrow"
							style="border:1px solid #cccccc;border-bottom:0px;">RAK C512
							- 1 (2014/09/25 - 2015/09/24)</td>
						<td align="center" id="invoiceitemsrow"
							style="border:1px solid #cccccc;border-bottom:0px;border-left:0px;">$180.00USD</td>
					</tr>
					<tr>
						<td id="invoiceitemsheading"
							style="border:1px solid #cccccc;border-bottom:0px;"><div
								align="right">小计:&nbsp;</div>
						</td>
						<td id="invoiceitemsheading" align="center"
							style="border:1px solid #cccccc;border-bottom:0px;border-left:0px;"><strong>$180.00USD</strong>
						</td>
					</tr>
					<tr>
						<td id="invoiceitemsheading"
							style="border:1px solid #cccccc;border-bottom:0px;"><div
								align="right">credit:&nbsp;</div>
						</td>
						<td id="invoiceitemsheading" align="center"
							style="border:1px solid #cccccc;border-bottom:0px;border-left:0px;"><strong>$0.00USD</strong>
						</td>
					</tr>
					<tr>
						<td id="invoiceitemsheading" style="border:1px solid #cccccc;"><div
								align="right">共计:&nbsp;</div>
						</td>
						<td id="invoiceitemsheading" align="center"
							style="border:1px solid #cccccc;border-left:0px;"><strong>$180.00USD</strong>
						</td>
					</tr>
				</table>
				<p>
					<strong>交易</strong>
				</p>
				<table cellspacing="0" id="invoiceitemstable" align="center">
					<tr>
						<td id="invoiceitemsheading" align="center" width="30%"
							style="border:1px solid #cccccc"><strong>交易日</strong>
						</td>
						<td id="invoiceitemsheading" align="center" width="25%"
							style="border:1px solid #cccccc;border-left:0px;"><strong>网关</strong>
						</td>
						<td id="invoiceitemsheading" align="center" width="25%"
							style="border:1px solid #cccccc;border-left:0px;"><strong>交易ID</strong>
						</td>
						<td id="invoiceitemsheading" align="center" width="20%"
							style="border:1px solid #cccccc;border-left:0px;"><strong>金额</strong>
						</td>
					</tr>
					<tr bgcolor=#ffffff>
						<td id="invoiceitemsrow" align="center"
							style="border:1px solid #cccccc;border-top:0px;">2014/09/25</td>
						<td align="center" id="invoiceitemsrow"
							style="border:1px solid #cccccc;border-left:0px;border-top:0px;">支付宝</td>
						<td align="center" id="invoiceitemsrow"
							style="border:1px solid #cccccc;border-left:0px;border-top:0px;">2014092527172762</td>
						<td align="center" id="invoiceitemsrow"
							style="border:1px solid #cccccc;border-left:0px;border-top:0px;">$129.89USD</td>
					</tr>
					<tr>
						<td id="invoiceitemsheading" width="30%"
							style="border:1px solid #cccccc;border-top:0px;" colspan=3><DIV
								ALIGN="right">
								<strong>余额:&nbsp;</strong>
							</DIV>
						</td>
						<td id="invoiceitemsheading" align="center" width="20%"
							style="border:1px solid #cccccc;border-left:0px;border-top:0px;"><strong>$50.11USD</strong>
						</td>
					</tr>
				</table> <br />
			<br />
			<br />
			<br />
			<br /></td>
		</tr>
	</table>


	<p align="center">
		<a href="clientarea.php">&laquo; 返回客户区</a> | <a
			href="dl.php?type=i&amp;id=2798">下载</a> | <a
			href="javascript:window.close()">关闭窗口</a>
	</p>

</body>
</html>