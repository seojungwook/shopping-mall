<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/jsp/jspHeader.jsp"%>
<input type="hidden" name="num" value="${param.bNo}">
<input type="hidden" name="pageNum" value="${param.pageNum}">
<table border="1">
	<tr align="center">
		<td>
			�������Աݰ��¹�ȣ
			<input type="text" name="account">
		</td>
		<td>
			�ſ�ī��
			<select name="card">
				<option value="1">����ī��</option>
				<option value="2">����ī��</option>
				<option value="3">����ī��</option>
			</select>
		</td>
		<td>
		<form action="mylist.html">
			<input type="submit" value="�����Ϸ�">
		</form>
		</td>
	</tr>
</table>