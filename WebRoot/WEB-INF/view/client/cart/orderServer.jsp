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
function count(){
	var c=$("input[type='radio']:checked");
	var data=c.attr("title");
	var json = eval("("+data+")");
	var monthlyPrice=json.monthlyPrice;
	var numMonth=json.numMonth;
	var quarter=json.quarter;
	var servername=$("#servername").val();
	var totalprice=monthlyPrice*numMonth;
	$("#quarter").html(quarter);
	var array=getConfigurationArray();
	var html="<tbody><tr><td>"+servername+"</td><td class=\"textright\" >￥"+(monthlyPrice*numMonth)+"</td></tr>";//服务器
	for(var i=0;i<array.length;i++){
		var obj=array[i];
		var value=obj["value"];
		value=value.substring(0,value.lastIndexOf("￥"));
		var price=obj["price"]*numMonth;
		totalprice+=price;
		html+="<tr><td>&nbsp;&raquo; "+obj["name"]+":"+value+"</td><td class=\"textright\" >￥"+price+"</td></tr>";
	}
	html+="</tbody>";
	//alert(html)
	$(".totalprice").html(totalprice);
	$("#totalprice").val(totalprice);
	$(".ordersummarytbl").html(html);
}
//获得可配置项数组
function getConfigurationArray(){
	var obj=$(".configurationTr");
	var array=new Array();
	for(var i=0;i<obj.size();i++){
		var o=obj.eq(i);
		var sel=o.find("select");
		var inp=o.find("input");
		var json=new Object();
		json["id"]=sel.val();//选择ID
		json["name"]=inp.val();//类型名称
		json["value"]=sel.find("option:selected").text();//选择的值
		json["price"]=sel.find("option:selected").get(0).title;//选择的价格
		//var obj = document.getElementById('select的ID');
		//title值 = obj.childNodes[obj.selectedIndex].title;
		 array[array.length] = json;
	}
	return array;
}
function save(status){
	var $obj=$(".requires");//必填项
	for(var i=0;i<$obj.size();i++){
		if($obj.eq(i).val()==""){
			$obj.eq(i).focus();
			return false;
		}
	}
	var jsonStr=$.toJSON(getConfigurationArray());
	$("#configuration").val(jsonStr);
	var formid="orderfrm";
	$("#orderfrm").submit(function() {
        $("#orderfrm").ajaxSubmit({
        	clearForm: false,
        	url:"submitPublic.htm",
        	success:function(responseText){
        		if(status==0){
	        		location.href="lookCart.htm";
        		}else if(status==1){
        			location.href="../../../";
        		}
          	}
        }); 
        return false;
	}); 
	$("#orderfrm").submit();
}
</script>
</head>
<body onload="count();">

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
					<input type="hidden" value="${server.name }" name="servername" id="servername" />
					<input type="hidden" value="" name="configuration" id="configuration" />
					<input type="hidden" value="" name="totalprice" id="totalprice" />
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
												<c:if test="${i.getIndex()==0 }">
													<c:set value="${price}" var="one" ></c:set>
													<!-- <script>
														$(document).ready(function(){
															count(${price.monthlyPrice},${price.numMonth },'${price.quarter }','${server.name }');
														});
													</script> -->
												</c:if>
												<input type="radio" title='${price }' name="price" id="${price.id }" value="${price.id }"  <c:if test="${i.getIndex()==0 }">checked </c:if>  onclick="count();" />
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
												<c:if test="${price.id==product.price }">
													<c:set value="${price}" var="one"></c:set>
													<!-- <script>
														$(document).ready(function(){
															count(${price.monthlyPrice},${price.numMonth },'${price.quarter }','${server.name }');
														});
													</script> -->
												</c:if>
												<input type="radio" title='${price }'  name="price" id="${price.id }" value="${price.id }"  <c:if test="${price.id==product.price }">checked</c:if>  onclick="count()" />
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
										<input type="text" name="hostname" size="15" value="${product.hostname }" class="requires" /> eg. server1(.yourdomain.com)
									</td>
								</tr>
								<tr>
									<td class="fieldlabel">NS1 前缀:</td>
									<td class="fieldarea">
										<input type="text" name="ns1prefix" size="10" value="${product.ns1prefix }" class="requires"  /> eg. ns1(.yourdomain.com)
									</td>
								</tr>
								<tr>
									<td class="fieldlabel">NS2 前缀:</td>
									<td class="fieldarea">
										<input type="text" name="ns2prefix"size="10" value="${product.ns2prefix }" class="requires"  /> eg. ns2(.yourdomain.com)
									</td>
								</tr>
								<tr>
									<td class="fieldlabel">Root密码:</td>
									<td class="fieldarea">
										<input type="password" name="rootpw" size="20" value="${product.rootpw }" class="requires"  />
									</td>
								</tr>
							</table>
						</div>
						<c:if test="${map!=null && map.size()!=0}">
							<h3>可配置项</h3>
							<div class="serverconfig">
								<table width="100%" cellspacing="0" cellpadding="0" class="configtable">
									<c:forEach items="${map }" var="entry"  varStatus="i">
										<tr class="configurationTr">
											<td class="fieldlabel">${entry.key }:<input type="hidden" value="${entry.key }" /></td>
											<td class="fieldarea">
													<c:set value="${configurationmap[entry.key] }" var="configurationvalue"></c:set>
												<select style="width: 240px;"   onchange="count();"  >
													<c:forEach items="${entry.value }" var="configuration" >
														<option title="${configuration.price}" value="${configuration.id }"<c:if test="${configurationvalue!=null && configurationvalue.id==configuration.id  }">selected="true"</c:if> >${configuration.name } <c:if test="${configuration.price!=0 }">￥${configuration.price}</c:if></option>
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
								<c:if test="${server.serverTypeId==1 }">"云主机" - </c:if>
								<c:if test="${server.serverTypeId==3 }">"独立服务器" - </c:if>
								<c:if test="${server.serverTypeId==4 }">"站群服务器" - </c:if>
								<c:if test="${server.serverTypeId==5 }">"Windows VPS" - </c:if>
								<c:if test="${server.serverTypeId==6 }">"Linux VPS" - </c:if>
								<c:if test="${server.serverTypeId==7 }">"HK VPS" - </c:if>
								<b>${server.name }</b>
							</div>
							<table class="ordersummarytbl" >
							</table>
							<div class="summaryproduct"></div>
							<table width="100%">
								<tbody>
									<tr>
										<td>设置费用</td>
										<td class="textright" >￥0.00</td>
									</tr>
									<tr>
										<td id="quarter">${one.quarter }</td>
										<td class="textright" >￥<span class="totalprice">${one.monthlyPrice*one.numMonth }</span></td>
									</tr>
								</tbody>
							</table>
							<div class="summaryproduct"></div>
							<table width="100%">
								<tbody>
									<tr>
										<td colspan="2" class="textright" >
											"当前总价: "
											￥<span class="totalprice">${one.monthlyPrice*one.numMonth }</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="checkoutbuttons">
							<input type="button" value="结算 &raquo;" class="checkout" onclick="save(0);" /><br /> 
							<input type="button" value="继续购物" onclick="save(1);" /><br /> 
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