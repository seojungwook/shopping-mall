<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/jsp/jspHeader.jsp"%>
<script>
function file_delete(){
	document.updateform.picture2.value ="";
	document.getElementById("file_desc").innerHTML ="";
	}
</script>
<form:form modelAttribute="board" 
    action="modify.html?pageNum=${param.pageNum }&category=${param.category}" method="post"
	enctype="multipart/form-data" name="updateform">
	<input type="hidden" name="picture2" value="${board.fileUrl}"/>
	<form:hidden path="no" />
	<form:hidden path="nickname" />
	<table cellspacing="0" cellpadding="0" border="0">
		<tr align="center" valign="middle">
			<td colspan="2">게시글 수정</td>
		</tr>
		<tr>
			<td height="16px" align="center">제목</td>
			<td><form:input path="subject" /><font color="red"><form:errors
						path="subject" /></font></td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td><form:textarea cols="60" rows="20" path="content" /> <font color="red"><form:errors
						path="content" /></font></td>
		</tr>
		<tr>
			<td align="center">첨부파일</td>
			<td>&nbsp; <c:if test="${!empty board.fileUrl}">
					<div id="file_desc">
						<a href="../fileUpload/${board.fileUrl }">${board.fileUrl}</a>&nbsp;
						<a href="javascript:file_delete()">[첨부파일 삭제]</a>
					</div>
				</c:if> <input type="file" name="picture" id="picture"></td>
				</tr>
				
		<tr align="center" valign="middle">
		<td colspan="2">
		<a href="javascript:document.updateform.submit();">[수정]</a>&nbsp;
		<a href="list.html?pageNum=${param.pagNum}&category=${param.category}">[게시글 목록]</a>
		</td></tr>
	</table></form:form>