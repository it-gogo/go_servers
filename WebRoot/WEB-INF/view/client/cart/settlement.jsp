<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/client/loginCss/cartStyle.css" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp">
	<jsp:param value="购物车" name="name" />
</jsp:include>
<script  type="text/javascript">
/**
*移除商品
*/
function removeProduct(productid){
	var ok=confirm("确定移除该服务器。");
	if(ok){
		var url="removeProduct.htm";
		$.ajax({
			clearForm: false,
			url:url,
			data:"id="+productid,
			success:function(data){
				if(data==1){
					hiddenDiv(productid);
				}
	        }
		});
	}
}
/**
*清空购物车
*/
function emptyCart(cartid){
	var ok=confirm("确定要清空购物车？");
	if(ok){
		var url="emptyCart.htm";
		$.ajax({
			clearForm: false,
			url:url,
			data:"id="+cartid,
			success:function(data){
				if(data==1){
					hiddenDiv(productid);
				}
	        }
		});
	}
}

function selectCust(cust){
	if(cust=="new"){//新客服
		hiddenDiv('loginfrm');
		showDiv('signupfrm');
		$("#newcust").addClass("active");
		$("#existingcust").removeClass("active");
	}else if(cust=="old"){//老客服
		hiddenDiv('signupfrm');
		showDiv('loginfrm');
		$("#existingcust").addClass("active");
		$("#newcust").removeClass("active");
	}
}
</script>
</head>
<body>

	<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp"%>
	<div id="content_container">
		<div id="content_left">
			<h1>购物车</h1>
			<p class="breadcrumb">
				<a href="cart.php">购物车</a>
			</p>
			<div id="order-modern">
				<h1>审核&结算</h1>
				<div class="clear"></div>
				<form method="post" action="/whmcs/cart.php?a=view">
					<input type="hidden" name="token"
						value="0073245fe7ca0bb81bb909e04f0a1333926a0842" />
					<table class="cart" cellspacing="1">
						<tr class="textcenter">
							<th width="60%">描述</th>
							<th width="40%">价格</th>
						</tr>
						<c:if test="${cart.productlist!=null &&  cart.productlist.size()!=0}">
							<c:forEach items="${cart.productlist }" var="product" varStatus="i" >
								<tr class="carttableproduct" id="${product.id }">
										<td>
											<strong><em>${product.type }</em> - ${product.servername }</strong> (${i.getIndex()+1 })<br /> 
											<!-- &nbsp;&raquo; 操作系统:: CentOS 5.4<br />
											&nbsp;&raquo; IP地址:: 5个可用的ip (包含的)<br />
											&nbsp;&raquo; 额外的内存:: 2G内存 (包含的)<br />
											&nbsp;&raquo; 控制面板:	: 无<br />
											&nbsp;&raquo; IPMI:	: 无IPMI<br /> -->
											<a href="modifyConfiguration.htm?id=${product.id }" class="cartedit">[编辑配置]</a>
											<a href="#" onclick="removeProduct(${product.id});" class="cartremove">[移除]</a>
										</td>
										<td class="textcenter"><strong>$${product.monthlyPrice*product.numMonth }USD</strong>
										<c:set value="${totalprice+product.monthlyPrice*product.numMonth }" var="totalprice"></c:set>
										</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${cart.productlist==null ||  cart.productlist.size()==0}">
						<tr class="clientareatableactive">
							<td colspan="2" class="textcenter">
								</br>"购物车0件"</br></br>
							</td>
						</tr>
						</c:if>
						<tr class="subtotal">
							<td class="textright">小计: &nbsp;</td>
							<td class="textcenter">$${totalprice }USD</td>
						</tr>
						<tr class="total">
							<td class="textright">当前总价: &nbsp;</td>
							<td class="textcenter">$${totalprice }USD</td>
						</tr>
						<!-- <tr class="recurring">
							<td class="textright">Total Recurring: &nbsp;</td>
							<td class="textcenter">$${totalprice }USD 年度<br />
							</td>
						</tr> -->
					</table>
				</form>
				<div class="cartbuttons">
					<input type="button" value="购物车为空" onclick="window.location='emptyCart.htm?id=${cart.id}'" /> 
					<input type="button" value="继续购物" onclick="window.location='../../'" />
				</div>
				<form method="post" action="/whmcs/cart.php?a=checkout" id="mainfrm">
					<input type="hidden" name="token" value="0073245fe7ca0bb81bb909e04f0a1333926a0842" /> 
					<input type="hidden" name="submit" value="true" /> 
					<input type="hidden" name="custtype" id="custtype" value="new" /> <br />
					<br />

					<h2>您的详细情况</h2>
					<div style="float:left;width:20px;">&nbsp;</div>
					<div class="signuptype active" id="newcust" onclick="selectCust('new');">新客户</div>
					<div class="signuptype" id="existingcust" onclick="selectCust('old');">老客户</div>
					<div class="clear"></div>
					<div class="signupfields hidden" id="loginfrm">
						<table width="100%" cellspacing="0" cellpadding="0"
							class="configtable">
							<tr>
								<td class="fieldlabel">邮件地址</td>
								<td class="fieldarea"><input type="text" name="loginemail"
									size="40" />
								</td>
							</tr>
							<tr>
								<td class="fieldlabel">密码</td>
								<td class="fieldarea"><input type="password" name="loginpw"
									size="25" />
								</td>
							</tr>
						</table>
					</div>
					<div class="signupfields" id="signupfrm">
						<table width="100%" cellspacing="0" cellpadding="0"
							class="configtable">
							<tr>
								<td class="fieldlabel">名</td>
								<td class="fieldarea"><input type="text" name="firstname"
									tabindex="1" style="width:80%;" value="" />
								</td>
								<td class="fieldlabel">地址1</td>
								<td class="fieldarea"><input type="text" name="address1"
									tabindex="7" style="width:80%;" value="" />
								</td>
							</tr>
							<tr>
								<td class="fieldlabel">姓</td>
								<td class="fieldarea"><input type="text" name="lastname"
									tabindex="2" style="width:80%;" value="" />
								</td>
								<td class="fieldlabel">地址2</td>
								<td class="fieldarea"><input type="text" name="address2"
									tabindex="8" style="width:80%;" value="" />
								</td>
							</tr>
							<tr>
								<td class="fieldlabel">公司名称</td>
								<td class="fieldarea"><input type="text" name="companyname"
									tabindex="3" style="width:80%;" value="" />
								</td>
								<td class="fieldlabel">城市</td>
								<td class="fieldarea"><input type="text" name="city"
									tabindex="9" style="width:80%;" value="" />
								</td>
							</tr>
							<tr>
								<td class="fieldlabel">邮件地址</td>
								<td class="fieldarea"><input type="text" name="email"
									tabindex="4" style="width:90%;" value="" />
								</td>
								<td class="fieldlabel">州/区</td>
								<td class="fieldarea"><input type="text" name="state"
									tabindex="10" style="width:80%;" value="" />
								</td>
							</tr>
							<tr>
								<td class="fieldlabel">密码</td>
								<td class="fieldarea"><input type="password"
									name="password" tabindex="5" id="newpw" size="20" value="" />
								</td>
								<td class="fieldlabel">邮编</td>
								<td class="fieldarea"><input type="text" name="postcode"
									tabindex="11" size="15" value="" />
								</td>
							</tr>
							<tr>
								<td class="fieldlabel">确认密码</td>
								<td class="fieldarea"><input type="password"
									name="password2" tabindex="6" size="20" value="" />
								</td>
								<td class="fieldlabel">电话号码</td>
								<td class="fieldarea"><input type="text" name="phonenumber"
									tabindex="13" size="20" value="" />
								</td>
							</tr>
						</table>
					</div>

					<div class="checkoutcol1">

						<!-- <div class="signupfields padded">
							<h2>优惠码</h2>
							<input type="text" name="promocode" size="20" value="" /> <input
								type="submit" name="validatepromo" value="激活优惠码 >>" />
						</div> -->

						<div class="signupfields padded">
							<h2>备注/额外信息</h2>
							<textarea name="notes" rows="2" style="width:100%"
								onFocus="if(this.value=='您可以在此处输入其他备注或订单信息……'){this.value='';}"
								onBlur="if (this.value==''){this.value='您可以在此处输入其他备注或订单信息……';}">您可以在此处输入其他备注或订单信息……</textarea>
						</div>

					</div>
					<div class="checkoutcol2">

						<div class="signupfields padded">
							<h2>支付方式</h2>
							<label><input type="radio" name="paymentmethod"
								value="alipay" id="pgbtnalipay" onclick="hideCCForm()" checked />
								支付宝</label> <label><input type="radio" name="paymentmethod"
								value="paypal" id="pgbtnpaypal" onclick="hideCCForm()" />
								PayPal</label> <br />
							<br />

							<!-- <div id="ccinputform" class="signupfields hidden">
								<table width="100%" cellspacing="0" cellpadding="0"
									class="configtable textleft">
									<input type="hidden" name="ccinfo" value="new" />
									<tr class="newccinfo">
										<td class="fieldlabel">卡类型</td>
										<td class="fieldarea"><select name="cctype">
												<option>Visa</option>
												<option>Discover</option>
												<option>American Express</option>
												<option>JCB</option>
												<option>Diners Club</option>
										</select>
										</td>
									</tr>
									<tr class="newccinfo">
										<td class="fieldlabel">卡号</td>
										<td class="fieldarea"><input type="text" name="ccnumber"
											size="30" value="" autocomplete="off" />
										</td>
									</tr>
									<tr class="newccinfo">
										<td class="fieldlabel">到期日</td>
										<td class="fieldarea"><select name="ccexpirymonth"
											id="ccexpirymonth" class="newccinfo">
												<option>01</option>
												<option>02</option>
												<option>03</option>
												<option>04</option>
												<option>05</option>
												<option>06</option>
												<option>07</option>
												<option>08</option>
												<option>09</option>
												<option>10</option>
												<option>11</option>
												<option>12</option>
										</select> / <select name="ccexpiryyear" class="newccinfo">
												<option>2014</option>
												<option>2015</option>
												<option>2016</option>
												<option>2017</option>
												<option>2018</option>
												<option>2019</option>
												<option>2020</option>
												<option>2021</option>
												<option>2022</option>
												<option>2023</option>
												<option>2024</option>
												<option>2025</option>
												<option>2026</option>
										</select>
										</td>
									</tr>
									<tr>
										<td class="fieldlabel">CVV/CVC2值</td>
										<td class="fieldarea"><input type="text" name="cccvv"
											value="" size="5" autocomplete="off" /> <a href="#"
											onclick="window.open('images/ccv.gif','','width=280,height=200,scrollbars=no,top=100,left=100');return false">何处查询？</a>
										</td>
									</tr>
								</table>
							</div> -->

						</div>

					</div>
					<div class="clear"></div>


					<div align="center">
						<input type="submit" value="完成订单" onclick="this.value='请等待……'"
							class="ordernow" />
					</div>

				</form>


				<div class="cartwarningbox">
					<img src="<%=request.getContextPath()%>/client/loginCss/images/padlock.gif" align="absmiddle" border="0"
						alt="Secure Transaction" /> &nbsp; 订单安全防护能够抵御IP地址欺诈行为 (<strong><%=request.getLocalAddr() %></strong>)
					已登录
				</div>

			</div>

			<%@include file="/WEB-INF/view/client/login/common/foot.jsp"%>
			<%@include file="/WEB-INF/view/client/login/common/quickView.jsp"%>
			<div class="clear"></div>
		</div>
</body>
</html>