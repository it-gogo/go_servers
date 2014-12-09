<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!-- 广告浮动窗口 -->
<style>
<!--
#advertising{
    /* position:absolute; */
position:fixed; 
    left:0px;
    top:235px;
    width:97px;
    height:222px;
    padding-top:12px;
    padding-left:11px;
}
-->
</style>
<script language="JavaScript" src="<%=request.getContextPath() %>/client/js/jquery-1.8.3.min.js" type="text/javascript"  ></script>
<script type="text/javascript">
<!--
/*$(document).ready(function(){
    $(window).scroll(function(){
        var scrollTop=$(window).scrollTop()+235+"px";
        $("#advertising").animate({"top":scrollTop},100);
    });
});*/

//-->
</script>
<c:if test="${advertising!=null }">
	<div id="advertising" style="width: 200px;height: 200px;"> 
		<a href="${advertising.url }">
			<img width="200px;" height="200px;" src="<%=request.getContextPath() %>/${advertising.imgUrl }" />
		</a>
	</div>
</c:if>
