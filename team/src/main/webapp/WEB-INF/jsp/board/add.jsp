<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/jsp/jspHeader.jsp"%>
<form:form modelAttribute="board" action="write.html?category=${param.category }"
	enctype="multipart/form-data" name="boardform">
	<input type="hidden" name="category" value="${param.category}">
	<table cellpadding="0" cellspacing="0">
	
		<tr align="center" valign="middle">
		
			<td colspan="2">${msg}�Խ��� ���</td>
		</tr>
		<tr>
			<td height="25">�۾���</td>
			<td>${USER_KEY.nickname}</td>
			<td><input type="hidden" name="mNo" value="${USER_KEY.mNo}"></td>
		</tr>

		<tr>
			<td height="25">����</td>
			<td><form:input path="subject" /> <font color="red"><form:errors
						path="subject" /></font></td>
		</tr>
		<tr>
			<td height="25">����</td>
			<td><form:textarea path="content" cols="67" rows="15" /> <font
				color="red"><form:errors path="content" /></font></td>
		</tr>
		<tr>
			<td height="25">����÷��</td>
			<td><input type="file" name="picture"></td>
		</tr>
		<tr align="center" valign="middle">
			<td colspan="2"><a href="javascript:document.boardform.submit()">[���]</a>
				<a href="list.html?category=${param.category}">[��Ϻ���]</a></td>
		</tr>
	</table>
</form:form>
<table>
	<!--  <tr>
		<td height="25">����Ȯ�� ��й�ȣ</td>
		<td><input type="password" name="pass" /> <!--  <font color="red"><form:errors path="pass" /></font>
		</td>
	</tr>-->
</table>