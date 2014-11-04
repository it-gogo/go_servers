<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>


<table width="100%" border="0" cellpadding="10" cellspacing="0">
	  <tr>
	    <td>显示: <a href="${pageurl }?pageSize=10">10</a> <a href="${pageurl }?pageSize=25">25</a> <a href="${pageurl }?pageSize=50">50</a> <a href="${pageurl }?pageSize=100">100</a> </td>
	    <td align="right">
	    	<c:if test="${pb.hasPreviousPage }">
	    	<a href="${pageurl }?page=${pb.curentPage-1 }&pageSize=${pb.pageSize}">&laquo; 上一页 &nbsp; </a>
	    	</c:if>
	    	<c:if test="${!pb.hasPreviousPage }">
	    	&laquo; 上一页 &nbsp; 
	    	</c:if>
	    	<c:if test="${pb.hasNextPage }">
	    	<a href="${pageurl }?page=${pb.curentPage+1 }&pageSize=${pb.pageSize}">下一页 &raquo;</a>
	    	</c:if>
	    	<c:if test="${!pb.hasNextPage }">
	    	下一页 &raquo;
	    	</c:if>
	    </td>
	  </tr>
</table><br />