<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/jsp/jspHeader.jsp"%>
<form:form method="post" action="delete.html?no=${param.no }&pageNum=${param.pageNum }&category=${param.category}">
<table border="0">
<tr><td>�Խñ� ��й�ȣ:<input type="password" name="inputpass"></td>
<tr><td colspan="2" align="center"><input type="submit" value="����">
<input type="button" onclick="history.go(-1)" value="���ư���"></td>
</tr>
</table>
</form:form>