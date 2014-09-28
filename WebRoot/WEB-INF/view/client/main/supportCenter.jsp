<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="/WEB-INF/view/client/common/head.jsp">
	<jsp:param value="技术中心" name="name" />
</jsp:include>
</head>

<body>
	<%@include file="/WEB-INF/view/client/common/header.jsp"%>

	<div id="cloudsupport"></div>
	<!--aboutBanner end-->
	<div class="container">
		<ul class="halfGrid">
			<li>
				<h2>
					<a href="../login/index/index.htm">客户门户</a>
				</h2>
				<p>
					<p>账号和服务一站式管理</p>
				</p></li>
		</ul>
		<!-- <ul class="halfGrid">
			<li>
				<h2>
					<a href="http://cn.raksmart.com/whmcs/">知识库</a>
				</h2>
				<p>
					<p>专家提示、文章、教程和FAQs&nbsp;</p>
				</p></li>
		</ul> -->
		<ul class="halfGrid">
			<li>
				<h2>
					<a name="4" id="4"></a>网络状态
				</h2>
				<p>
					<p>当前无激活紧急事件提示或通告，确保客户</p>
					<p>服务系统正常运行。</p>
				</p></li>
		</ul>
		<ul class="halfGrid">
			<li>
				<h2>
					<a name="5" id="5"></a>API 文档
				</h2>
				<p>
					<p>
						如果您希望获取API文档，请联系 <a href="mailto:idcchina@raksmart.com"
							target="_blank"><span
							style="font-style:italic;color:#0000ff;"><u>idcchina@raksmart.com</u>
						</span>
						</a> 。
					</p>
				</p></li>
		</ul>

		<ul class="halfGrid" style="margin-top:50px">
			<li>
				<h2>联系方式</h2>
				<ul>
					<p>美国加利福利亚95113圣何塞市场南街55号320室</p>
					<!-- <p>
						街道图片&nbsp;<a
							href="http://3.bp.blogspot.com/-Msyy7lsDdCM/Ublu3JBzD4I/AAAAAAAAJPk/cblLMqQreGM/s1600/55market.png"
							target="_blank"><span
							style="font-style:italic;color:#0000ff;">查看</span>
						</a>
					</p> -->
					<p>
						<span style="color:#4c33e5;"><strong>QQ:</strong>
						</span><span style="line-height:1.5;color:#4C33E5;"><strong>2625443884</strong>
						</span>
					</p>
					<p>
						<span style="color:#4c33e5;"><strong>Email:</strong>
						</span><a href="mailto:idcchina@raksmart.com"><span
							style="color:#4C33E5;"><strong>idcchina@raksmart.com</strong>
						</span>
						</a>
					</p>
					<!-- <p>
						<iframe height="200"
							src="https://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=Suite+320,+55+South+Market+Street,+San+Jose,+CA+95133&aq=&sll=37.333735,-121.891354&sspn=0.011175,0.022337&ie=UTF8&hq=&hnear=55+S+Market+St+%23320,+San+Jose,+California+95113&t=m&ll=37.334201,-121.890907&spn=0.010237,0.012832&z=15&output=embed"
							frameborder="0" width="300"> </iframe>
					</p>
					<a
						href="https://maps.google.com/maps?f=q&source=embed&hl=en&geocode=&q=Suite+320,+55+South+Market+Street,+San+Jose,+CA+95133&aq=&sll=37.333735,-121.891354&sspn=0.011175,0.022337&ie=UTF8&hq=&hnear=55+S+Market+St+%23320,+San+Jose,+California+95113&t=m&ll=37.334201,-121.890907&spn=0.010237,0.012832&z=15"
						target="_blank"><span style="font-style:italic;color:#0000ff;">查看大图</span>
					</a> -->
					<p>
						<br />
					</p>
				</ul></li>
		</ul>

	</div>
	<!--container end-->

	<div class="box">
		<%@include file="/WEB-INF/view/client/common/footerMenu.jsp"%>
		<%@include file="/WEB-INF/view/client/common/footer.jsp"%>
	</div>
	<%@include file="/WEB-INF/view/client/common/float_right.jsp"%>
</body>
</html>