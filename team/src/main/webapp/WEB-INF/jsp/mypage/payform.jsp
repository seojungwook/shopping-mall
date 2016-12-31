<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/jsp/jspHeader.jsp"%>
<input type="hidden" name="num" value="${param.bNo}">
<input type="hidden" name="pageNum" value="${param.pageNum}">
<table border="1">
	<tr align="center">
		<td>
			무통장입금계좌번호
			<input type="text" name="account">
		</td>
		<td>
			신용카드
			<select name="card">
				<option value="1">국민카드</option>
				<option value="2">신한카드</option>
				<option value="3">농협카드</option>
			</select>
		</td>
		<td>
		<form action="mylist.html">
			<input type="submit" value="결제완료">
		</form>
		</td>
	</tr>
</table>