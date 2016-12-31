<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/jsp/jspHeader.jsp"%>
<form:form modelAttribute="board" action="write.html?category=${param.category }"
	enctype="multipart/form-data" name="boardform">
	<input type="hidden" name="category" value="${param.category}">
	<table cellpadding="0" cellspacing="0">
	
		<tr align="center" valign="middle">
		
			<td colspan="2">${msg}게시판 등록</td>
		</tr>
		<tr>
			<td height="25">글쓴이</td>
			<td>${USER_KEY.nickname}</td>
			<td><input type="hidden" name="mNo" value="${USER_KEY.mNo}"></td>
		</tr>

		<tr>
			<td height="25">제목</td>
			<td><form:input path="subject" /> <font color="red"><form:errors
						path="subject" /></font></td>
		</tr>
		<tr>
			<td height="25">내용</td>
			<td><form:textarea path="content" cols="67" rows="15" /> <font
				color="red"><form:errors path="content" /></font></td>
		</tr>
		<tr>
			<td height="25">파일첨부</td>
			<td><input type="file" name="picture"></td>
		</tr>
		<tr align="center" valign="middle">
			<td colspan="2"><a href="javascript:document.boardform.submit()">[등록]</a>
				<a href="list.html?category=${param.category}">[목록보기]</a></td>
		</tr>
	</table>
</form:form>
<table>
	<!--  <tr>
		<td height="25">본인확인 비밀번호</td>
		<td><input type="password" name="pass" /> <!--  <font color="red"><form:errors path="pass" /></font>
		</td>
	</tr>-->
</table>