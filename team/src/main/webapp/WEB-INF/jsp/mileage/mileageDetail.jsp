<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/WEB-INF/jsp/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<table>
	<tr align="center" valign="middle">
		<td colspan="2">���ϸ��� ����/ȯ��</td>
	</tr>
	<tr>
		<td>�۾���</td><td>${mileage.mNo}</td>
	</tr>
	<tr bgcolor="#cccccc">
		<td colspan="2" style="height : 1px;"></td>
	</tr>
	<tr>
		<td>����/ȯ��</td><td>${mileage.money}</td>
	</tr>
	<tr bgcolor="#cccccc">
		<td colspan="2" style="height : 1px;"></td>
	</tr>
	<tr>
		<td>���ϸ���</td>
		<td><table border="0" width="200" height="50">
		<tr><td>${mileage.mileage}</td></tr>
		</table></td>
	</tr>
	
	<!-- 
	<tr><td align="center">÷������</td>
		<td>&nbsp;
		<c:if test="${!empty board.fileUrl}">
			<a href="../fileUpload/${board.fileUrl}">
			${board.fileUrl}
			</a>
			</c:if>
			&nbsp;</td>
			</tr>
			
			 -->
			<tr bgcolor="#cccccc">
				<td colspan="2" style="height:1px;"></td>
			</tr>
			<tr bgcolor="#cccccc" valign="middle">
				<td colspan="2">
				<a href="mileagereplyForm.html?listno=${mileage.listno }&pageNum=${param.pageNum}">[�亯]</a>&nbsp;&nbsp;
				<a href="updateForm.html?listno=${mileage.listno }&pageNum=${param.pageNum}">[����]</a>&nbsp;&nbsp;
				<a href="deleteForm.html?listno=${mileage.listno }&pageNum=${param.pageNum}">[����]</a>&nbsp;&nbsp;
				<a href="../mileage/mileageBoard.html?pageNum=${param.pageNum }">[���]</a>&nbsp;&nbsp;</td>
			</tr>
	
</table>
</body>
</html>