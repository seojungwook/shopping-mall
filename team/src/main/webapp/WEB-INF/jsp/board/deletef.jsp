<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/jsp/jspHeader.jsp"%>
<form:form method="post" action="delete.html?no=${param.no }&pageNum=${param.pageNum }&category=${param.category}">
<table border="0">
<tr><td>게시글 비밀번호:<input type="password" name="inputpass"></td>
<tr><td colspan="2" align="center"><input type="submit" value="삭제">
<input type="button" onclick="history.go(-1)" value="돌아가기"></td>
</tr>
</table>
</form:form>