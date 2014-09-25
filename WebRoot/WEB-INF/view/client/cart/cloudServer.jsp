<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/client/loginCss/cartStyle.css" />
<jsp:include page="/WEB-INF/view/client/login/common/head.jsp">
	<jsp:param value="购物车" name="name" />
</jsp:include>
<script type="text/javascript">
function count(price,quarter){
	$(".price").html(price);
	$("#quarter").html(quarter);
}
function save(){
	var formid="orderfrm";
	$("#orderfrm").submit(function() {
        $("#orderfrm").ajaxSubmit({
        	clearForm: false,
        	url:"submitPublic.htm",
        	success:function(responseText){
        		location.href="lookCart.htm";
          	}
        }); 
        return false;
	}); 
	$("#orderfrm").submit();
}
</script>
</head>
<body>

	<%@include file="/WEB-INF/view/client/login/common/topContainer.jsp"%>
	<div id="content_container">
		<div id="content_left">
			<h1>购物车</h1>
			<!-- <p class="breadcrumb">
				<a href="cart.php">购物车</a>
			</p> -->
			<div id="order-modern">
				<form id="orderfrm" action="../cart/submitPublic.htm" method="post">
					<input type="hidden" value="${product.id }" name="id" />
					<input type="hidden" value="云主机" name="type" />
					<input type="hidden" value="${server.id }" name="server" />
					<input type="hidden" value="${server.name }" name="servername" />
					<h1>配置</h1>
					<div id="configproducterror" class="errorbox"></div>
					<div class="prodconfigcol1">
						<h3>订单周期</h3>
						<div class="billingcycle">
							<table width="100%" cellspacing="0" cellpadding="0" class="configtable">
								<c:if test="${product==null || product.price==null }">
									<c:forEach items="${server.pricelist }" var="price" varStatus="i" >
										<tr>
											<td class="radiofield">
												<c:if test="${i.getIndex()==0 }"><c:set value="${price}" var="one"></c:set></c:if>
												<input type="radio" name="price" id="${price.id }" value="${price.id }"  <c:if test="${i.getIndex()==0 }">checked</c:if>  onclick="count(${price.monthlyPrice*price.numMonth},'${price.quarter }')" />
											</td>
											<td class="fieldarea">
												<label for="${price.id }">${price.name }</label>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${product!=null && product.price!=null }">
									<c:forEach items="${server.pricelist }" var="price" varStatus="i" >
										<tr>
											<td class="radiofield">
												<c:if test="${price.id==product.price }"><c:set value="${price}" var="one"></c:set></c:if>
												<input type="radio" name="price" id="${price.id }" value="${price.id }"  <c:if test="${price.id==product.price }">checked</c:if>  onclick="count(${price.monthlyPrice*price.numMonth},'${price.quarter }')" />
											</td>
											<td class="fieldarea">
												<label for="${price.id }">${price.name }</label>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>

						<h3>配置服务器</h3>
						<div class="serverconfig">
							<table width="100%" cellspacing="0" cellpadding="0"
								class="configtable">
								<tr>
									<td class="fieldlabel">主机名:</td>
									<td class="fieldarea">
										<input type="text" name="hostname" size="15" value="${product.hostname }" /> eg. server1(.yourdomain.com)
									</td>
								</tr>
								<tr>
									<td class="fieldlabel">NS1 前缀:</td>
									<td class="fieldarea">
										<input type="text" name="ns1prefix" size="10" value="${product.ns1prefix }" /> eg. ns1(.yourdomain.com)
									</td>
								</tr>
								<tr>
									<td class="fieldlabel">NS2 前缀:</td>
									<td class="fieldarea">
										<input type="text" name="ns2prefix"size="10" value="${product.ns2prefix }" /> eg. ns2(.yourdomain.com)
									</td>
								</tr>
								<tr>
									<td class="fieldlabel">Root密码:</td>
									<td class="fieldarea">
										<input type="password" name="rootpw" size="20" value="${product.rootpw }" />
									</td>
								</tr>
							</table>
						</div>
						<c:if test="${map!=null && map.size()!=0}">
							<h3>可配置项</h3>
							<div class="serverconfig">
								<table width="100%" cellspacing="0" cellpadding="0" class="configtable">
									<c:forEach items="${map }" var="entry">
										<tr class="configurationTr">
											<td class="fieldlabel">${entry.key }:<input type="hidden" value="${entry.key }" /></td>
											<td class="fieldarea">
												<select style="width: 240px;" >
													<c:forEach items="${entry.value }" var="configuration" >
														<option value="${configuration.id }">${configuration.name }</option>
													</c:forEach>
												</select>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</c:if>
					</div>
					<div class="prodconfigcol2">
						<h3>订单概述</h3>
						<div class="ordersummary" id="producttotal">
							<div class="summaryproduct">
								"云主机" - 
								<b>${server.name }</b>
							</div>
							<table class="ordersummarytbl" >
								<tbody>
									<tr>
										<td>${server.name }</td>
										<td class="textright" >$<span class="price">${one.monthlyPrice*one.numMonth }</span>USD</td>
									</tr>
								</tbody>
							</table>
							<div class="summaryproduct"></div>
							<table width="100%">
								<tbody>
									<tr>
										<td>设置费用</td>
										<td class="textright" >$0.00UDS</td>
									</tr>
									<tr>
										<td id="quarter">${one.quarter }</td>
										<td class="textright" >$<span class="price">${one.monthlyPrice*one.numMonth }</span>USD</td>
									</tr>
								</tbody>
							</table>
							<div class="summaryproduct"></div>
							<table width="100%">
								<tbody>
									<tr>
										<td colspan="2" class="textright" >
											"当前总价: "
											$<span class="price">${one.monthlyPrice*one.numMonth }</span>USD
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="checkoutbuttons">
							<input type="button" value="结算 &raquo;" class="checkout" onclick="save();" /><br /> 
							<input type="button" value="继续购物" onclick="window.location='../../';" /><br /> 
							<input type="button" value="查看购物车" onclick="window.location='lookCart.htm'" />
						</div>
					</div>
					<div class="clear"></div>
				</form>
			</div>

			<%@include file="/WEB-INF/view/client/login/common/foot.jsp"%>
			<%@include file="/WEB-INF/view/client/login/common/quickView.jsp"%>
			<div class="clear"></div>
		</div>
</body>
</html>