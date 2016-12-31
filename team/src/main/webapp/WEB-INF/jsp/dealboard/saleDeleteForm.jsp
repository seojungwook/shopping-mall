<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/jsp/jspHeader.jsp" %>
<form name = "saleDelete" action="saleDelete.html" method="post">
	<input type="hidden" name="num" value="${param.num}">
	<input type="hidden" name="pageNum" value="${param.pageNum}">
	<input type="hidden" name="category" value="${param.category}">
	<input type="hidden" name="dealcheck" value="${param.dealcheck}">
	<h2 align="center">삭제하시겠습니까?</h2>
	<hr>
	<table align="center">
		<tr>
			<td colspan="2">
				<a href="javascript:document.saleDelete.submit()" style="text-decoration: none">[삭제]</a> &nbsp;&nbsp;&nbsp;
				<a href="saleList_1.html?pageNum=${pageNum}&category=${param.category}&dealcheck=${dealboard.dealcheck}" style="text-decoration: none" style="text-decoration: none">[목록]</a>
			</td>
		</tr>
	</table>
</form>